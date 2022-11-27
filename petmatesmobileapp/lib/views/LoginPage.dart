import 'package:flutter/material.dart';
import 'package:petmatesmobileapp/constants/ReusableWidgets.dart';
import 'package:petmatesmobileapp/views/RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: ReusableWidgets.getAppBar(context),
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              padding: EdgeInsets.all(50),
              child: Column(
                children:  [
                  ReusableWidgets.padding40top(),
                  ReusableWidgets.editText("Enter E-Mail", mailController),
                  ReusableWidgets.padding20top(),
                  ReusableWidgets.editText("Password", passwordController, obscureText: true),
                  ReusableWidgets.padding40top(),
                  ReusableWidgets.buttonPurpleElevated("Login", 200, () => {
                  }
                  ),
                  ReusableWidgets.padding20top(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("If you have not any account,"),
                      TextButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterPage()),
                        );
                      }, child: Text("Sign Up")),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

