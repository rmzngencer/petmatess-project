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
          ImageIcon(AssetImage(ProjectStrings.petMatesLogo)),
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
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(ProjectStrings.homeNavImage)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(ProjectStrings.breedNavImage)),
          label: 'Breeds',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(ProjectStrings.petMapNavImage)),
          label: 'PetMap',
        ),
        BottomNavigationBarItem(
          icon: ImageIcon(AssetImage(ProjectStrings.userNavImage)),
          label: 'Account',
        ),
      ],
    );
  }

  static getAppBarWithTabView() {
    return AppBar(
      bottom: TabBar(
        padding: EdgeInsets.symmetric(horizontal: 25),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.grey),
        splashBorderRadius: BorderRadius.circular(25),
        tabs: [
          TabBarTab(ProjectStrings.dogTabBarImage, ProjectStrings.dog),
          TabBarTab(ProjectStrings.catTabBarImage, ProjectStrings.cat),
          TabBarTab(ProjectStrings.birdTabBarImage, ProjectStrings.bird),
          TabBarTab(ProjectStrings.fishTabBarImage, ProjectStrings.fish),
        ],
      ),
      titleSpacing: 0,
      leading: IconButton(
        splashRadius: 1,
        icon: const Icon(Icons.menu),
        onPressed: () {},
        padding: EdgeInsets.only(bottom: 5),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageIcon(AssetImage(ProjectStrings.petMatesLogo)),
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
          Image.asset(
            imageAsset,
            width: 16,
            height: 16,
          ),
          Text(text,
              style: const TextStyle(
                color: ProjectColors.black,
                fontFamily: 'Kadwa',
                fontSize: 12,
              ))
        ],
      ),
    );
  }

  static editText(String label, TextEditingController textController, {int maxLines=1}) {
    return TextField(
      maxLines: maxLines,
      controller: textController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(5),
        hintText: label,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple,
            width: 0.1,
          ),
        )
      ),
    );
  }

  static divider(String titleText){
    return Container(
      width:125,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: TextStyle(
            fontFamily: 'Kalam',
              fontSize: 15,
          ),),
          Divider(
            thickness: 1,
            color: ProjectColors.black,
          ),
        ],
      ),
    );
  }

  static padding20Right() {
    return Padding(
      padding: EdgeInsets.only(right: 20),
    );
  }


  static padding20top(){
    return Padding(
      padding: EdgeInsets.only(top: 20),
    );
  }

  static padding5top(){
    return Padding(
      padding: EdgeInsets.only(top: 5),
    );
  }

  static padding10Top() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
    );
  }

  static padding5Right() {
    return Padding(
      padding: EdgeInsets.only(right: 5),
    );
  }
}
