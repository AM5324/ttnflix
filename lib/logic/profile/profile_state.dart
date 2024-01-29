part of 'profile_cubit.dart';

abstract class ProfileState extends TTNFlixDefaultEquatable {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccessState extends ProfileState {
  final UserModel? currentUser;
  final bool? isUpdate;
  ProfileSuccessState({this.currentUser, this.isUpdate});

  ProfileSuccessState copyWith(
          {final UserModel? currentUser, final bool? isUpdate}) =>
      ProfileSuccessState(
        currentUser: currentUser ?? this.currentUser,
        isUpdate: isUpdate ?? isUpdate,
      );

  @override
  List<Object?> get props => [currentUser, isUpdate];
}

class ProfileError extends ProfileState {
  ProfileError(this.message);

  String? message;

  @override
  List<Object> get props => [];
}
