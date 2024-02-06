import 'package:flutter/material.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_text_style.dart';

class IconTextWidget extends StatelessWidget {
  final IconData iconData;
  final String? text;

  const IconTextWidget({super.key, required this.iconData, required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: TTNFlixSpacing.spacing4),
              child: Icon(
                iconData, size: TTNFlixSpacing.spacing16,
                color: Colors.white, // Adjust the size as needed
              ),
            ),
          ),
          TextSpan(
              text: text ?? "",
              style: TTNFlixTextStyle.defaultTextTheme.bodySmall
                  ?.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
