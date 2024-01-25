import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ttn_flix/data/di/ttn_flix_service_locator.dart';
import 'package:ttn_flix/navigation/ttn_flix_navigation.gr.dart';
import 'package:ttn_flix/presentation/login/widget/button.dart';
import 'package:ttn_flix/presentation/login/widget/edit_text.dart';
import 'package:ttn_flix/presentation/login/widget/edt_password_text.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';
import 'package:ttn_flix/presentation/widget/ttn_flix_date_picker.dart';
import 'package:ttn_flix/presentation/widget/ttn_flix_drop_down.dart';

import '../../data/models/gender.dart';
import '../../data/models/user.dart';
import '../../data/shared_prefernce/shared_prefernce_manager.dart';
import '../../generated/flutter_gen/assets.gen.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  SharedPreferencesManager manager = TTNFlixSL.get<SharedPreferencesManager>();

  final ImagePicker picker = ImagePicker();
  XFile? profileFile;

  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();
  final TextEditingController _dobEditingController = TextEditingController();

  final TextEditingController _confirmPasswordEditingController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(TTNFlixSpacing.spacing16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildHeader(context),
              const SizedBox(height: TTNFlixSpacing.spacing24),
              _buildFormFields(context),
              _buildLoginLink(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: TTNFlixSpacing.spacing24),
        Text(
          "signup",
          style: const TextStyle(
            fontSize: TTNFlixSpacing.spacing30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: TTNFlixSpacing.spacing16),
        Text("create_account"),
        const SizedBox(height: TTNFlixSpacing.spacing16),
        _buildProfileImage(context),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return InkWell(
      onTap: () {
        _showImagePickerBottomSheet(context);
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              radius: TTNFlixSpacing.spacing50,
              child: Image.asset(
                fit: BoxFit.cover,
                Assets.icons.appLogoNoBackground.path,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: TTNFlixSpacing.spacing50),
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.add_box_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        EdtTextField(
          textEditingController: _nameEditingController,
          prefixIcon: const Icon(Icons.person),
          label: "name",
          textInputType: TextInputType.name,
        ),
        EdtTextField(
          textEditingController: _emailEditingController,
          prefixIcon: const Icon(Icons.email),
          label: "email",
          textInputType: TextInputType.emailAddress,
        ),

        EdtTextField(textEditingController: _dobEditingController,
          readOnly: true,
          prefixIcon: const Icon(Icons.calendar_month),
          label: "D.O.B",
          onTap: (){TtnFlixDatePicker(context,date: (date){
            _dobEditingController.text = date;
          }).show();},
        ),
        TtnFlixDropdown(
          hintText: "male",
          prefixIcon: const Icon(Icons.male),
          dropDownData: getDropDownData(context),
          currentValue: '2',
        ),
        EdtPasswordField(
          textEditingController: _passwordEditingController,
          prefixIcon: const Icon(Icons.password),
          hint: "password",
          textInputType: TextInputType.visiblePassword,
        ),
        EdtPasswordField(
          textEditingController: _confirmPasswordEditingController,
          prefixIcon: const Icon(Icons.password),
          hint: "confirm_password",
        ),
        const SizedBox(
          height: TTNFlixSpacing.spacing8,
        ),
        Button(onClick: () {
          // Example: Save and retrieve a string
          manager.saveString('username', 'John Doe');
          String savedUsername = manager.getString('username', defaultValue: 'name');
          print('Saved username: $savedUsername');

          // Example: Save and retrieve a model
          UserModel user = UserModel(username: 'Alice', age: 25);
          manager.saveObject('user', user);
          UserModel? savedUser = manager.getObject<UserModel>('user', (json) => UserModel(username: json['username'], age: json['age']));
          print('Saved user: $savedUser');
        }, buttonText: "signup"),
      ],
    );
  }

  Widget _buildLoginLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("already_have_account"),
        TextButton(
          onPressed: () {
            context.router.push(LogInScreenRoute());
          },
          child: Text(
            "login",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }

  void _showImagePickerBottomSheet(BuildContext context) {
    // ... Implementation of your image picker bottom sheet
  }

  List<DropdownMenuItem<String>> getDropDownData(
      BuildContext context) {
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
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.grey, fontWeight: FontWeight.w100),
        ),
      ));
    }
    return dropdownItems;
  }
}
