import 'package:flutter/material.dart';
import 'package:petmatesmobileapp/constants/ProjectColors.dart';
import 'ProjectStrings.dart';

class ReusableWidgets {
  static getAppBar() {
    return AppBar(
      titleSpacing: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
        padding: EdgeInsets.only(bottom: 5),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ImageIcon(AssetImage('assets/images/PetMatesLogo.png')),
          Text(
            ProjectStrings.appBarTitle,
            style: const TextStyle(
              fontFamily: 'Kalam',
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  static getBottomNavigationBar(int selectedIndex) {
    return BottomNavigationBar(
      selectedItemColor: ProjectColors.selectedNavColor,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: ProjectColors.black,
      backgroundColor: ProjectColors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 24,
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

  static getAppBarWithTabView() {
    return AppBar(
      bottom: TabBar(
        padding: EdgeInsets.symmetric(horizontal: 8),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.grey),
        splashBorderRadius: BorderRadius.circular(25),
        tabs: [
          TabBarTab('assets/images/happy-dog.png', ProjectStrings.dog),
          TabBarTab('assets/images/happy-cat.png', ProjectStrings.cat),
          TabBarTab('assets/images/happy-bird.png', ProjectStrings.bird),
          TabBarTab('assets/images/happy-fish.png', ProjectStrings.fish),
        ],
      ),
      titleSpacing: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
        padding: EdgeInsets.only(bottom: 5),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ImageIcon(AssetImage('assets/images/PetMatesLogo.png')),
          Text(
            ProjectStrings.appBarTitle,
            style: const TextStyle(
              fontFamily: 'Kalam',
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  static TabBarTab(String imageAsset, String text) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imageAsset, width: 16),
          Text(text,
              style: const TextStyle(
                color: ProjectColors.black,
                fontFamily: 'Kadwa',
                fontSize: 16,
                fontWeight: FontWeight.w500
              ))
        ],
      ),
    );
  }

}
