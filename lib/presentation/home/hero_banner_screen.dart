import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/data/models/movie.dart';
import 'package:ttn_flix/presentation/home/widget/dot_indicator.dart';
import 'package:ttn_flix/presentation/home/widget/movie_item_widget.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';

import '../../logic/home/home_cubit.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner(this.carouselList, this.carouselCurrentPage, {super.key});

  final List<Results> carouselList;
  final int carouselCurrentPage;
  final int maxCount = 10;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TTNFlixSpacing.spacing315,
      child: Stack(
        children: [
          PageView.builder(
              controller: context.read<HomeCubit>().pageController,
              onPageChanged: (int page) {
                BlocProvider.of<HomeCubit>(context)
                    .updateDotIndicator(page);
              },
              itemCount: maxCount,
              itemBuilder: (context, index) {
                return MovieItem(
                  items: carouselList[index],
                  onTapCallback: (items){
                    BlocProvider.of<HomeCubit>(context).saveFavourite(items);
                  },
                );
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: DotsIndicator(
              itemCount: maxCount,
              currentPage: carouselCurrentPage,
            ),
          ),
        ],
      ),
    );
  }
}
