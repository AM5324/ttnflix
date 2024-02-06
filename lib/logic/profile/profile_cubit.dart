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

  // saveUser(UserModel user) async {
  //   user.password = currentUser.password;
  //   await manager.removeList('currentUser');
  //   await manager.saveObject('currentUser', user);
  //   currentUser = manager.getObject('currentUser', UserModel.fromJson)!;
  //   emit(ProfileSuccessState().copyWith(isUpdate: true));
  // }

  saveUser(UserModel user) async {
    try {
      user.password = currentUser.password;

      // Assuming removeList is not the correct method to remove an object,
      // you may need to use a different method or check the documentation.
      await manager.removeList('currentUser');

      await manager.saveObject('currentUser', user);
      currentUser = manager.getObject('currentUser', UserModel.fromJson)!;

      emit(ProfileSuccessState(currentUser: currentUser, isUpdate: true));
    } catch (error) {
      // Handle errors appropriately (e.g., print or log the error)
      print('Error in saveUser: $error');
    }
  }

}
