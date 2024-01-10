import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';

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
        return Container(
          color: Colors.blueAccent,
          child: Center(
            child: Text(
              'Item $index',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
