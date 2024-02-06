import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ttn_flix/logic/home/home_cubit.dart';
import 'package:ttn_flix/presentation/home/hero_banner_screen.dart';
import 'package:ttn_flix/presentation/home/widget/movie_gridview_widget.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';
import 'package:ttn_flix/utils/ttn_flix_constant.dart';

import '../themes/ttn_flix_text_style.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          TTNFlixConstants.home,
          style: TTNFlixTextStyle.defaultTextTheme.headlineMedium,
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            return SingleChildScrollView(
              controller: _initScrollListener(context),
              child: Column(
                children: [
                  if (state.carouselList != null)
                    HeroBanner(state.carouselList ?? [], state.carouselCurrentPage ?? 0),
                  const SizedBox(height: TTNFlixSpacing.spacing10),
                  if (state.gridList != null)
                    MovieGridViewWidget(gridList: state.gridList!, onTapCallback: (items){
                      BlocProvider.of<HomeCubit>(context).saveFavourite(items);
                    },),
                  Padding(
                    padding: const EdgeInsets.only(bottom: TTNFlixSpacing.spacing16),
                    child: state.isPageEnd! ? const CircularProgressIndicator() : Container(),
                  ),
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
    );
  }

  ScrollController _initScrollListener(BuildContext context) {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        BlocProvider.of<HomeCubit>(context).loadMore();
      }
    });

    return _scrollController;
  }
}
