

import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../common_widgets/heading_text.dart';

class HeadingWithTitle extends StatelessWidget {
  final String title,btnName;
  final VoidCallback onTap;
  const HeadingWithTitle({super.key,required this.title,required this.btnName,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     HeadingText(
                      name: title,
                      fontsize: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        onPressed: onTap,
                        child:  HeadingText(
                          name: btnName,
                          color: white,
                        ))
                  ],
                );
  }
}