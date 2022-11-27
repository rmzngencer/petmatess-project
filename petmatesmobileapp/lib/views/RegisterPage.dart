import 'package:flutter/material.dart';

import '../constants/ProjectColors.dart';
import '../constants/ReusableWidgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(context),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          child: ListView(children: [
            Column(
              children: [
                ReusableWidgets.editText('Name', nameController),
                ReusableWidgets.padding20top(),
                ReusableWidgets.editText('Surname', surnameController),
                ReusableWidgets.padding20top(),
                ReusableWidgets.editText('Phone Number', phoneNumberController),
                ReusableWidgets.padding20top(),
                ReusableWidgets.editText("Enter E-Mail", mailController),
                ReusableWidgets.padding20top(),
                ReusableWidgets.editText("Password", passwordController,
                    obscureText: true),
                ReusableWidgets.padding20top(),
                ReusableWidgets.editText(
                    'Confirm Password', confirmPasswordController,
                    obscureText: true),
                ReusableWidgets.padding40top(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("I have read "),
                    TextButton(
                        onPressed: () {
                          //USER AGGREMENT SAYFASI (DIALOG BOX)
                        },
                        child: Text("User Aggrement"))
                  ],
                ),
                ReusableWidgets.padding20top(),
                ReusableWidgets.buttonPurpleElevated(
                    "Sign Up", 200, buttonNullOrNot())
              ],
            ),
          ]),
        ),
      ),
    );
  }

  buttonNullOrNot() {
    if (checkedValue == false) {
      return null;
    } else {
      return () => {
            //DATABASE KODU
          };
    }
  }
}
