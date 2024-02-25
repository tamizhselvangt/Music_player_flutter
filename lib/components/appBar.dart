import 'package:flutter/material.dart';



class CustomAppbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.grid_view_rounded,
            size: 30.0,
            color: Colors.white70,)),
          CircleAvatar(
          )
        ],

      ),
    );
  }
}
