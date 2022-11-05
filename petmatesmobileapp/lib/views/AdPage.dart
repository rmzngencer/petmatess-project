import 'package:flutter/material.dart';
import 'package:petmatesmobileapp/constants/ReusableWidgets.dart';

class AdPage extends StatelessWidget {
  const AdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(),
      bottomNavigationBar: ReusableWidgets.getBottomNavigationBar(0),
      body: Column(

      ),
    );
  }
}