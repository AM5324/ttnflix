import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/logic/favourite/favourite_cubit.dart';
import 'package:ttn_flix/presentation/home/widget/movie_gridview_widget.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';
import 'package:ttn_flix/utils/ttn_flix_constant.dart';

import '../themes/ttn_flix_text_style.dart';

@RoutePage()
class FavouraiteScreen extends StatelessWidget {
  const FavouraiteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TTNFlixConstants.favorite,
          style: TTNFlixTextStyle.defaultTextTheme.headlineMedium,
        ),
      ),
      body: BlocBuilder<FavouriteCubit, FavouriteState>(
        builder: (context, state) {
          if (state is FavoriteLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: TTNFlixSpacing.spacing20,
                  ),
                  if (state.favouriteList != null)
                    MovieGridViewWidget(
                      gridList: state.favouriteList!,
                      onTapCallback: (items) {
                        BlocProvider.of<FavouriteCubit>(context)
                            .saveFavourite(items);
                      },
                    ),
                  const SizedBox(
                    height: TTNFlixSpacing.spacing20,
                  ),
                ],
              ),
            );
          } else if (state is FavoriteLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Text(
                TTNFlixConstants.favorite,
                style: TTNFlixTextStyle.defaultTextTheme.headlineMedium
                    ?.copyWith(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
