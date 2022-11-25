import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petmatesmobileapp/constants/ReusableWidgets.dart';
import 'package:petmatesmobileapp/views/AdAdvert.dart';
import 'package:petmatesmobileapp/views/LoginPage.dart';
import 'package:petmatesmobileapp/views/PetMap.dart';
import 'package:petmatesmobileapp/views/PetNews.dart';
import 'constants/ProjectColors.dart';
import 'constants/ProjectStrings.dart';
import 'views/AdPage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: ProjectColors.transparent,
          titleTextStyle: TextStyle(
            color: ProjectColors.black,
          ),
          foregroundColor: ProjectColors.black,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          elevation: 0
        )
      ),
      home: myHomePageState()
    );
  }
}

class myHomePageState extends StatefulWidget {
  const myHomePageState({Key? key}) : super(key: key);

  @override
  State<myHomePageState> createState() => _myHomePageStateState();
}

class _myHomePageStateState extends State<myHomePageState> {
  int _currentIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (selectedIndex){
          _pageController.animateToPage(selectedIndex, duration: Duration(milliseconds: 250), curve: Curves.ease);
        },
        selectedItemColor: ProjectColors.selectedNavColor,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: ProjectColors.black,
        backgroundColor: ProjectColors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 24,
        elevation: 25,
        currentIndex: _currentIndex,
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
      ),
      body: PageView(
        onPageChanged: (newIndex){
          setState(() {
            _currentIndex = newIndex;
          });
        },
        controller: _pageController,
        children: [
          AdPage(),
          PetNews(),
          PetMap(),
          LoginPage(),
        ],
      ),
    );
  }
}

