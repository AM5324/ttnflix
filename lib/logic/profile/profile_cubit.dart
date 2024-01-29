import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/di/ttn_flix_service_locator.dart';
import '../../data/models/user.dart';
import '../../data/shared_prefernce/shared_prefernce_manager.dart';
import '../../utils/ttn_flix_default_equatable.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final SharedPreferencesManager manager;

  ProfileCubit({SharedPreferencesManager? sharedPref})
      : manager = sharedPref ?? TTNFlixSL.get<SharedPreferencesManager>(),
        super(ProfileInitial());
  UserModel currentUser = UserModel();

  getUser() async {
    currentUser = manager.getObject('currentUser', UserModel.fromJson)!;
    emit(ProfileSuccessState(currentUser: currentUser, isUpdate: true));
    print('currentUser : $currentUser');
  }

  updateUser(UserModel user) async {
    emit(ProfileSuccessState().copyWith(currentUser: user, isUpdate: false));
  }

  saveUser(UserModel user) async {
    user.password = currentUser.password;
    await manager.removeList('currentUser');
    await manager.saveObject('currentUser', user);
    getUser();
  }
}
