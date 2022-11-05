import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/ProjectColors.dart';
import 'views/AdPage.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home:  AdPage(),
    );
  }
}
