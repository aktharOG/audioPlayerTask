import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


import '../../../core/constants.dart';
import '../../common_widgets/heading_text.dart';

class PopularGenresTile extends StatelessWidget {
   final Map data;
  const PopularGenresTile({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Container(
                  height: 110,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: CachedNetworkImage(imageUrl: data["image"],fit: BoxFit.cover,
                        height: 110,
                        width: double.infinity,
                        )),
                        Align(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(3, 1),
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.5)
                                )
                              ]
                            ),
                            child:  HeadingText(name:data["title"],fontweight: FontWeight.bold,)),
                        )
                    ],
                  ),
                 ),
    );
  }
}