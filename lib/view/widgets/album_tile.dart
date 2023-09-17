
import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../common_widgets/heading_text.dart';

class AlbumTile extends StatelessWidget {
  const AlbumTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.only(left: 20, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: const BoxDecoration(color: white),
                          child: Image.asset(
                            "assets/images/music_bg_2.jpg",
                            height: 150,
                            width: 150,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const HeadingText(
                          name: "Still Robin",
                          color: white,
                        ),
                        const HeadingText(
                          name: "Albhum-Anirudh",
                          color: white,
                          fontsize: 13,
                        )
                      ],
                    ),
                  );
  }
}