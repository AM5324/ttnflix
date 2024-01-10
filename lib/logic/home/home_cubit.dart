import 'package:bloc/bloc.dart';
import 'package:ttn_flix/data/models/movie.dart';
import 'package:ttn_flix/data/repositories/home_repositories.dart';
import 'package:ttn_flix/utils/ttn_flix_default_equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeLoading());
  final HomeRepository _homeRepository;

  Future<void> fetchMoviesData(int pageNo) async {
  var carouselList = await _homeRepository.getMoviesData(pageNo);
  var gridList = await _homeRepository.getMoviesData(++pageNo);
  emit(HomeLoaded(carouselList: carouselList.results, gridList:  gridList.results, currentPage: gridList.page));
}
}
