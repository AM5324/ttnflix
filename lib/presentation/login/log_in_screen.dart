import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/data/models/user.dart';
import 'package:ttn_flix/logic/authentication/authentic_cubit.dart';
import 'package:ttn_flix/navigation/ttn_flix_navigation.gr.dart';
import 'package:ttn_flix/presentation/login/widget/button.dart';
import 'package:ttn_flix/presentation/login/widget/edit_text.dart';
import 'package:ttn_flix/presentation/login/widget/edt_password_text.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';
import 'package:ttn_flix/presentation/widget/ttn_flix_header.dart';
import 'package:ttn_flix/utils/ttn_flix_constant.dart';

import '../../utils/validator.dart';

@RoutePage()
class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();
  final cubit = AuthenticCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => cubit..getUserList(),
  child: Scaffold(
      body: BlocConsumer<AuthenticCubit, AuthenticState>(
  listener: (context, state) {
    if (state is LoginError) {
      SnackBar snackBar = SnackBar(
          content: Text(state.message ?? '')
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (state is LoginSuccessState) {
      context.router.pop();
      context.router.push(const TTNFlixBottomBarRoute());
    }
  },
  builder: (context, state) {
    return WillPopScope(
      onWillPop: () async{return false;},
      child: Container(
          margin: const EdgeInsets.all(TTNFlixSpacing.spacing20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Welcome Section
              const TTNFlixHeader(),
              // Login Section
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    EdtTextField(
                      textEditingController: _emailEditingController,
                      prefixIcon: const Icon(Icons.email),
                      label: TTNFlixConstants.username,
                      validator: (value) {
                        return Validator.isEmailValid(context, email: value);
                      },
                      textInputType: TextInputType.emailAddress,
                    ),
                    EdtPasswordField(
                      textEditingController: _passwordEditingController,
                      prefixIcon: const Icon(Icons.password),
                      hint: TTNFlixConstants.password,
                      validator: (value) {
                        return Validator.isValidPassword(context, password: value);
                      },
                      textInputType: TextInputType.visiblePassword,
                    ),
                    Button(
                      onClick: () {
                        _validateForm(context);
                      },
                      buttonText: TTNFlixConstants.logIn,
                    ),
                  ],
                ),
              ),

              // Sign Up Section
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TTNFlixConstants.dontHaveAcc,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {
                      context.router.push(RegisterScreenRoute());
                    },
                    child: Text(
                      TTNFlixConstants.signUp,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.redAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
    );
  },
),

    ),
);
  }

  void _validateForm(BuildContext context) async {
    if (_formKey.currentState?.validate() == true) {
      SystemChannels.textInput.invokeMethod("TextInput.hide");
      UserModel user = UserModel(username: _emailEditingController.text, password: _passwordEditingController.text);
      cubit.login(user);
    }
  }
}
