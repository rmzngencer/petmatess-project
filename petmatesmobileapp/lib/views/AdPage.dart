import 'package:flutter/material.dart';
import 'package:petmatesmobileapp/constants/ProjectColors.dart';
import 'package:petmatesmobileapp/constants/ProjectStrings.dart';
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
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    IconButton(
                      iconSize: 20,
                      icon: Icon(Icons.filter_list),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 20,
                      icon: Icon(Icons.crop_square),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 45,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 46, vertical: 18),
                  child: ListView(
                    children: [
                      CardView(
                          ProjectStrings.petTestName1,
                          ProjectStrings.testImage1,
                          ProjectStrings.petTestAddress1,
                          ProjectStrings.petTestGenderName1,
                          ProjectStrings.petTestBirthday1),
                      CardView(
                          ProjectStrings.petTestName2,
                          ProjectStrings.testImage2,
                          ProjectStrings.petTestAddress2,
                          ProjectStrings.petTestGenderName2,
                          ProjectStrings.petTestBirthday2),
                      CardView(
                          ProjectStrings.petTestName3,
                          ProjectStrings.testImage3,
                          ProjectStrings.petTestAddress3,
                          ProjectStrings.petTestGenderName3,
                          ProjectStrings.petTestBirthday3,),
                      CardView(
                        ProjectStrings.petTestName4,
                        ProjectStrings.testImage4,
                        ProjectStrings.petTestAddress4,
                        ProjectStrings.petTestGenderName4,
                        ProjectStrings.petTestBirthday4,)
                    ],
                  ),
                ),
              )
            ],
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

class CardView extends StatelessWidget {
  CardView(this.petName, this.petImage, this.petAddress, this.petGender,
      this.petBirthDay,
      {Key? key})
      : super(key: key);
  final petName;
  final petImage;
  final petAddress;
  final petGender;
  final petBirthDay;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        color: ProjectColors.cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14), topRight: Radius.circular(14)),
              child: Image.asset(
                petImage,
                height: 190.0,
                width: 500.0,
                fit: BoxFit.cover,
              ),
            ),
            nameText(petName),
            addressText(petAddress),
            GenderAndBirthdayTextWithIcons(petBirthDay, petGender),
          ],
        ),
      ),
    );
  }

  Row nameText(String petName) {
    return Row(
      children: [
        Text(
          petName,
          style: JejuGothicTextStyle(40),
        ),
      ],
    );
  }
  Row addressText(String petAddress) {
    return Row(
      children: [
        Text(
          petAddress,
          style: JejuGothicTextStyle(12)
        ),
      ],
    );
  }
  Row genderTextwithIcon(String petGender) {
    return Row(
      children: [
        Image.asset(returnGenderImage(petGender),width: 15,height: 15,),
        Text(
          petGender,
          style: JejuGothicTextStyle(10),
        ),
      ],
    );
  }
  Row birthdayTextwithIcon(String petBirthDay) {
    return Row(
      children:[
        Image.asset(ProjectStrings.birthdayIcon,width: 15,height: 15,),
        Text(
            petBirthDay,
            style: JejuGothicTextStyle(10)
        ),
      ],
    );
  }
  Row GenderAndBirthdayTextWithIcons(String petBirthDay,String petGender) {
    return Row(
      children:[
        genderTextwithIcon(petGender),
        padding20Right(),
        birthdayTextwithIcon(petBirthDay),
    ]
    );
  }
  TextStyle JejuGothicTextStyle(double fontSize){
    return TextStyle(
      fontFamily: 'JejuGothic',
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
    );
  }
  String returnGenderImage(String petGender){
    if (petGender == 'Male'){
      return ProjectStrings.maleIcon;
    }else{
      return ProjectStrings.femaleIcon;
    }
  }
  Padding padding20Right(){
    return Padding(
      padding: EdgeInsets.only(right: 20),
    );
  }
}
