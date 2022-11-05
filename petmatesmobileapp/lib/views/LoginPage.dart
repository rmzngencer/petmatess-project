import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:petmatesmobileapp/constants/ReusableWidgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(),
       bottomNavigationBar: ReusableWidgets.getBottomNavigationBar(3),
       body: Container(
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Pattern.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
  }
}
