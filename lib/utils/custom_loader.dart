import 'dart:math';

import 'package:flutter/material.dart';

class CustomLoader extends StatefulWidget {
  @override
  _CustomLoaderState createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> anim_rotation;
  Animation<double> anim_radius_in;
  Animation<double> anim_radius_out;
  Color clr = Colors.orange;
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

  final double initialRadius = 60.0;
  double radius = 0.0;
  final double smallRadius = 8.0;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    anim_rotation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));
    anim_radius_in = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));
    anim_radius_out = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));

    setState(() {

    });
    controller.addListener(() {
      setState(() {
        Random rnd;
        rnd = new Random();

        if (controller.value >= 0.75 && controller.value <= 1.0) {
          radius = anim_radius_in.value * initialRadius;
          int r = 0 + rnd.nextInt(_colors.length - 0);
          clr = _colors[r];

        } else if (controller.value >= 0.0 && controller.value <= 0.25) {
          radius = anim_radius_out.value * initialRadius;
          int r = 0 + rnd.nextInt(_colors.length - 0);
          clr = _colors[r];

        }

      });
    });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Center(
        child: RotationTransition(
          turns: anim_rotation,
          child: Stack(
            children: <Widget>[
              Dot(
                radius: 30.0,
                color: clr,
              ),
              Transform.translate(
                offset: Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                child: Dot(
                  radius: smallRadius,
                  color: clr,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                child: Dot(
                  radius: smallRadius,
                  color: clr,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                child: Dot(
                  radius: smallRadius,
                  color: clr,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                child: Dot(
                  radius: smallRadius,
                  color: clr,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                child: Dot(
                  radius: smallRadius,
                  color: clr,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                child: Dot(
                  radius: smallRadius,
                  color: clr,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                child: Dot(
                  radius: smallRadius,
                  color: clr,
                ),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                child: Dot(
                  radius: smallRadius,
                  color: clr,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;

  Dot({Key key, this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
      ),
    );
  }
}
