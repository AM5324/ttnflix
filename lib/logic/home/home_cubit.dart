import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/data/models/movie.dart';
import 'package:ttn_flix/data/network/api/api_endpoint.dart';
import 'package:ttn_flix/data/repositories/home_repositories.dart';
import 'package:ttn_flix/utils/ttn_flix_default_equatable.dart';

import '../../data/di/ttn_flix_service_locator.dart';
import '../../data/models/user.dart';
import '../../data/shared_prefernce/shared_prefernce_manager.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeLoading());

  final HomeRepository _homeRepository;
  Timer? _timer;
  final PageController pageController = PageController();
  SharedPreferencesManager manager = TTNFlixSL.get<SharedPreferencesManager>();
  UserModel currentUser = UserModel();

  List<Results> favouriteList = [];

  getFavouriteList() async {
    favouriteList = manager.getList<Results>('favouriteList', Results.fromJson);
    print('FavList: $favouriteList');
  }

  getUser() async {
    currentUser = manager.getObject('currentUser', UserModel.fromJson)!;
    print('currentUser : $currentUser');
  }

  Future<void> fetchMoviesData(int pageNo) async {
    getFavouriteList();
    var carouselList = await _homeRepository.getMoviesData(pageNo);
    var gridList = await _homeRepository.getMoviesData(++pageNo);

    checkFavourites(favouriteList, carouselList.results, gridList.results,
        gridList.page, gridList.totalPages, false, false);
    getUser();
  }

  Future<void> fetchGridListPagination(int pageNo) async {
    var homeLoadedState = state as HomeLoaded;
    emit(homeLoadedState.copyWith(isPageEnd: true));

    var gridList = await _homeRepository.getMoviesData(pageNo);
    homeLoadedState.gridList?.addAll(gridList.results ?? []);
    checkFavourites(favouriteList, null, homeLoadedState.gridList,
        gridList.page, gridList.totalPages, false, true);
  }

  void _setupCarousalAutomaticRotation() {
    if (state is HomeLoaded) {
      const Duration duration = ApiEndpoint.carouselTimeout;

      _timer = Timer.periodic(duration, (Timer timer) {
        var currentState = state as HomeLoaded;
        var nextPage = (currentState.carouselCurrentPage! + 1) %
            currentState.carouselList!.length;

        emit(currentState.copyWith(carouselCurrentPage: nextPage));
        pageController.animateToPage(
          nextPage,
          duration: ApiEndpoint.carouselAnimateTimeout,
          curve: Curves.slowMiddle,
        );
      });
    }
  }

  void loadMore() {
    if (state is HomeLoaded) {
      var currentState = state as HomeLoaded;

      if (!currentState.isPageEnd! &&
          currentState.totalPages! >= currentState.currentPage!) {
        int currentPage = currentState.currentPage!;
        fetchGridListPagination(++currentPage);
      }
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void updateDotIndicator(int pageNo) {
    if (state is HomeLoaded) {
      var currentState = state as HomeLoaded;
      emit(currentState.copyWith(carouselCurrentPage: pageNo));
    }
  }

  void checkFavourites(
      List<Results> favouriteList,
      List<Results>? carouselList,
      List<Results>? gridList,
      int? page,
      int? totalPages,
      bool? isFav,
      bool isPagination) {
    if (favouriteList != null && favouriteList.isNotEmpty) {
      if (carouselList != null) {
        for (Results carouselItem in carouselList) {
          if (favouriteList.any((favItem) => favItem.id == carouselItem.id)) {
            carouselItem.isFavourite = true;
          }
        }
      }

      if (gridList != null) {
        for (Results gridItem in gridList) {
          if (favouriteList.any((favItem) => favItem.id == gridItem.id)) {
            gridItem.isFavourite = true;
          }
        }
      }
    }
    if (!isPagination) {
      emit(HomeLoaded(
        carouselList: carouselList,
        gridList: gridList,
        currentPage: page,
        carouselCurrentPage: 0,
        isPageEnd: false,
        totalPages: totalPages,
      ));
    } else {
      var homeLoadedState = state as HomeLoaded;
      emit(homeLoadedState.copyWith(
        gridList: homeLoadedState.gridList,
        currentPage: page,
        totalPages: totalPages,
        isPageEnd: false,
      ));
    }
    if (isFav != null && isFav == false) {
      _setupCarousalAutomaticRotation();
    }
  }

  saveFavourite(Results results) async {
    var homeLoadedState = state as HomeLoaded;
    var isFav = true;
    if (results.isFavourite != null && results.isFavourite == true) {
      for (Results favResults in favouriteList) {
        if (favResults.id == results.id) {
          results.isFavourite = null;
          favouriteList.remove(favResults);
        }
      }
    } else {
      results.isFavourite = true;
      favouriteList.add(results);
    }
    await manager.removeList('favouriteList');
    await manager.saveList(
        'favouriteList', favouriteList.map((fav) => fav.toJson()).toList());
    getFavouriteList();
    checkFavourites(
        favouriteList,
        homeLoadedState.carouselList,
        homeLoadedState.gridList,
        homeLoadedState.currentPage,
        homeLoadedState.totalPages,
        isFav,
        false);
  }
}
