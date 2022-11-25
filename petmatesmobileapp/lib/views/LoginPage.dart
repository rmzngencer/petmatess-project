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
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          appBar: ReusableWidgets.getAppBar(),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.all(50),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail',
                      hintText: 'Enter e-mail',
                    ),
                  ),
                ),Padding(
                  padding: EdgeInsets.all(50),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Pattern.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
