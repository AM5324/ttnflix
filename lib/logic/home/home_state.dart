part of 'home_cubit.dart';

abstract class HomeState extends TTNFlixDefaultEquatable {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Results>? carouselList;
  final List<Results>? gridList;
  final int? currentPage;
  final int? carouselCurrentPage;
  final bool? isPageEnd;
  final int? totalPages;

  HomeLoaded(
      {this.carouselList,
      this.gridList,
      this.currentPage,
      this.carouselCurrentPage,
      this.isPageEnd,
      this.totalPages});

  HomeLoaded copyWith(
          {final List<Results>? carouselList,
          final List<Results>? gridList,
          final int? currentPage,
          final int? carouselCurrentPage,
          final bool? isPageEnd,
          final int? totalPages}) =>
      HomeLoaded(
          carouselList: carouselList ?? this.carouselList,
          gridList: gridList ?? this.gridList,
          currentPage: currentPage ?? this.currentPage,
          carouselCurrentPage: carouselCurrentPage ?? this.carouselCurrentPage,
          isPageEnd: isPageEnd ?? this.isPageEnd,
          totalPages: totalPages ?? this.totalPages);

  @override
  List<Object?> get props =>
      [carouselList, gridList, currentPage, carouselCurrentPage, isPageEnd, totalPages];
}

class HomeError extends HomeState {
  final String errorMessage;
  HomeError(this.errorMessage);
}

class HomeScrollControllerInitialized extends HomeState {
  final ScrollController scrollController;
  HomeScrollControllerInitialized(this.scrollController);
}
