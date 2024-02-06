import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/data/models/gender.dart';
import 'package:ttn_flix/logic/profile/profile_cubit.dart';
import 'package:ttn_flix/navigation/ttn_flix_navigation.gr.dart';
import 'package:ttn_flix/presentation/login/widget/button.dart';
import 'package:ttn_flix/presentation/login/widget/edit_text.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';
import 'package:ttn_flix/presentation/widget/ttn_flix_date_picker.dart';
import 'package:ttn_flix/presentation/widget/ttn_flix_drop_down.dart';
import 'package:ttn_flix/utils/ttn_flix_constant.dart';

import '../../data/models/user.dart';
import '../../generated/flutter_gen/assets.gen.dart';
import '../../utils/validator.dart';
import '../themes/ttn_flix_text_style.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _dobEditingController = TextEditingController();
  final TextEditingController _genderEditingController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          TTNFlixConstants.profile,
          style: TTNFlixTextStyle.defaultTextTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileSuccessState) {
              return Container(
                margin: const EdgeInsets.all(TTNFlixSpacing.spacing16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: TTNFlixSpacing.spacing30),
                    Image.asset(
                      Assets.icons.icUser.path,
                      width: TTNFlixSpacing.spacing100,
                      height: TTNFlixSpacing.spacing100,
                      color: state.currentUser?.gender ==
                              TTNFlixConstants.maleColor
                          ? Colors.blue
                          : state.currentUser?.gender ==
                                  TTNFlixConstants.femaleColor
                              ? Colors.pink
                              : Colors.amber,
                    ),
                    const SizedBox(height: TTNFlixSpacing.spacing24),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          EdtTextField(
                            textEditingController: _nameEditingController,
                            prefixIcon: const Icon(Icons.person),
                            label: state.currentUser?.name ??
                                TTNFlixConstants.name,
                            validator: (value) {
                              return Validator.isValidName(context,
                                  name: value);
                            },
                            readOnly: state.isUpdate ?? false,
                            textInputType: TextInputType.name,
                          ),
                          EdtTextField(
                            textEditingController: _emailEditingController,
                            prefixIcon: const Icon(Icons.email),
                            label: state.currentUser?.username ??
                                TTNFlixConstants.username,
                            validator: (value) {
                              return Validator.isEmailValid(context,
                                  email: value);
                            },
                            textInputType: TextInputType.emailAddress,
                            readOnly: false,
                          ),
                          EdtTextField(
                            textEditingController: _dobEditingController,
                            prefixIcon: const Icon(Icons.calendar_month),
                            label:
                                state.currentUser?.dob ?? TTNFlixConstants.dob,
                            onTap: () {
                              if (state.isUpdate != null &&
                                  state.isUpdate == false) {
                                TtnFlixDatePicker(context, date: (date) {
                                  _dobEditingController.text = date;
                                }).show();
                              }
                            },
                            readOnly: state.isUpdate ?? false,
                          ),
                          TtnFlixDropdown(
                            currentValue: state.currentUser?.gender ?? '3',
                            hintText: state.currentUser?.gender ??
                                TTNFlixConstants.gender,
                            prefixIcon: const Icon(Icons.male),
                            dropDownData: getDropDownData(context),
                            onChanged: (value) {
                              _genderEditingController.text = value!;
                            },
                            readOnly: (state.isUpdate != null &&
                                    state.isUpdate == true)
                                ? true
                                : false,
                          ),
                          const SizedBox(
                            height: TTNFlixSpacing.spacing8,
                          ),
                          Button(
                            onClick: () {
                              if (state.isUpdate != null &&
                                  state.isUpdate == true) {
                                _emailEditingController.text =
                                    state.currentUser?.username ?? '';
                                _nameEditingController.text =
                                    state.currentUser?.name ?? '';
                                _dobEditingController.text =
                                    state.currentUser?.dob ?? '';
                                _genderEditingController.text =
                                    state.currentUser?.gender ?? '';
                                BlocProvider.of<ProfileCubit>(context)
                                    .updateUser(state.currentUser!);
                              } else {
                                _validateForm(state.currentUser, context);
                                var snackbar = const SnackBar(
                                    content: Text(TTNFlixConstants.updated));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar);
                              }
                            },
                            buttonText:
                                (state.isUpdate != null && state.isUpdate!)
                                    ? TTNFlixConstants.update
                                    : TTNFlixConstants.save,
                          ),
                          const SizedBox(
                            height: TTNFlixSpacing.spacing10,
                          ),
                          Button(
                            onClick: () {
                              context.router.push(LogInScreenRoute());
                            },
                            buttonText: TTNFlixConstants.logout,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  void _validateForm(UserModel? currentUser, BuildContext context) async {
    if (_formKey.currentState?.validate() == true) {
      SystemChannels.textInput.invokeMethod("TextInput.hide");
      UserModel user = UserModel(
          username: _emailEditingController.text.isNotEmpty
              ? _emailEditingController.text
              : currentUser?.username,
          name: _nameEditingController.text.isNotEmpty
              ? _nameEditingController.text
              : currentUser?.name,
          password: currentUser?.password,
          dob: _dobEditingController.text.isNotEmpty
              ? _dobEditingController.text
              : currentUser?.dob,
          gender: _genderEditingController.text.isNotEmpty
              ? _genderEditingController.text
              : currentUser?.gender);
      BlocProvider.of<ProfileCubit>(context).saveUser(user);
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
