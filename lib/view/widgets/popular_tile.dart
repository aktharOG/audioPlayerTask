import 'package:audio_player/common_widgets/heading_text.dart';
import 'package:audio_player/services/audio_services/models/models.dart';
import 'package:audio_player/services/audio_services/repo/song_repo.dart';
import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants.dart';
import '../../main.dart';

class PopularTile extends StatelessWidget {
  final Song song;
  const PopularTile({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    final repoPro = Provider.of<SongRepository>(context);
    return StreamBuilder<MusicPlayerData>(
        stream: repoPro.musicPlayerDataStream,
        builder: (context, snapshot) {
          final data = snapshot.data;
          AudioPlayerState audioPlayerState = AudioPlayerState.stopped;
          if (data != null) {
            if (snapshot.data!.playbackState.playing == true) {
              audioPlayerState = AudioPlayerState.playing;
            } else if (snapshot.data!.playbackState.playing == false) {
              audioPlayerState = AudioPlayerState.paused;
            }
          }

          // if(snapshot.data?.currentSong==song){

          return ListTile(
            onTap: () {
              repoPro.setCurrentSong(song);
              repoPro.play();
            },
            leading:  CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(song.imageUrl),
            ),
            title:  HeadingText(name: song.title),
            subtitle:  HeadingText(name: song.artist.name),
            trailing: const Icon(Icons.play_arrow),
          );
        });
  }
}

enum AudioPlayerState {
  /// The audio player is stopped.
  stopped,

  /// The audio player is playing.
  playing,

  /// The audio player is paused.
  paused,

  /// The audio player is loading.
  loading,

  /// The audio player is buffering.
  buffering,

  /// The audio player is completed.
  completed,

  /// The audio player is error.
  error,
}
