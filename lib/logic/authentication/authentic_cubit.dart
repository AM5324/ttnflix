
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/data/models/user.dart';

import '../../data/di/ttn_flix_service_locator.dart';
import '../../data/shared_prefernce/shared_prefernce_manager.dart';
import '../../utils/ttn_flix_default_equatable.dart';

part 'authentic_state.dart';

class AuthenticCubit extends Cubit<AuthenticState> {
  AuthenticCubit() : super(AuthenticateInitial());
  SharedPreferencesManager manager = TTNFlixSL.get<SharedPreferencesManager>();

  void login(UserModel userModel) async {
    List<UserModel> savedUserList = manager.getList<UserModel>('userList', UserModel.fromJson);
    // Iterate over the savedUserList using a for loop
    for (UserModel user in savedUserList) {
     if(userModel.username == user.username && userModel.password == user.password){
       return emit(LoginSuccessState());
     }
    }
    emit(LoginError("Invalid Credentials"));
  }



}
