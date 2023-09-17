import 'package:audio_player/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color msgButtonColor = const Color(0xffAE6511);
Color darkBG = const Color(0xff171717);
Color grey50 = const Color.fromRGBO(99, 99, 99, 0.5);
Color darkBG80 = const Color.fromRGBO(23, 23, 23, 0.8);
Color darkDialogBG = const Color(0xFF393939);
Color lightBG = const Color(0xFFE6E6E6);
Color primaryColor = const Color(0xffC70000);
Color primaryColor50 = const Color.fromRGBO(199, 0, 0, 0.50);
Color primaryColorDark = const Color.fromARGB(255, 107, 19, 12);
Color primaryColorTrans = const Color(0x1FC70000);
Color subtitleColor = const Color(0xffE2E2E2);
Color buttonBorderColor = const Color(0x7D000000);
Color lightDialogBG = const Color(0xffEFEFEF);
Color darkDrawerBG = const Color(0xff121212);
Color darkDividerColor = const Color(0xffEDEDED);
Color darkCardColor = const Color(0xff1B1B1B);
Color lightCardColor = const Color(0xffF0DDE1);
Color lightChatBubbleColor = const Color(0x91AE6611);
Color callGreen = const Color(0xff279362);
Color buttonGreen = const Color(0xff3EA969);

Color appBlue = const Color(0xff8b0ddd);

MaterialColor primarySwatch = const MaterialColor(0xff8b0ddd, {
  50: Color(0xff8b0ddd),
  100: Color(0xff8b0ddd),
  200: Color(0xff8b0ddd),
  300: Color(0xff8b0ddd),
  400: Color(0xff8b0ddd),
  500: Color(0xff8b0ddd),
  600: Color(0xff8b0ddd),
  700: Color(0xff8b0ddd),
  800: Color(0xff8b0ddd),
  900: Color(0xff8b0ddd),
});

ThemeData darkThemeData = ThemeData(
    //fontFamily: 'Montserrat',
    fontFamily: "Poppins",
    scaffoldBackgroundColor: darkBG,
    primarySwatch: primarySwatch,
    textTheme: const TextTheme(),
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      labelStyle: TextStyle(),
    ),
    cardColor: darkDialogBG,
    navigationBarTheme:
        const NavigationBarThemeData(backgroundColor: Color(0xff121212)),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: darkDrawerBG),
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(color: Colors.white, width: 0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    dialogBackgroundColor: darkDialogBG,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          iconColor: const MaterialStatePropertyAll(Colors.white),
          foregroundColor: const MaterialStatePropertyAll(Colors.white),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          side: const MaterialStatePropertyAll(
              BorderSide(color: Colors.white, width: 0.2))),
    ),
    drawerTheme: DrawerThemeData(backgroundColor: darkDrawerBG),
    dividerColor: darkDividerColor,
    listTileTheme: const ListTileThemeData(
        textColor: white,
        // tileColor: white,
        iconColor: white),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        unselectedLabelStyle: TextStyle(color: appBlue),
        
        unselectedIconTheme: IconThemeData(color: appBlue)),
        
    appBarTheme: AppBarTheme(
        backgroundColor: darkBG,
        elevation: 0,
        titleTextStyle: const TextStyle()));

// ThemeData lightThemeData = ThemeData(
//     //fontFamily: 'Montserrat',

//     brightness: Brightness.light,
//     fontFamily: "Poppins",
//     bottomSheetTheme: BottomSheetThemeData(backgroundColor: lightDialogBG),
//     cardColor: lightCardColor,
//     scaffoldBackgroundColor: Colors.white,
//     primarySwatch: primarySwatch,
//     navigationBarTheme: NavigationBarThemeData(backgroundColor: lightDialogBG),
//     checkboxTheme: CheckboxThemeData(
//       side: const BorderSide(color: Colors.grey, width: 0.4),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(5),
//       ),
//     ),
//     tabBarTheme: const TabBarTheme(
//         labelColor: Colors.black, unselectedLabelColor: Colors.grey),
//     appBarTheme: const AppBarTheme(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         titleTextStyle: TextStyle(fontFamily: "Poppins")));

var systemUIOverlay =
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  systemNavigationBarColor: Colors.transparent,
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  systemNavigationBarIconBrightness: Brightness.dark,
  statusBarColor: Colors.transparent,
));

var systemOrientation = SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
