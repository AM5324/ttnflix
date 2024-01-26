part of 'authentic_cubit.dart';


abstract class AuthenticState  extends TTNFlixDefaultEquatable {}

class AuthenticateInitial extends AuthenticState {}

class AuthenticateLoading extends AuthenticState {}

class LoginSuccessState extends AuthenticState {
  final UserModel currentUser;
  LoginSuccessState(this.currentUser);
}
class RegisterSuccessState extends AuthenticState { }

class LoginError extends AuthenticState {
  LoginError(this.message);

  String? message;

  @override
  List<Object> get props => [];
}
