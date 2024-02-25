import 'package:flutter/material.dart';
import 'package:music_app/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app/components/bottom_bar.dart';
import 'package:music_app/components/appBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomIconBar(),
        body: SafeArea(
          child: Column(
            children: [
              CustomAppbar(),
              Column(
                children: [

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
