part of 'home_cubit.dart';



class HomeState extends Equatable {
  final TTNFlixStatus status;

  const HomeState({this.status = TTNFlixStatus.initial});

  HomeState copyWith({
    TTNFlixStatus? status
}){
    return HomeState(
      status: status ?? this.status
    );
  }
  @override
  // TODO: implement props
  List<Object?> get props => [status];

}
