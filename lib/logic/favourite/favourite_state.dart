part of 'favourite_cubit.dart';

abstract class FavouriteState extends TTNFlixDefaultEquatable {}

class FavoriteLoading extends FavouriteState {}

class FavoriteInitial extends FavouriteState {}

class FavoriteLoaded extends FavouriteState {
  final List<Results>? favouriteList;


  FavoriteLoaded(
      {
        this.favouriteList});

  FavoriteLoaded copyWith(
      {
        final List<Results>? favouriteList}) =>
      FavoriteLoaded(
          favouriteList: favouriteList ?? this.favouriteList);

  @override
  List<Object?> get props =>
      [favouriteList];
}

class FavoriteError extends FavouriteState {
  final String errorMessage;
  FavoriteError(this.errorMessage);
}

class HomeScrollControllerInitialized extends FavouriteState {
  final ScrollController scrollController;
  HomeScrollControllerInitialized(this.scrollController);
}
