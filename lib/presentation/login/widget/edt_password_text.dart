import 'package:flutter/material.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';

class EdtPasswordField extends StatefulWidget {
  const EdtPasswordField(
      {super.key,
        required this.textEditingController,
        this.hint,
        this.prefixIcon,
        this.textColor,
        this.validator,
        this.error,
        this.textInputType});

  final TextEditingController textEditingController;
  final String? hint;
  final Icon? prefixIcon;
  final Color? textColor;
  final FormFieldValidator? validator;
  final String? error;
  final TextInputType? textInputType;

  @override
  State<EdtPasswordField> createState() => _EdtPasswordFieldState(
      textEditingController, hint, prefixIcon, textColor, error, textInputType, validator);
}

class _EdtPasswordFieldState extends State<EdtPasswordField> {
  bool _isPasswordVisible = true;
  final TextEditingController textEditingController;
  final String? hint;
  final Icon? prefixIcon;
  final Color? textColor;
  final FormFieldValidator? validator;
  final String? error;
  final TextInputType? textInputType;

  _EdtPasswordFieldState(this.textEditingController, this.hint, this.prefixIcon,
      this.textColor, this.error, this.textInputType, this.validator);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TTNFlixSpacing.spacing16),
      child: TextFormField(
        obscureText: _isPasswordVisible,
        keyboardType: textInputType,
        controller: textEditingController,
        validator: validator,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: textColor ?? Colors.grey),
        decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                child: Icon(!_isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off)),
            hintText: hint ?? '',
            fillColor: Colors.white,
            filled: true,
            prefixIcon: prefixIcon),
      ),
    );
  }
}