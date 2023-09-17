import 'package:audio_handler/audio_handler.dart';
import 'package:audio_player/providers/home_providerWF.dart';
import 'package:audio_player/services/audio_services/repo/song_repo.dart';
import 'package:audio_player/services/shared_pref_service.dart';
import 'package:audio_player/theme/app_theme.dart';
import 'package:audio_player/view/screens/bottom_navWF.dart';
import 'package:audio_service/audio_service.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  systemUIOverlay;
  systemOrientation;
  SharedPreferencesService().setPreferences();
  AudioHandler audioHandler = await AudioService.init(
    builder: () => MyAudioHandler(),
    config: const AudioServiceConfig(
        // androidNotificationChannelId: 'com.mycompany.myapp.audio',
        // androidNotificationChannelName: 'Audio Service Demo',
        // androidNotificationOngoing: true,
        // androidStopForegroundOnPause: true,
        ),
  );
  runApp( MyApp(audioHander: audioHandler,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required AudioHandler audioHander})
      : _audioHandler = audioHander;
  final AudioHandler _audioHandler;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SongRepository(audioHandler: _audioHandler),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProviderWF(),
        )
      ],
      child: MaterialApp(
        title: 'Audio APP',
        theme: darkThemeData,
        darkTheme: darkThemeData,
        home: const BottomNavBarScreenWF(),
      ),
    );
  }
}



// class ChoosingPage extends StatelessWidget {
//   const ChoosingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//               ElevatedButton(onPressed: (){
//                 push(context, const BottomNavBarScreen());
//               }, child: const Text("Based on my idea")),
//               const SizedBox(height: 20,),
//               ElevatedButton(onPressed: (){
//                 push(context, const BottomNavBarScreenWF());
//               }, child: const Text("Based on wireframe"))
//           ],
//         ),
//       ),
//     );
//   }
// }

