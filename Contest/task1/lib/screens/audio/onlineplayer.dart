import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:task1/data/data.dart';

class OnlinePlayer extends StatefulWidget {
  final Data data;

  const OnlinePlayer({Key key, this.data}) : super(key: key);
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<OnlinePlayer>
    with SingleTickerProviderStateMixin {
  final _volumeSubject = BehaviorSubject.seeded(1.0);
  AnimationController _animationController;
  Animation<Color> _colorTween;
  AudioPlayer _player;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _colorTween = _animationController
        .drive(ColorTween(begin: Colors.orangeAccent, end: Colors.black));
    _animationController.forward();
    // AudioPlayer.setIosCategory(IosCategory.playback);
    _player = AudioPlayer();
    _player.setUrl(widget.data.url).then((value) => _player.play());
    // _player.setAsset(widget.data.asset).then((value) => _player.play());
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        "Now Playing",
        style: GoogleFonts.lato(),
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(context),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(vertical: 30.0),
        maintainBottomViewPadding: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Online",
              style: GoogleFonts.lato(
                color: Colors.white30.withOpacity(0.2),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white30,
              radius: 120,
              backgroundImage: AssetImage(widget.data.thumb),
            ),
            Column(
              children: <Widget>[
                Text(
                  widget.data.title,
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 22.0),
                ),
                SizedBox(height: 5),
                Text(
                  widget.data.artist,
                  style:
                      GoogleFonts.lato(color: Colors.white30, fontSize: 15.0),
                ),
                StreamBuilder<Duration>(
                  stream: _player.durationStream,
                  builder: (context, snapshot) {
                    final duration = snapshot.data ?? Duration.zero;
                    return StreamBuilder<Duration>(
                      stream: _player.getPositionStream(),
                      builder: (context, snapshot) {
                        var position = snapshot.data ?? Duration.zero;
                        if (position > duration) {
                          position = duration;
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40.0, vertical: 0),
                          child: SeekBar(
                            duration: duration,
                            position: position,
                            onChangeEnd: (newPosition) {
                              _player.seek(newPosition);
                            },
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),

            StreamBuilder<FullAudioPlaybackState>(
              stream: _player.fullPlaybackStateStream,
              builder: (context, snapshot) {
                final fullState = snapshot.data;
                final state = fullState?.state;
                final buffering = fullState?.buffering;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.skip_previous),
                      iconSize: 30.0,
                      color: Colors.orangeAccent,
                      onPressed: () {},
                    ),
                    if (state == AudioPlaybackState.connecting ||
                        buffering == true)
                      Container(
                        margin: EdgeInsets.all(8.0),
                        width: 30.0,
                        height: 30.0,
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.orangeAccent,
                          strokeWidth: 3,
                          valueColor: _colorTween,
                        ),
                      )
                    else if (state == AudioPlaybackState.playing)
                      IconButton(
                        icon: Icon(Icons.pause),
                        iconSize: 60.0,
                        color: Colors.orangeAccent,
                        onPressed: _player.pause,
                      )
                    else
                      IconButton(
                        icon: Icon(Icons.play_arrow),
                        iconSize: 60.0,
                        color: Colors.orangeAccent,
                        onPressed: _player.play,
                      ),
                    IconButton(
                      icon: Icon(Icons.skip_next),
                      iconSize: 30.0,
                      color: Colors.orangeAccent,
                      onPressed: () {},
                    ),
                    // IconButton(
                    //   icon: Icon(Icons.stop),
                    //   iconSize: 64.0,
                    //   color: Colors.orangeAccent,
                    //   onPressed: state == AudioPlaybackState.stopped ||
                    //           state == AudioPlaybackState.none
                    //       ? null
                    //       : _player.stop,
                    // ),
                  ],
                );
              },
            ),

            StreamBuilder<double>(
              stream: _volumeSubject.stream,
              builder: (context, snapshot) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Volume',
                      style: GoogleFonts.lato(color: Colors.grey),
                    ),
                    Slider(
                      label: "Volume",
                      activeColor: Colors.white.withOpacity(0.6),
                      inactiveColor: Colors.white30.withOpacity(0.1),
                      divisions: 10,
                      min: 0.0,
                      max: 2.0,
                      value: snapshot.data ?? 1.0,
                      onChanged: (value) {
                        _volumeSubject.add(value);
                        _player.setVolume(value);
                      },
                    ),
                  ],
                ),
              ),
            ),
            // Text("Speed"),
            // StreamBuilder<double>(
            //   stream: _speedSubject.stream,
            //   builder: (context, snapshot) => Slider(
            //     divisions: 10,
            //     min: 0.5,
            //     max: 1.5,
            //     value: snapshot.data ?? 1.0,
            //     onChanged: (value) {
            //       _speedSubject.add(value);
            //       _player.setSpeed(value);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
    // );
  }
}

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration> onChanged;
  final ValueChanged<Duration> onChangeEnd;

  SeekBar({
    @required this.duration,
    @required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double _dragValue;

  @override
  Widget build(BuildContext context) {
    return Slider(
      activeColor: Colors.orangeAccent,
      inactiveColor: Colors.white30.withOpacity(0.1),
      min: 0.0,
      max: widget.duration.inMilliseconds.toDouble(),
      value: _dragValue ?? widget.position.inMilliseconds.toDouble(),
      onChanged: (value) {
        setState(() {
          _dragValue = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged(Duration(milliseconds: value.round()));
        }
      },
      onChangeEnd: (value) {
        _dragValue = null;
        if (widget.onChangeEnd != null) {
          widget.onChangeEnd(Duration(milliseconds: value.round()));
        }
      },
    );
  }
}
