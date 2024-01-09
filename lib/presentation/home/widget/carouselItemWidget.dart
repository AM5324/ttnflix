import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ttn_flix/presentation/themes/ttn_flix_spacing.dart';
import 'package:ttn_flix/utils/ttn_flix_constant.dart';
import '../../themes/ttn_flix_text_style.dart';

class CarouselItemWidget extends StatelessWidget {
  final String item;

  const CarouselItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 225,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(image: CachedNetworkImageProvider(item), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(TTNFlixSpacing.spacing10),
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
        const SizedBox(height: TTNFlixSpacing.spacing10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  TTNFlixConstants.title,
                  style: TTNFlixTextStyle.defaultTextTheme.titleLarge?.copyWith(color: Colors.white),
                ),
              ),
            ),
            const Icon(
              Icons.favorite_border,
              size: TTNFlixSpacing.spacing30,
              color: Colors.white,
            ),
            const SizedBox(width: TTNFlixSpacing.spacing5,)
          ],
        ),
      ],
    );
  }
}
