import 'package:flutter/material.dart';

import '../../../core/constants.dart';
import '../../common_widgets/heading_text.dart';

class RecentSearchTile extends StatelessWidget {
  final String title;
  const RecentSearchTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage(profile),
      ),
      title: HeadingText(name: title),
      subtitle: const HeadingText(
        name: "subtext",
        fontsize: 13,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
