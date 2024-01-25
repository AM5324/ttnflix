import 'package:flutter/material.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';

class EdtTextField extends StatelessWidget {
  const EdtTextField({
    Key? key,
    required this.textEditingController,
    this.label,
    this.prefixIcon,
    this.textColor,
    this.validator,
    this.error,
    this.readOnly = false,
    this.textInputType,
    this.onTap,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String? label;
  final Icon? prefixIcon;
  final Color? textColor;
  final String? error;
  final FormFieldValidator? validator;
  final bool readOnly;
  final TextInputType? textInputType;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TTNFlixSpacing.spacing16),
      child: TextFormField(
        keyboardType: textInputType,
        controller: textEditingController,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: textColor ?? Colors.grey,
        ),
        onTap: onTap,
        readOnly: readOnly,
        decoration: InputDecoration(
          hintText: label ?? '',
          fillColor: Colors.white,
          filled: true,
          prefixIcon: prefixIcon,
          errorText: error,
        ),
        validator: validator,
      ),
    );
  }
}