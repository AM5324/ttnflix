import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/logic/favourite/favourite_cubit.dart';
import 'package:ttn_flix/logic/home/home_cubit.dart';
import 'package:ttn_flix/presentation/home/widget/movie_gridview_widget.dart';
import 'package:ttn_flix/utils/ttn_flix_constant.dart';

import '../themes/ttn_flix_text_style.dart';

@RoutePage()
class FavouraiteScreen extends StatelessWidget {
  FavouraiteScreen({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteCubit()..fetchFavouritesData(),
      child: Scaffold(
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
                    if (state.gridList != null)
                      MovieGridViewWidget(gridList: state.gridList!),
                  ],
                ),
              );
            } else if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
