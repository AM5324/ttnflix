import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/presentation/home/widget/carouselItemWidget.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';

import '../../../utils/ttn_flix_constant.dart';
import '../../themes/ttn_flix_text_style.dart';
import 'movie_item_widget.dart';

class MovieGidViewWidget extends StatelessWidget {
  const MovieGidViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: TTNFlixSpacing.intSpacing2, // Number of columns
        crossAxisSpacing: TTNFlixSpacing.spacing8, // Spacing between columns
        mainAxisSpacing: TTNFlixSpacing.spacing8, // Spacing between rows
      ),
      itemCount: TTNFlixSpacing.intSpacing10, // Number of items in the grid
      itemBuilder: (BuildContext context, int index) {
        return MovieItem(
          imageUrl: 'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',
          title: TTNFlixConstants.title,
          isGridView: true,
        );
      },
    );
  }
}
