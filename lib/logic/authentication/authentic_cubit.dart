import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/data/models/user.dart';

import '../../data/di/ttn_flix_service_locator.dart';
import '../../data/shared_prefernce/shared_prefernce_manager.dart';
import '../../utils/ttn_flix_default_equatable.dart';

part 'authentic_state.dart';

class AuthenticCubit extends Cubit<AuthenticState> {
  final SharedPreferencesManager manager;
  AuthenticCubit({SharedPreferencesManager? sharedPref})
      : manager = sharedPref ?? TTNFlixSL.get<SharedPreferencesManager>(),super(AuthenticateInitial());

  List<UserModel> savedUserList = [];
  getUserList() async {
    savedUserList = manager.getList<UserModel>('userList', UserModel.fromJson);}

   login(UserModel userModel) async {
    // Iterate over the savedUserList using a for loop
    for (UserModel user in savedUserList) {
      if (userModel.username == user.username &&
          userModel.password == user.password) {
       await manager.saveObject('currentUser', user);
        return emit(LoginSuccessState(userModel));
      }
    }
    emit(LoginError("Invalid Credentials"));
  }

  void saveUser(UserModel userModel) async {
    // Iterate over the savedUserList using a for loop
    for (UserModel user in savedUserList) {
      if (userModel.username == user.username) {
        return emit(LoginError("Email is already registered"));
      }
    }
    savedUserList.add(userModel);
    await manager.removeList('userList');
    await manager.saveList(
        'userList', savedUserList.map((user) => user.toJson()).toList());
    getUserList();
    emit(RegisterSuccessState());
  }
}
