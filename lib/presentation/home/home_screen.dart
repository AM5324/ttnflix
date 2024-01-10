import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/presentation/home/hero_banner_screen.dart';
import 'package:ttn_flix/presentation/home/widget/movie_gridview_widget.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';
import 'package:ttn_flix/utils/ttn_flix_constant.dart';

import '../themes/ttn_flix_text_style.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TTNFlixConstants.home,
          style: TTNFlixTextStyle.defaultTextTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          HeroBanner(),
          SizedBox(height: TTNFlixSpacing.spacing10,),
          const MovieGidViewWidget()
        ],)
      ),
    );
  }
}