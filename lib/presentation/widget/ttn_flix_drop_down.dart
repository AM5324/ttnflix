import 'package:flutter/material.dart';

import '../themes/ttn_flix_spacing.dart';

class TtnFlixDropdown extends StatelessWidget {
  const TtnFlixDropdown({
    Key? key,
    this.hintText,
    this.textColor,
    this.prefixIcon,
    this.dropDownData,
    this.currentValue,
    this.readOnly = false,
    required this.onChanged
  }) : super(key: key);

  final String? hintText;
  final Color? textColor;
  final Icon? prefixIcon;
  final String? currentValue;
  final bool readOnly;
  final List<DropdownMenuItem<String>>? dropDownData;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: TTNFlixSpacing.spacing16),
      child: DropdownButtonFormField<String>(
        value: currentValue ?? '2',
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          prefixIcon: prefixIcon ?? const Icon(Icons.male),
        ),
        hint: Text(
          hintText ?? '',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: textColor ?? Colors.grey,
          ),
        ),
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: TTNFlixSpacing.spacing24,
        dropdownColor: Colors.white,
        items: dropDownData,
        onChanged: readOnly ? null : onChanged,
      ),
    );
  }


}
