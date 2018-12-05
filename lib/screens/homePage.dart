import 'dart:math';
import 'dart:core';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

//drawer
import './drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  PageController pageViewController;
  String str;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  Color clr = Colors.orange;
  var pos = 20.0;
  int currentPage = 0;
  double pageOffset = 0.0;
  double currentOffset = 0.0;
  var dir = ScrollDirection.reverse;
  List _colors = [
    Colors.green,
    Colors.orange,
    Colors.blue,
    Colors.blueGrey,
    Colors.deepOrangeAccent,
    Colors.limeAccent,
    Colors.pinkAccent,
    Colors.cyanAccent,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.purple,
    Colors.redAccent
  ];
  
  List<String> _days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  
  @override
  void initState() {
    super.initState();
    pageViewController = new PageController(initialPage: 0);
    setState(() {
      Random rnd;
      rnd = new Random();
      int r = 0 + rnd.nextInt(_colors.length - 0);
      clr = _colors[r];
    });
    pageViewController.addListener(() {
      dir = pageViewController.position.userScrollDirection;
      currentPage = pageViewController.page.truncate();
      currentOffset = pageViewController.offset;
      pageOffset = pageViewController.position.extentInside * currentPage;
      setState(() {
        pos = getMappedValue(0.0, pageViewController.position.extentInside,
            20.0, 100.0, pageViewController.offset - pageOffset);
      });
    });
  }

  double getMappedValue(double range1low, double range1high, double range2low,
      double range2high, double number) {
    return ((number - range1low) *
            ((range2high - range2low) / (range1high - range1low))) +
        range2low;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      drawer: drawerLeft(),
      appBar: AppBar(
          title: Text(
            "IN TIME",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          ),
          backgroundColor: clr,
          elevation: 0.0,
          leading: MaterialButton(
            child: Icon(
              Icons.view_headline,
              color: Colors.black,
            ),
            onPressed: () {
              scaffoldKey.currentState.openDrawer();
            },
          )),
      key: scaffoldKey,
      body: AnimatedContainer(
        padding: EdgeInsets.only(top: 50.0),
        duration: Duration(milliseconds: 1000),
        curve: Curves.ease,
        color: clr,
        child: PageView.builder(
          itemCount: 7, //7days
          onPageChanged: (int page) {
            this.setState(() {
              Random rnd;
              rnd = new Random();
              int r = 0 + rnd.nextInt(_colors.length - 0);
              clr = _colors[r];
              
            });
          },
          controller: pageViewController,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    height:
                        MediaQuery.of(scaffoldKey.currentContext).size.height -
                            150.0,
                    width:
                        MediaQuery.of(scaffoldKey.currentContext).size.width -
                            20.0,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          width: MediaQuery.of(scaffoldKey.currentContext)
                                  .size
                                  .width -
                              100.0,
                          left: index != currentPage
                              ? getMappedValue(20.0, 100.0, 160.0, 20.0, pos)
                              : getMappedValue(20.0, 100.0, 20.0, -120.0, pos),
                          top: 20.0,
                          child: Opacity(
                            opacity: index != currentPage
                                ? getMappedValue(20.0, 100.0, 0.0, 01.0, pos)
                                : getMappedValue(20.0, 100.0, 01.0, 00.0, pos),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      _days[index],
                                      maxLines: 1,
                                      softWrap: true,
                                      style: TextStyle(
                                          color: Colors.deepOrange,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0),
                                  child: Text(
                                    'QUOTE:',
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
