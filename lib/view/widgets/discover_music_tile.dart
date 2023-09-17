import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../common_widgets/heading_text.dart';

class DiscoverMusicTile extends StatelessWidget {
  final String title, subTitle, image;
  const DiscoverMusicTile(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 110,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              height: 120,
              width: 110,
              imageUrl: image,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue.withOpacity(0.5),
              ),
              alignment: Alignment.center,
              height: 120,
              width: 110,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeadingText(
                    name: title,
                    color: white,
                    fontweight: FontWeight.bold,
                    fontsize: 17,
                  ),
                  HeadingText(
                    name: subTitle,
                    color: white,
                    fontweight: FontWeight.bold,
                    fontsize: 13,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
