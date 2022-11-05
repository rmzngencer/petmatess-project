import 'package:flutter/material.dart';
import 'package:petmatesmobileapp/constants/ProjectColors.dart';
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

  static getBottomNavigationBar(int selectedIndex){
    return BottomNavigationBar(
      selectedItemColor: ProjectColors.selectedNavColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: ProjectColors.black,
      backgroundColor: ProjectColors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 26,
      elevation: 25,
      currentIndex: selectedIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/adopt-home-nav.png')),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/breed-nav.png')),
          label: 'Breeds',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/pet-map-nav.png')),
          label: 'PetMap',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage('assets/images/user-nav.png')),
          label: 'Account',
        ),
      ],
    );
  }

}