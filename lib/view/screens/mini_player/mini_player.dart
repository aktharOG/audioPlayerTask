import 'package:atomsbox/atomsbox.dart';
import 'package:audio_player/common_widgets/heading_text.dart';
import 'package:audio_player/core/constants.dart';
import 'package:audio_player/services/audio_services/models/models.dart';
import 'package:audio_player/services/audio_services/repo/song_repo.dart';
import 'package:audio_player/theme/app_theme.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({super.key, this.onTap, this.dense = false});

  final bool dense;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final repoPro = Provider.of<SongRepository>(context);
    return StreamBuilder<MusicPlayerData>(
        stream: repoPro.musicPlayerDataStream,
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data != null) {
            if (data!.songQueue.isNotEmpty) {
              AudioPlayerState audioPlayerState = AudioPlayerState.stopped;
              if (snapshot.data!.playbackState.playing == true) {
                audioPlayerState = AudioPlayerState.playing;
              } else if (snapshot.data!.playbackState.playing == false) {
                audioPlayerState = AudioPlayerState.paused;
              }
              return Stack(
                children: [
                  Container(
                      height: 60,
                      color: appBlue,
                      margin: const EdgeInsets.symmetric(
                          horizontal: AppConstants.sm),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                            data.currentSong!.imageUrl,
                          ),
                        ),
                        title: HeadingText(name: data.currentSong!.title),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (audioPlayerState == AudioPlayerState.playing)
                              GestureDetector(
                                  onTap: () {
                                    repoPro.pause();
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: white,
                                    child: Icon(Icons.pause),
                                  ))
                            else
                              GestureDetector(
                                  onTap: () {
                                    // repoPro.setCurrentSong(data.currentSong!);
                                    repoPro.play();
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: white,
                                    child: Icon(Icons.play_arrow),
                                  )),
                          ],
                        ),
                      )),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: AppConstants.sm),
                  //   child: ProgressBar(
                  //     progress: const Duration(milliseconds: 1000),
                  //     buffered: const Duration(milliseconds: 2000),
                  //     total: const Duration(milliseconds: 5000),
                  //     onSeek: (duration) {
                  //       repoPro.seek(data.currentSongDuration);
                  //     },
                  //   ),
                  // ),
                ],
              );
            } else {
              return const SizedBox();
            }
          } else {
            return const SizedBox();
          }
        });
  }
}
