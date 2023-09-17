import 'package:audio_player/core/constants.dart';
import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  final String name;
  final double fontsize;
  final FontWeight fontweight;
  final Color? color;
  final bool align;
  final int? maxLines;
  const HeadingText(
      {super.key,
      required this.name,
      this.fontsize = 15,
      this.fontweight = FontWeight.normal,
      this.color,
      this.align = false,
      this.maxLines
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: fontsize,
        fontWeight: fontweight,
        color: color ?? white,
      ),
      textAlign: align ? TextAlign.center : TextAlign.start,
      maxLines: maxLines,
    );
  }
}
