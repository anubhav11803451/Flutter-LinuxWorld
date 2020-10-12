import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/intro_slider.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/dot_animation_enum.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Hey there!!",
        // styleTitle: GoogleFonts.handlee(
        //   color: Colors.white,
        //   fontSize: 30.0,
        //   fontWeight: FontWeight.bold,
        //   fontStyle: FontStyle.italic,
        // ),
        description:
            "Books don't just go with you, they take you where you've never been.",
        // styleDescription: GoogleFonts.handlee(
        //   color: Colors.white70,
        //   fontSize: 16.5,
        //   fontStyle: FontStyle.italic,
        // ),
        pathImage: "assets/images/3.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Dear Heart !!",
        // styleTitle: GoogleFonts.handlee(
        //   color: Colors.white,
        //   fontSize: 30.0,
        //   fontWeight: FontWeight.bold,
        //   fontStyle: FontStyle.italic,
        // ),
        description: "I will read poetry for us, together we will rhyme.",
        // styleDescription: GoogleFonts.handlee(
        //   color: Colors.white70,
        //   fontSize: 16.5,
        //   fontStyle: FontStyle.italic,
        // ),
        pathImage: "assets/images/9.jpg",
      ),
    );
    slides.add(
      new Slide(
        title: "Coffee !!",
        // styleTitle: GoogleFonts.handlee(
        //   color: Colors.white,
        //   fontSize: 30.0,
        //   fontWeight: FontWeight.bold,
        //   fontStyle: FontStyle.italic,
        // ),
        description:
            "Choose Book & Coffee they will take you to a lot more intresting places.",
        // styleDescription: GoogleFonts.handlee(
        //   color: Colors.white70,
        //   fontSize: 16.5,
        //   fontStyle: FontStyle.italic,
        // ),
        pathImage: "assets/images/10.jpg",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
  }

  void onTabChangeCompleted(index) {}

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      // color: Colors.white,
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      // color: Colors.white,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      // color: Colors.white,
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                currentSlide.pathImage,
                width: 200.0,
                height: 200.0,
                fit: BoxFit.contain,
              )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      // colorSkipBtn: Colors.deepOrangeAccent,
      // highlightColorSkipBtn: Colors.deepOrangeAccent,

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      // colorDoneBtn: Colors.deepOrangeAccent,
      // highlightColorDoneBtn: Colors.deepOrangeAccent,

      // Dot indicator
      // colorDot: Colors.deepOrangeAccent,
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      // backgroundColorAllSlides: Colors.black,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // Show or hide status bar
      shouldHideStatusBar: false,

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}
