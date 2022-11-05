import 'package:flutter/material.dart';
import 'package:petmatesmobileapp/constants/ReusableWidgets.dart';

class AdPage extends StatelessWidget {
  const AdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: ReusableWidgets.getAppBarWithTabView(),
        bottomNavigationBar: ReusableWidgets.getBottomNavigationBar(0),
        body: TabBarView(children: [
          Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Card(
                      color: Colors.red,
                      elevation: 20,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [Text("2.page")],
            ),
          ),
          Container(
            child: Column(
              children: [Text("3.page")],
            ),
          ),
          Container(
            child: Column(
              children: [Text("4.page")],
            ),
          ),
        ]),
      ),
    );
  }
}
