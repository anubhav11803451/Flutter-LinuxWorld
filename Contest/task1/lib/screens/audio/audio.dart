import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task1/data/data.dart';

class AudioPlayer extends StatelessWidget {
  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        "My Music",
        style: GoogleFonts.lato(),
      ),
      centerTitle: true,
    );
  }

  BottomAppBar bottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.white30.withOpacity(0.1),
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.library_music,
              color: Colors.orangeAccent,
            ),
            tooltip: "My Music",
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.explore,
              color: Colors.orangeAccent,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  FloatingActionButton floatingActionButton() {
    return FloatingActionButton(
      child: const Icon(
        Icons.audiotrack,
        color: Colors.black,
      ),
      backgroundColor: Colors.orangeAccent,
      elevation: 2,
      tooltip: "Now Playing",
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(context),
      body: AudioBody(),
      floatingActionButton: floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomAppBar(context),
    );
  }
}

class AudioBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: datas.length,
                itemBuilder: (BuildContext context, int index) =>
                    BuildAudioCard(
                  data: datas[index],
                  itemIndex: index,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildAudioCard extends StatefulWidget {
  final int itemIndex;
  final Data data;
  const BuildAudioCard({
    Key key,
    this.itemIndex,
    this.data,
  }) : super(key: key);

  @override
  _BuildAudioCardState createState() => _BuildAudioCardState();
}

class _BuildAudioCardState extends State<BuildAudioCard>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _handleOnPressed() {
    setState(() {
      isPlaying = !isPlaying;
      isPlaying ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white30.withOpacity(0.1),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(widget.data.thumb),
            radius: 25,
          ),
          title: Text(
            widget.data.title,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
          ),
          subtitle: Text(
            widget.data.artist,
            style: GoogleFonts.lato(color: Colors.white54),
          ),
          trailing: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            color: Colors.orangeAccent,
            size: 25.0,
            progress: _controller,
          ),
        ),
      ),
      onTap: () {
        _handleOnPressed();
      },
    );
  }
}
