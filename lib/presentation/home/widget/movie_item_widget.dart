import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/data/models/movie.dart';
import 'package:ttn_flix/data/network/api/api_endpoint.dart';
import '../../themes/ttn_flix_spacing.dart';
import '../../themes/ttn_flix_text_style.dart';

class MovieItem extends StatelessWidget {
  final Results items;
  final bool isGridView;

  const MovieItem({
    Key? key,
    required this.items,
    this.isGridView = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    "${ApiEndpoint.imageBaseUrl}${items.posterPath ?? ''}"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(TTNFlixSpacing.spacing10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildText(items.getContentRating(), Colors.white),
                  _buildText(items.originalLanguage?.toUpperCase() ?? "", Colors.white),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: isGridView ? TTNFlixSpacing.spacing2 : TTNFlixSpacing.spacing10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                alignment: Alignment.center,
                child: _buildText(items.title ?? "", Colors.white,
                    style: isGridView
                        ? TTNFlixTextStyle.defaultTextTheme.titleMedium
                        : TTNFlixTextStyle.defaultTextTheme.titleLarge),
              ),
            ),
            _buildFavoriteIcon(isGridView),
            const SizedBox(width: TTNFlixSpacing.spacing5),
          ],
        ),
      ],
    );
  }

  Text _buildText(String text, Color color, {TextStyle? style}) {
    return Text(
      text,
      style: style?.copyWith(color: color),
      maxLines: 1,
    );
  }

  Icon _buildFavoriteIcon(bool isGridView) {
    return Icon(
      Icons.favorite_border,
      size: isGridView ? TTNFlixSpacing.spacing20 : TTNFlixSpacing.spacing30,
      color: Colors.white,
    );
  }
}
