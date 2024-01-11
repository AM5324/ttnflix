import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/data/models/movie.dart';
import 'package:ttn_flix/data/network/api/api_endpoint.dart';
import 'package:ttn_flix/data/repositories/home_repositories.dart';
import 'package:ttn_flix/utils/ttn_flix_default_equatable.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeLoading());

  final HomeRepository _homeRepository;
  Timer? _timer;
  final PageController pageController = PageController();

  Future<void> fetchMoviesData(int pageNo) async {
    var carouselList = await _homeRepository.getMoviesData(pageNo);
    var gridList = await _homeRepository.getMoviesData(++pageNo);

    emit(HomeLoaded(
      carouselList: carouselList.results,
      gridList: gridList.results,
      currentPage: gridList.page,
      carouselCurrentPage: 0,
      isPageEnd: false,
      totalPages: gridList.totalPages,
    ));

    _setupCarousalAutomaticRotation();
  }

  Future<void> fetchGridListPagination(int pageNo) async {
    var homeLoadedState = state as HomeLoaded;
    emit(homeLoadedState.copyWith(isPageEnd: true));

    var gridList = await _homeRepository.getMoviesData(pageNo);
    homeLoadedState.gridList?.addAll(gridList.results ?? []);

    emit(homeLoadedState.copyWith(
      gridList: homeLoadedState.gridList,
      currentPage: gridList.page,
      totalPages: gridList.totalPages,
      isPageEnd: false,
    ));
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
}
