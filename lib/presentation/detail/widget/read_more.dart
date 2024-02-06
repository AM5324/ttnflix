import 'package:flutter/material.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';
import 'package:ttn_flix/utils/ttn_flix_constant.dart';

import '../../themes/ttn_flix_text_style.dart';

class ReadMoreWidget extends StatefulWidget {
  final String text;

  const ReadMoreWidget({super.key, required this.text});

  @override
  _ReadMoreWidgetState createState() => _ReadMoreWidgetState();
}

class _ReadMoreWidgetState extends State<ReadMoreWidget> {
  bool readMore = false;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          widget.text,
          maxLines: readMore ? TTNFlixSpacing.intSpacing10 : TTNFlixSpacing.intSpacing2,
          overflow: TextOverflow.ellipsis,
          style: TTNFlixTextStyle.defaultTextTheme.bodySmall
              ?.copyWith(color: Colors.white),
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding:  const EdgeInsets.all(TTNFlixSpacing.spacing6),
          child: GestureDetector(
            child: Text(
              readMore ? TTNFlixConstants.readLess : TTNFlixConstants.readMore,
              style: TTNFlixTextStyle.defaultTextTheme.bodySmall
                  ?.copyWith(color: Colors.blue),
            ),
            onTap: () {
              setState(() {
                readMore = !readMore;
              });
            },
          ),
        ),
      ],
    );
  }
}
