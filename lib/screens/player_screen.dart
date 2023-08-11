import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScreen extends StatefulWidget {
  final String url;

  const PlayerScreen({super.key, required this.url});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
  late String _videoId;

  @override
  void initState(){
    super.initState();
    _videoId = YoutubePlayer.convertUrlToId(widget.url).toString();
    //print('VideoId: $_videoId');
    _controller = YoutubePlayerController(
      initialVideoId: _videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,))
        ..addListener(listener);
        _idController = TextEditingController();
        _seekToController = TextEditingController();
        _videoMetaData = const YoutubeMetaData();
        _playerState = PlayerState.unknown;
  }

  void listener() {
    if ( _isPlayerReady && mounted && !_controller.value.isFullScreen){
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void dispose(){
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },

      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: const Color.fromARGB(255, 8, 19, 77),
        topActions: <Widget>[
          const SizedBox(width: 8.0,),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          Navigator.pop(context);
        },
      ),
      builder:  (context, player) => Scaffold(
      body: player,
      ),
    );
  }
}