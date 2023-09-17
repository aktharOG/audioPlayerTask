import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? height;
  final double? width;
  const SvgIcon({super.key,required this.icon,this.color,this.height,this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      
  "assets/icons/$icon.svg",
  height: height?? 30,
  width: width??30,
  colorFilter:color==null?null: ColorFilter.mode(color!, BlendMode.srcIn),
  semanticsLabel: 'A red up arrow'
);
  }
}