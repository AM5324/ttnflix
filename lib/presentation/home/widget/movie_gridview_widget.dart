import 'package:flutter/material.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';

import '../../../data/models/movie.dart';
import 'movie_item_widget.dart';

class MovieGridViewWidget extends StatelessWidget {
  const MovieGridViewWidget({Key? key, required this.gridList, required this.onTapCallback}) : super(key: key);

  final List<Results> gridList;
  final Function(Results) onTapCallback;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: TTNFlixSpacing.intSpacing2,
        crossAxisSpacing: TTNFlixSpacing.spacing20,
        mainAxisSpacing: TTNFlixSpacing.spacing20,
        childAspectRatio: TTNFlixSpacing.spacing1_5,
      ),
      itemCount: gridList.length,
      itemBuilder: (BuildContext context, int index) {
        return MovieItem(
          items: gridList[index],
          isGridView: true,
          onTapCallback: (value) {
            onTapCallback(value);
          },
        );
      },
    );
  }
}