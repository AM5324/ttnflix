part of 'favourite_cubit.dart';

abstract class FavouriteState extends TTNFlixDefaultEquatable {}

class FavoriteLoading extends FavouriteState {}

class FavoriteLoaded extends FavouriteState {
  final List<Results>? gridList;


  FavoriteLoaded(
      {
        this.gridList});

  FavoriteLoaded copyWith(
      {
        final List<Results>? gridList}) =>
      FavoriteLoaded(
          gridList: gridList ?? this.gridList);

  @override
  List<Object?> get props =>
      [gridList];
}

class FavoriteError extends FavouriteState {
  final String errorMessage;
  FavoriteError(this.errorMessage);
}

class HomeScrollControllerInitialized extends FavouriteState {
  final ScrollController scrollController;
  HomeScrollControllerInitialized(this.scrollController);
}
