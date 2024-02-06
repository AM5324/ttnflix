import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/logic/authentication/authentic_cubit.dart';
import 'package:ttn_flix/navigation/ttn_flix_navigation.gr.dart';
import 'package:ttn_flix/presentation/login/widget/button.dart';
import 'package:ttn_flix/presentation/login/widget/edit_text.dart';
import 'package:ttn_flix/presentation/login/widget/edt_password_text.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';
import 'package:ttn_flix/presentation/widget/ttn_flix_date_picker.dart';
import 'package:ttn_flix/presentation/widget/ttn_flix_drop_down.dart';
import 'package:ttn_flix/utils/ttn_flix_constant.dart';

import '../../data/models/gender.dart';
import '../../data/models/user.dart';
import '../../utils/validator.dart';
import '../widget/ttn_flix_header.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _dobEditingController = TextEditingController();
  final TextEditingController _genderEditingController =
      TextEditingController();
  final TextEditingController _confirmPasswordEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final cubit = AuthenticCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getUserList(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocListener<AuthenticCubit, AuthenticState>(
            listener: (context, state) {
              if (state is LoginError) {
                SnackBar snackBar = SnackBar(
                    content: Text(
                        state.message ?? TTNFlixConstants.somethingWentWrong));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else if (state is RegisterSuccessState) {
                SnackBar snackBar =
                    const SnackBar(content: Text(TTNFlixConstants.accCreated));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                context.router.push(LogInScreenRoute());
              }
            },
            child: Container(
              margin: const EdgeInsets.all(TTNFlixSpacing.spacing16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TTNFlixHeader(),
                  const SizedBox(height: TTNFlixSpacing.spacing24),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        EdtTextField(
                          textEditingController: _nameEditingController,
                          prefixIcon: const Icon(Icons.person),
                          label: TTNFlixConstants.name,
                          validator: (value) {
                            return Validator.isValidName(context, name: value);
                          },
                          textInputType: TextInputType.name,
                        ),
                        EdtTextField(
                          textEditingController: _emailEditingController,
                          prefixIcon: const Icon(Icons.email),
                          label: TTNFlixConstants.username,
                          validator: (value) {
                            return Validator.isEmailValid(context,
                                email: value);
                          },
                          textInputType: TextInputType.emailAddress,
                        ),
                        EdtTextField(
                          textEditingController: _dobEditingController,
                          readOnly: true,
                          prefixIcon: const Icon(Icons.calendar_month),
                          label: TTNFlixConstants.dob,
                          onTap: () {
                            TtnFlixDatePicker(context, date: (date) {
                              _dobEditingController.text = date;
                            }).show();
                          },
                        ),
                        TtnFlixDropdown(
                          hintText: TTNFlixConstants.gender,
                          prefixIcon: const Icon(Icons.male),
                          dropDownData: getDropDownData(context),
                          onChanged: (value) {
                            _genderEditingController.text = value!;
                          },
                        ),
                        EdtPasswordField(
                          textEditingController: _passwordEditingController,
                          prefixIcon: const Icon(Icons.password),
                          hint: TTNFlixConstants.password,
                          validator: (value) {
                            return Validator.isValidPassword(context,
                                password: value);
                          },
                          textInputType: TextInputType.visiblePassword,
                        ),
                        EdtPasswordField(
                          textEditingController:
                              _confirmPasswordEditingController,
                          prefixIcon: const Icon(Icons.password),
                          hint: TTNFlixConstants.conPassword,
                          validator: (value) {
                            return Validator.isValidConfirmPassword(context,
                                password: _passwordEditingController.text,
                                matchPassword: value);
                          },
                        ),
                        const SizedBox(
                          height: TTNFlixSpacing.spacing8,
                        ),
                        Button(
                            onClick: () {
                              _validateForm();
                            },
                            buttonText: TTNFlixConstants.signUp),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(TTNFlixConstants.alreadyHaveAcc, style: TextStyle(color: Colors.white),),
                      TextButton(
                        onPressed: () {
                          context.router.push(LogInScreenRoute());
                        },
                        child: Text(
                          TTNFlixConstants.logIn,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.redAccent),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validateForm() async {
    if (_formKey.currentState?.validate() == true) {
      SystemChannels.textInput.invokeMethod("TextInput.hide");
      UserModel user = UserModel(
          username: _emailEditingController.text,
          password: _passwordEditingController.text,
          dob: _dobEditingController.text,
          gender: _genderEditingController.text,
          name: _nameEditingController.text);
      cubit.saveUser(user);
    }
  }

  List<DropdownMenuItem<String>> getDropDownData(BuildContext context) {
    var gender = [
      Gender("male", '1'),
      Gender("female", '2'),
      Gender("others", '3')
    ];
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (var element in gender) {
      dropdownItems.add(DropdownMenuItem(
        value: element.id,
        child: Text(
          element.name,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.grey, fontWeight: FontWeight.w100),
        ),
      ));
    }
    return dropdownItems;
  }
}
