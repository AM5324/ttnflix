import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/data/models/movie.dart';
import 'package:ttn_flix/data/network/api/api_endpoint.dart';
import 'package:ttn_flix/presentation/detail/widget/icon_text.dart';
import 'package:ttn_flix/presentation/detail/widget/read_more.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_text_style.dart';
import 'package:ttn_flix/utils/ttn_flix_constant.dart';

@RoutePage()
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.movie});

  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title ?? "",
          style: TTNFlixTextStyle.defaultTextTheme.headlineMedium,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
                "${ApiEndpoint.imageBaseUrl}${movie.posterPath ?? ''}"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: TTNFlixSpacing.spacing20,
              sigmaY: TTNFlixSpacing.spacing20),
          child: Container(
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                      "${ApiEndpoint.imageBaseUrl}${movie.posterPath ?? ''}"),
                  const SizedBox(
                    height: TTNFlixSpacing.spacing16,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color:
                          Colors.black.withOpacity(TTNFlixSpacing.spacing0_9),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding:
                              const EdgeInsets.all(TTNFlixSpacing.spacing8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(movie.title ?? '',
                                  maxLines: TTNFlixSpacing.intSpacing1,
                                  style: TTNFlixTextStyle
                                      .defaultTextTheme.titleMedium
                                      ?.copyWith(color: Colors.white)),
                              const SizedBox(
                                height: TTNFlixSpacing.spacing10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconTextWidget(
                                    iconData: Icons.calendar_month,
                                    text:
                                        movie.releaseDate?.toUpperCase() ?? '',
                                  ),
                                  IconTextWidget(
                                    iconData: Icons.language,
                                    text:
                                        movie.originalLanguage?.toUpperCase() ??
                                            '',
                                  ),
                                  IconTextWidget(
                                    iconData: Icons.thumb_up_alt_outlined,
                                    text: movie.voteCount
                                        .toString()
                                        .toUpperCase(),
                                  ),
                                  const IconTextWidget(
                                    iconData: Icons.favorite_border,
                                    text: TTNFlixConstants.favorites,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: TTNFlixSpacing.spacing16,
                              ),
                              Text(TTNFlixConstants.overview,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(color: Colors.white)),
                              const SizedBox(
                                height: TTNFlixSpacing.spacing5,
                              ),
                              ReadMoreWidget(
                                text: movie.overview ?? '',
                              ),
                              const SizedBox(
                                height: TTNFlixSpacing.spacing8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
