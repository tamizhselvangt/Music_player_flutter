import 'package:flutter/material.dart';
import 'homePage.dart';
import 'sideMenu.dart';
import 'dart:math';

class Entry_Point extends StatefulWidget {
  const Entry_Point({super.key});

  @override
  State<Entry_Point> createState() => _Entry_PointState();
}

class _Entry_PointState extends State<Entry_Point>
    with SingleTickerProviderStateMixin {
  bool isSideMenuClosed = true;

  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scalanimation;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(() {
            setState(() {});
          });
    animation = Tween<double>(begin: 0, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));

    scalanimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF172034),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(children: [
        AnimatedPositioned(
            duration: Duration(milliseconds: 100),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: isSideMenuClosed ? -288 : 0,
            height: MediaQuery.of(context).size.height,
            child: SideMenu()),
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(animation.value - 30 * animation.value * pi / 180),
          child: Transform.translate(
            offset: Offset(animation.value * 265, 0),
            child: Transform.scale(
                scale: scalanimation.value,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(34)),
                    child: HomePage())),
          ),
        ),
        SafeArea(
          child: IconButton(
              onPressed: () {
                bool value = false;
                setState(() {
                  if (isSideMenuClosed) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                  isSideMenuClosed = !isSideMenuClosed;
                });
              },
              icon: Icon(
                Icons.grid_view_rounded,
                size: 35.0,
                color: Colors.white70,
              )),
        ),
      ]),
    );
  }
}
