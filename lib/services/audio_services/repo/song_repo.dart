import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../models/models.dart';

class SongRepository extends ChangeNotifier {
  SongRepository({required AudioHandler audioHandler})
      : _audioHandler = audioHandler;

  final AudioHandler _audioHandler;

  Future<List<Song>?> getSongs() async {
    try {
      List<Song> songs = await Future.delayed(
        const Duration(seconds: 1),
        () => Song.songs,
      );

      return songs;
    } catch (_) {
      return null;
    }
  }

  Future<Song?> getSongById(String songId) async {
    try {
      Song? song = await Future.delayed(
        const Duration(seconds: 1),
        () => Song.songs.where((song) => song.id == songId).first,
      );

      return song;
    } catch (_) {
      return null;
    }
  }

  void play() => _audioHandler.play();

  void pause() => _audioHandler.pause();

  void seek(position) => _audioHandler.seek(position);

  /// A stream reporting the combined state of the current media item and its
  /// current position.
  Stream<MusicPlayerData> get musicPlayerDataStream => Rx.combineLatest4<
              PlaybackState,
              List<MediaItem>,
              MediaItem?,
              Duration,
              MusicPlayerData>(_audioHandler.playbackState, _audioHandler.queue,
          _audioHandler.mediaItem, AudioService.position, (
        PlaybackState playbackState,
        List<MediaItem> queue,
        MediaItem? mediaItem,
        Duration position,
      ) {
        return MusicPlayerData(
          currentSong:
              (mediaItem == null) ? null : Song.fromMediaItem(mediaItem),
          songQueue: queue.map((mediaItem) {
            return Song.fromMediaItem(mediaItem);
          }).toList(),
          playbackState: playbackState,
          currentSongPosition: position,
          currentSongDuration: (mediaItem == null) ? null : mediaItem.duration,
        );
      });

  Future<void> setCurrentSong(Song song) async {
    _audioHandler.removeQueueItemAt(0);
    _audioHandler.addQueueItem(song.toMediaItem());
  }
}
