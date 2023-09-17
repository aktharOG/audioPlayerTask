import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../core/constants.dart';
import '../../common_widgets/heading_text.dart';

class CustomButton extends StatelessWidget {
  final String btnName;
  final VoidCallback onTap;
  final Color? color;
  const CustomButton({super.key, required this.btnName, required this.onTap,this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        onPressed: onTap,
        child: HeadingText(
          name: btnName,
          color: white,
        ));
  }
}
