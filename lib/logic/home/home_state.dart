part of 'home_cubit.dart';


abstract class HomeState extends TTNFlixDefaultEquatable {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {}

class HomeError extends HomeState {
  final String errorMessage;
  HomeError(this.errorMessage);
}
