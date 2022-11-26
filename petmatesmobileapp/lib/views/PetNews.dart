import 'package:flutter/material.dart';
import '../constants/ReusableWidgets.dart';

class PetNews extends StatefulWidget {
  const PetNews({Key? key}) : super(key: key);

  @override
  State<PetNews> createState() => _PetNewsState();
}

class _PetNewsState extends State<PetNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(context),
    );
  }
}
