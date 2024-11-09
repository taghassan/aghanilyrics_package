import 'package:just_audio/just_audio.dart';

class Mp3player {
  static Mp3player? _mp3player;

  factory Mp3player() {
    _mp3player ??= Mp3player._internal();
    return _mp3player!;
  }

  Mp3player._internal();

  final player = AudioPlayer();

  ConcatenatingAudioSource? playlist;

  bool get playing => player.playing;

  bool get hasNext => player.hasNext;

  bool get hasPrevious => player.hasPrevious;

  int? get nextIndex => player.nextIndex;

  setPlayListAndPlay({required List<String> urls}) async {
    // Define the playlist
     playlist = ConcatenatingAudioSource(
      // Start loading next item just before reaching it
      useLazyPreparation: true,
      // Customise the shuffle algorithm
      shuffleOrder: DefaultShuffleOrder(),
      // Specify the playlist items
      children: urls.map((e) =>  AudioSource.uri(Uri.parse(e)),).toList(),
    );

     if(playlist!=null)
   {
     // Load and play the playlist
     await player.setAudioSource(playlist!, initialIndex: 0, initialPosition: Duration.zero);

   }
    await player.setLoopMode(LoopMode.all);

     player.play();

  }

  setUrlAndPlay({required String url}) async {
    if (player.playing) {
      await player.stop();
    }
    try {
      player.setUrl(url);
      // await player.setUrl(song?.url??'');
    } on PlayerException catch (e) {
      // iOS/macOS: maps to NSError.code
      // Android: maps to ExoPlayerException.type
      // Web: maps to MediaError.code
      // Linux/Windows: maps to PlayerErrorCode.index
      print("Error code: ${e.code}");
      // iOS/macOS: maps to NSError.localizedDescription
      // Android: maps to ExoPlaybackException.getMessage()
      // Web/Linux: a generic message
      // Windows: MediaPlayerError.message
      print("Error message: ${e.message}");
    } on PlayerInterruptedException catch (e) {
      // This call was interrupted since another audio source was loaded or the
      // player was stopped or disposed before this audio source could complete
      // loading.
      print("Connection aborted: ${e.message}");
    } catch (e) {
      // Fallback for all other errors
      print('An error occured: $e');
    }

    return player.play();
  }

  pause() async {
    return await player.pause();
  }

  load() async {
    return await player.load();
  }

  seekToNext() async {
    return await player.seekToNext();
  }

  seekToPrevious() async {
    return await player.seekToPrevious();
  }
  seekToIndex(int index)async{
    await player.seek(Duration.zero, index: index);
  }

  setShuffleMode(bool value)async{
    await player.setShuffleModeEnabled(true);
  }

  updateThePlaylistAdd(AudioSource newChild)async{
    // Update the playlist
    await playlist?.add(newChild);
  }


  updateThePlaylistInsert(AudioSource newChild,int index)async{
    // Update the playlist
    await playlist?.insert(index,newChild);
  }

  updateThePlaylistRemove(int index)async{
    // Update the playlist
    await playlist?.removeAt(index);
  }






}
