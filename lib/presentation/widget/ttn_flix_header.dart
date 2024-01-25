import 'package:flutter/material.dart';
import 'package:ttn_flix/utils/ttn_flix_constant.dart';

import '../../generated/flutter_gen/assets.gen.dart';
import '../themes/ttn_flix_spacing.dart';

class TTNFlixHeader extends StatelessWidget {
  const TTNFlixHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          Assets.icons.appLogoNoBackground.path,
          width: TTNFlixSpacing.spacing100,
          height: TTNFlixSpacing.spacing100,
        ),
        SizedBox(height: 10,),
        const Text(
          TTNFlixConstants.appSlogan,

          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.redAccent
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
