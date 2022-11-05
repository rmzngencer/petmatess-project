import 'package:flutter/material.dart';
import 'ProjectStrings.dart';

class ReusableWidgets {
  static getAppBar() {
    return AppBar(
      titleSpacing: 0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
      ),
      title: Row(
        children: [
          ImageIcon(AssetImage('assets/images/PetMatesLogo.png')),
          Text(
            ProjectStrings.appBarTitle,
            style: TextStyle(
              fontFamily: 'Kalam',
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}