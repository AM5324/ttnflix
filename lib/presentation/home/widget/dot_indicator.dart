import 'package:flutter/material.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';

class DotsIndicator extends StatelessWidget {
  final int itemCount;
  final int currentPage;

  const DotsIndicator({
    Key? key,
    required this.itemCount,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: TTNFlixSpacing.spacing100,
      margin: const EdgeInsets.only(bottom: TTNFlixSpacing.spacing20),
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(TTNFlixSpacing.spacing5),
            child: SizedBox(
              height: TTNFlixSpacing.spacing10,
              child: Icon(
                index == currentPage
                    ? Icons.circle
                    : Icons.circle_outlined,
                size: TTNFlixSpacing.spacing8,
                color: Colors.white,
              ),
            ),
          );
        },
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}