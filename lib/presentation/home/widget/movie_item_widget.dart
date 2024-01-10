import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/ttn_flix_constant.dart';
import '../../themes/ttn_flix_spacing.dart';
import '../../themes/ttn_flix_text_style.dart';

class MovieItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final bool isGridView;
   const MovieItem({
    Key? key,
    required this.imageUrl,
    required this.title,
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
                image: CachedNetworkImageProvider(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(TTNFlixSpacing.spacing10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    TTNFlixConstants.adultRating,
                    style: TTNFlixTextStyle.defaultTextTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
                  Text(
                    TTNFlixConstants.language,
                    style: TTNFlixTextStyle.defaultTextTheme.titleSmall?.copyWith(color: Colors.white),
                  ),
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
                child: Text(
                  title,
                  style: isGridView ? TTNFlixTextStyle.defaultTextTheme.titleMedium?.copyWith(color: Colors.white) : TTNFlixTextStyle.defaultTextTheme.titleLarge?.copyWith(color: Colors.white),
                  maxLines: 1,
                ),
              ),
            ),
            Icon(
              Icons.favorite_border,
              size: isGridView ? TTNFlixSpacing.spacing20 : TTNFlixSpacing.spacing30,
              color: Colors.white,
            ),
            const SizedBox(width: TTNFlixSpacing.spacing5,),
          ],
        ),
      ],
    );
  }
}