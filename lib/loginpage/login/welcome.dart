//import 'package:cupertino_datepicker_example/utils.dart';
//import 'package:cupertino_datepicker_example/widget/button_widget.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/doctor/loginDr/loginDr_screen.dart';

import 'login_screen.dart';

class welcomescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Carousel',
      home: ImageCarousel(),
    );
  }
}

class ImageCarousel extends StatefulWidget {
  _ImageCarouselState createState() => new _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    Widget carousel = new Carousel(
      dotSize: 0.0,
      showIndicator: false,
      overlayShadow: false,
      dotSpacing: 15.0,
      boxFit: BoxFit.cover,
      images: [
        new AssetImage('assets/images/page1photo1.jpg'),
        new AssetImage('assets/images/page1photo2.jpg'),
        new AssetImage('assets/images/page1photo3.jpg'),
        new AssetImage('assets/images/page1photo4.jpg'),
      ],
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(seconds: 1),
    );

    return new Scaffold(
      backgroundColor: Color(0xfff2cbd0),
      body: new Center(
        child: new Container(
          padding: const EdgeInsets.all(0.0),
          height: screenHeight,
          child: new ClipRRect(
            //borderRadius: BorderRadius.circular(30.0),
            child: new Stack(
              children: [
                carousel,

                // banner,
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Column(children: [
        SizedBox(
          height: 600,
        ),
        Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffffae88), Color(0xff8f93ea)],
            ),
          ),
          child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen(),
                    ));
              },
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: StadiumBorder(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      "Admin",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              )),
        ),
        SizedBox(
          height: 600,
        ),
        Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffffae88), Color(0xff8f93ea)],
            ),
          ),
          child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginScreen(),
                    ));
              },
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: StadiumBorder(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      "Start Journey",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffffae88), Color(0xff8f93ea)],
            ),
          ),
          child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LoginDrScreen(),
                    ));
              },
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: StadiumBorder(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      "Doctor",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              )),
        ),
      ]),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
