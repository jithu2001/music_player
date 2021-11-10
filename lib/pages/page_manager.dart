import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'notifiers/play_button_notifier.dart';
import 'notifiers/progress_notifier.dart';
import 'notifiers/repeat_button_notifier.dart';

class PageManager {
  final currentSongTitleNotifier = ValueNotifier<String>('');
  final playlistNotifier = ValueNotifier<List<String>>([]);
  final progressNotifier = ProgressNotifier();
  final repeatButtonNotifier = RepeatButtonNotifier();
  final isFirstSongNotifier = ValueNotifier<bool>(true);
  final playButtonNotifier = PlayButtonNotifier();
  final isLastSongNotifier = ValueNotifier<bool>(true);
  final isShuffleModeEnabledNotifier = ValueNotifier<bool>(false);

  late AudioPlayer _audioPlayer;
  late ConcatenatingAudioSource _playlist;

  PageManager() {
    _init();
  }

  void _init() async {
    _audioPlayer = AudioPlayer();
    _setInitialPlaylist();
    _listenForChangesInPlayerState();
    _listenForChangesInPlayerPosition();
    _listenForChangesInBufferedPosition();
    _listenForChangesInTotalDuration();
    _listenForChangesInSequenceState();
  }

  // TODO: set playlist
  void _setInitialPlaylist() async {
    final song1 = Uri.parse(
        'https://pagalfree.com/musics/128-Duniyaa%20-%20Luka%20Chuppi%20128%20Kbps.mp3');
    final song2 = Uri.parse(
        'https://pagalfree.com/musics/128-Woh%20Din%20-%20Chhichhore%20128%20Kbps.mp3');
    final song3 = Uri.parse(
        'https://pagalfree.com/musics/128-Photo%20-%20Luka%20Chuppi%20128%20Kbps.mp3');
    final song4 = Uri.parse(
        'https://pagalfree.com/musics/128-Chogada%20-%20Loveyatri%20-%20A%20Journey%20Of%20Love%20128%20Kbps.mp3');
    final song5 = Uri.parse(
        'https://pagalfree.com/musics/128-Tere%20Naal%20-%20Tulsi%20Kumar%20And%20Darshan%20Raval%20128%20Kbps.mp3');
    final song6 = Uri.parse(
        'https://pagalfree.com/musics/128-Hone%20Laga%20-%20Antim%20The%20Final%20Truth%20128%20Kbps.mp3');
    final song7 = Uri.parse(
        'https://pagalfree.com/musics/128-Kamli%20-%20Hum%20Do%20Humare%20Do%20128%20Kbps.mp3');
    final song8 = Uri.parse(
        'https://pagalfree.com/musics/128-Chale%20Aana%20-%20De%20De%20Pyaar%20De%20128%20Kbps.mp3');
    final song9 = Uri.parse(
        'https://pagalfree.com/musics/128-Teri%20Mitti%20-%20Female%20Version%20-%20Kesari%20128%20Kbps.mp3');
    final song10 = Uri.parse(
        'https://pagalfree.com/musics/128-Raula%20Pae%20Gayaa%20-%20Hum%20Do%20Humare%20Do%20128%20Kbps.mp3');
    _playlist = ConcatenatingAudioSource(children: [
      AudioSource.uri(song1, tag: 'Duniyaa'),
      AudioSource.uri(song2, tag: 'Woh Din'),
      AudioSource.uri(song3, tag: 'Photo'),
      AudioSource.uri(song4, tag: 'Chogada'),
      AudioSource.uri(song5, tag: 'Tere Naal'),
      AudioSource.uri(song6, tag: 'Hone Laga'),
      AudioSource.uri(song7, tag: 'Kamli'),
      AudioSource.uri(song8, tag: 'Chale Aana'),
      AudioSource.uri(song9, tag: 'Teri Mitti'),
      AudioSource.uri(song10, tag: 'Raula Pae Gayaa'),
    ]);
    await _audioPlayer.setAudioSource(_playlist);
  }

  void _listenForChangesInPlayerState() {
    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        playButtonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        playButtonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        playButtonNotifier.value = ButtonState.playing;
      } else {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
      }
    });
  }

  void _listenForChangesInPlayerPosition() {
    _audioPlayer.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInBufferedPosition() {
    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });
  }

  void _listenForChangesInTotalDuration() {
    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  void _listenForChangesInSequenceState() {
    _audioPlayer.sequenceStateStream.listen((sequenceState) {
      if (sequenceState == null) return;
      final currentItem = sequenceState.currentSource;
      final title = currentItem?.tag as String?;
      currentSongTitleNotifier.value = title ?? '';
      // TODO: update playlist
      final playlist = sequenceState.effectiveSequence;
      final titles = playlist.map((item) => item.tag as String).toList();
      playlistNotifier.value = titles;
      // TODO: update shuffle mode
      isShuffleModeEnabledNotifier.value = sequenceState.shuffleModeEnabled;
      // TODO: update previous and next buttons
      if (playlist.isEmpty || currentItem == null) {
        isFirstSongNotifier.value = true;
        isLastSongNotifier.value = true;
      } else {
        isFirstSongNotifier.value = playlist.first == currentItem;
        isLastSongNotifier.value = playlist.last == currentItem;
      }
    });
  }

  void play() async {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void dispose() {
    _audioPlayer.dispose();
  }

  void onRepeatButtonPressed() {
    repeatButtonNotifier.nextState();
    switch (repeatButtonNotifier.value) {
      case RepeatState.off:
        _audioPlayer.setLoopMode(LoopMode.off);
        break;
      case RepeatState.repeatSong:
        _audioPlayer.setLoopMode(LoopMode.one);
        break;
      case RepeatState.repeatPlaylist:
        _audioPlayer.setLoopMode(LoopMode.all);
    }
  }

  void onPreviousSongButtonPressed() {
    _audioPlayer.seekToPrevious();
  }

  void onNextSongButtonPressed() {
    _audioPlayer.seekToNext();
  }

  void onShuffleButtonPressed() async {
    final enable = !_audioPlayer.shuffleModeEnabled;
    if (enable) {
      await _audioPlayer.shuffle();
    }
    await _audioPlayer.setShuffleModeEnabled(enable);
  }
}
