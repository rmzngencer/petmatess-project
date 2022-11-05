import 'package:flutter/material.dart';
import 'package:petmatesmobileapp/constants/ProjectStrings.dart';

class AdPage extends StatelessWidget {
  const AdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PetMatesAppBar(),
      body: Column(

      ),
    );
  }

  AppBar PetMatesAppBar(){
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
