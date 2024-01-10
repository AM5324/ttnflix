part of 'home_cubit.dart';

abstract class HomeState extends TTNFlixDefaultEquatable {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Results>? carouselList;
  final List<Results>? gridList;
  final int? currentPage;

  HomeLoaded({this.carouselList, this.gridList, this.currentPage});

  HomeLoaded copyWith({
    final List<Results>? carouselList,
    final List<Results>? gridList,
    final int? currentPage,
  }) =>
      HomeLoaded(
        carouselList: carouselList ?? this.carouselList,
        gridList: gridList ?? this.gridList,
        currentPage: currentPage ?? this.currentPage,
      );

  @override
  List<Object?> get props => [
        carouselList,
        gridList,
        currentPage,
      ];
}

class HomeError extends HomeState {
  final String errorMessage;
  HomeError(this.errorMessage);
}
