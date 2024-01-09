import 'package:bloc/bloc.dart';
import 'package:ttn_flix/data/repositories/home_repositories.dart';
import 'package:ttn_flix/utils/ttn_flix_default_equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepository) : super(HomeLoading());
  final HomeRepository _homeRepository;


}
