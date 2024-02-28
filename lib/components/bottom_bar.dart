import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:music_app/pages/add_music.dart';

class BottomIconBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: BottomNavigationBar(
        onTap: (covariant){
          Navigator.push( context, MaterialPageRoute(builder: (context)=> AddMusic()));
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple.shade800,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house, size: 20,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.heart), label: 'Favorites'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.circlePlay), label: 'Play'),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.circleUser), label: 'Profile'),
        ],
      ),
    );
  }
}
