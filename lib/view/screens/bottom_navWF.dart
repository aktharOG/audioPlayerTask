// ignore_for_file: file_names


import 'package:audio_player/view/screens/mini_player/mini_player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../../common_widgets/svg_icon.dart';
import '../../providers/home_providerWF.dart';
import '../../theme/app_theme.dart';

class BottomNavBarScreenWF extends StatefulWidget {
  const BottomNavBarScreenWF({
    super.key,
  });

  @override
  State<BottomNavBarScreenWF> createState() => _BottomNavBarScreenWFState();
}

class _BottomNavBarScreenWFState extends State<BottomNavBarScreenWF> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final homePro = Provider.of<HomeProviderWF>(context, listen: false);
      homePro.fetchGenresAPI();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeProviderWF>(context);
    return Scaffold(
      body: homePro.screens[homePro.currentNavIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: backgroundDark,
          elevation: 0,
          currentIndex: homePro.currentNavIndex,
          onTap: (value) {
            homePro.changeNavIndex = value;
          },
          type: BottomNavigationBarType.fixed,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,
          selectedItemColor: white,
          unselectedItemColor: appBlue,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: SvgIcon(
                  icon: "search",
                  height: 25,
                  color: homePro.currentNavIndex == 1 ? white : appBlue,
                ),
                label: "Search"),
          ]),
          floatingActionButton: MusicPlayer(dense: false,),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
