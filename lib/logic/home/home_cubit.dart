import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ttn_flix/data/network/helper/ttn_flix_status.dart';
import 'package:ttn_flix/data/repositories/home_repositories.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(const HomeState());
  final HomeRepository _homeRepository;


}
