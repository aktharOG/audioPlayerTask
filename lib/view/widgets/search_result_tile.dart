import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../common_widgets/heading_text.dart';
import 'custom_button.dart';

class SearchResultTile extends StatelessWidget {
  final String title;
  const SearchResultTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 215,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: backgroundDark,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: CachedNetworkImage(
                        placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
                        height: 160,
                        width: double.infinity,
                        imageUrl: guitar,
                        fit: BoxFit.cover,
                      )),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: backgroundDark,
                        child: Icon(
                          Icons.favorite,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      width: 60,
                      decoration: BoxDecoration(
                          color: backgroundDark,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          HeadingText(
                            name: "4.2",
                            color: white,
                            fontsize: 13,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: HeadingText(
                        name: title,
                        maxLines: 1,
                      ),
                    ),
                     SizedBox(
                        height: 30,
                        width: 75,
                        child: CustomButton(btnName: "Play",onTap: (){},))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
