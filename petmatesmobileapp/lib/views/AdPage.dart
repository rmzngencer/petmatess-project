import 'package:flutter/material.dart';
import 'package:petmatesmobileapp/constants/ProjectColors.dart';
import 'package:petmatesmobileapp/constants/ProjectStrings.dart';
import 'package:petmatesmobileapp/constants/ReusableWidgets.dart';
import 'package:petmatesmobileapp/views/AdAdvert.dart';

class AdPage extends StatefulWidget {
  const AdPage({Key? key}) : super(key: key);

  @override
  State<AdPage> createState() => _AdPageState();
}

class _AdPageState extends State<AdPage> {
  int columnNumber = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: ProjectColors.transparent,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AdAdvert()),
            );
          },
          child: Image.asset(
            ProjectStrings.addPetFloatingButton,
            color: ProjectColors.floatingActionButtonTransparency,
            colorBlendMode: BlendMode.modulate,
            width: 60,
            height: 60,
          ),
        ),
        appBar: ReusableWidgets.getAppBarWithTabView(),
        bottomNavigationBar: getBottomNavigationBar(index: 0),
        body: TabBarView(children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    IconButton(
                      iconSize: 20,
                      icon: Icon(Icons.filter_list),
                      onPressed: () {},
                    ),
                    IconButton(
                      iconSize: 20,
                      icon: iconButtonMenu(),
                      onPressed: () {
                        setState(() {
                          if (columnNumber == 1) {
                            columnNumber = 2;
                          } else {
                            columnNumber = 1;
                          }
                        });
                      },
                    )
                  ],
                ),
              ),
              Expanded(flex: 9, child: ListViewOrGridViewCount())
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

  ListViewOrGridViewCount() {
    if (columnNumber == 1) {
      return GridView.count(
        padding: EdgeInsets.all(20),
        crossAxisCount: 1,
        children: [
          CardViewColumnOne(
              ProjectStrings.petTestName1,
              ProjectStrings.testImage1,
              ProjectStrings.petTestAddress1,
              ProjectStrings.petTestGenderName1,
              ProjectStrings.petTestBirthday1),
          CardViewColumnOne(
              ProjectStrings.petTestName2,
              ProjectStrings.testImage2,
              ProjectStrings.petTestAddress2,
              ProjectStrings.petTestGenderName2,
              ProjectStrings.petTestBirthday2),
          CardViewColumnOne(
            ProjectStrings.petTestName3,
            ProjectStrings.testImage3,
            ProjectStrings.petTestAddress3,
            ProjectStrings.petTestGenderName3,
            ProjectStrings.petTestBirthday3,
          ),
          CardViewColumnOne(
            ProjectStrings.petTestName4,
            ProjectStrings.testImage4,
            ProjectStrings.petTestAddress4,
            ProjectStrings.petTestGenderName4,
            ProjectStrings.petTestBirthday4,
          )
        ],
      );
    }
    if (columnNumber == 2) {
      return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        children: [
          CardViewColumnTwo(
              ProjectStrings.petTestName1,
              ProjectStrings.testImage1,
              ProjectStrings.petTestAddress1,
              ProjectStrings.petTestGenderName1,
              ProjectStrings.petTestBirthday1),
          CardViewColumnTwo(
              ProjectStrings.petTestName2,
              ProjectStrings.testImage2,
              ProjectStrings.petTestAddress2,
              ProjectStrings.petTestGenderName2,
              ProjectStrings.petTestBirthday2),
          CardViewColumnTwo(
            ProjectStrings.petTestName3,
            ProjectStrings.testImage3,
            ProjectStrings.petTestAddress3,
            ProjectStrings.petTestGenderName3,
            ProjectStrings.petTestBirthday3,
          ),
          CardViewColumnTwo(
            ProjectStrings.petTestName4,
            ProjectStrings.testImage4,
            ProjectStrings.petTestAddress4,
            ProjectStrings.petTestGenderName4,
            ProjectStrings.petTestBirthday4,
          )
        ],
      );
    }
  }

  iconButtonMenu() {
    if (columnNumber == 1) {
      return Icon(Icons.drag_indicator_outlined);
    } else {
      return Icon(Icons.square_outlined);
    }
  }
}

class CardViewColumnTwo extends StatelessWidget {
  CardViewColumnTwo(this.petName, this.petImage, this.petAddress,
      this.petGender, this.petBirthDay,
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
      onTap: () {
        showDialog(
            context: context,
            builder: (context) =>
            AlertDialog(
              title: Text(petName),
              content: AdvertDescription(
                  petName, petAddress, petGender, petBirthDay, "Pug"),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontFamily: 'Jua', fontSize: 25),
                      backgroundColor: ProjectColors.purple,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Adopt $petName"),
                          content: AdvertOwner(),
                        ),
                      );
                    },
                    child: Center(child: Text("Adopt")))
              ],
            ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Card(
          elevation: 1,
          color: ProjectColors.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Column(
            children: [
              imagePet(petImage),
              ListTile(
                title: Column(
                  children: [
                    nameText(petName),
                    ReusableWidgets.padding5top(),
                    addressText(petAddress),
                    ReusableWidgets.padding5top(),
                    genderAndBirthdayTextWithIcons(petBirthDay, petGender),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  nameText(String petName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          petName,
          style: JejuGothicTextStyle(26),
        ),
        favIcon(),
      ],
    );
  }

  favIcon() {
    return IconButton(
        constraints: BoxConstraints(maxHeight: 32),
        splashRadius: 15,
        onPressed: () {},
        icon: Image.asset(
          ProjectStrings.favIcon,
          width: 15,
          height: 15,
        ));
  }

  addressText(String petAddress) {
    return Row(
      children: [
        Text(petAddress, style: JejuGothicTextStyle(9)),
      ],
    );
  }

  genderTextwithIcon(String petGender) {
    return Row(
      children: [
        Image.asset(
          returnGenderImage(petGender),
          width: 10,
          height: 10,
        ),
        Text(
          petGender,
          style: JejuGothicTextStyle(9),
        ),
      ],
    );
  }

  birthdayTextwithIcon(String petBirthDay) {
    return Row(
      children: [
        Image.asset(
          ProjectStrings.birthdayIcon,
          width: 10,
          height: 10,
        ),
        Text(petBirthDay, style: JejuGothicTextStyle(9)),
      ],
    );
  }

  genderAndBirthdayTextWithIcons(String petBirthDay, String petGender) {
    return Row(children: [
      genderTextwithIcon(petGender),
      ReusableWidgets.padding5Right(),
      birthdayTextwithIcon(petBirthDay),
    ]);
  }

  JejuGothicTextStyle(double fontSize) {
    return TextStyle(
      fontFamily: 'JejuGothic',
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
    );
  }

  returnGenderImage(String petGender) {
    if (petGender == 'Male') {
      return ProjectStrings.maleIcon;
    } else {
      return ProjectStrings.femaleIcon;
    }
  }


  imagePet(String petImage) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14), topRight: Radius.circular(14)),
      child: Image.asset(
        petImage,
        height: 90.0,
        width: 130.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class CardViewColumnOne extends StatelessWidget {
  CardViewColumnOne(this.petName, this.petImage, this.petAddress,
      this.petGender, this.petBirthDay,
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
      onTap: () {
        showDialog(
          context: context,
          builder: (context) =>
              AlertDialog(
                title: Text(petName),
                content: AdvertDescription(
                    petName, petAddress, petGender, petBirthDay, "Pug"),
                actions: [
                  Center(
                    child: ReusableWidgets.buttonPurpleElevated("Adopt",300, () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Adopt $petName"),
                    content: AdvertOwner(),
                  ),
                );
                    }),
                  )
                ],
              ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
        child: Card(
          elevation: 1,
          color: ProjectColors.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.0),
          ),
          child: Column(
            children: [
              imagePet(petImage),
              ListTile(
                title: Column(
                  children: [
                    nameText(petName),
                    ReusableWidgets.padding5top(),
                    addressText(petAddress),
                    ReusableWidgets.padding5top(),
                    genderAndBirthdayTextWithIcons(petBirthDay, petGender),
                  ],
                ),
                trailing: favIcon(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  nameText(String petName) {
    return Row(
      children: [
        Text(
          petName,
          style: JejuGothicTextStyle(40),
        ),
      ],
    );
  }

  favIcon() {
    return IconButton(
        onPressed: () {},
        icon: Image.asset(
          ProjectStrings.favIcon,
          width: 28,
          height: 28,
        ));
  }

  addressText(String petAddress) {
    return Row(
      children: [
        Text(petAddress, style: JejuGothicTextStyle(12)),
      ],
    );
  }

  genderTextwithIcon(String petGender) {
    return Row(
      children: [
        Image.asset(
          returnGenderImage(petGender),
          width: 15,
          height: 15,
        ),
        Text(
          petGender,
          style: JejuGothicTextStyle(10),
        ),
      ],
    );
  }

  birthdayTextwithIcon(String petBirthDay) {
    return Row(
      children: [
        Image.asset(
          ProjectStrings.birthdayIcon,
          width: 15,
          height: 15,
        ),
        Text(petBirthDay, style: JejuGothicTextStyle(10)),
      ],
    );
  }

  genderAndBirthdayTextWithIcons(String petBirthDay, String petGender) {
    return Row(children: [
      genderTextwithIcon(petGender),
      padding20Right(),
      birthdayTextwithIcon(petBirthDay),
    ]);
  }

  JejuGothicTextStyle(double fontSize) {
    return TextStyle(
      fontFamily: 'JejuGothic',
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
    );
  }

  returnGenderImage(String petGender) {
    if (petGender == 'Male') {
      return ProjectStrings.maleIcon;
    } else {
      return ProjectStrings.femaleIcon;
    }
  }

  padding20Right() {
    return Padding(
      padding: EdgeInsets.only(right: 20),
    );
  }

  imagePet(String petImage) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14), topRight: Radius.circular(14)),
      child: Image.asset(
        petImage,
        height: 190.0,
        width: 300.0,
        fit: BoxFit.cover,
      ),
    );
  }
}

class AdvertOwner extends StatelessWidget {
  const AdvertOwner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child : Column(
        children: [
          ownerImage(ProjectStrings.testImage2),
          ReusableWidgets.padding20top(),
          ownerInfo(Icons.badge,"Utku Kozan"),
          ReusableWidgets.padding20top(),
          ownerInfo(Icons.phone_android, "0545 373 0173"),
          ReusableWidgets.padding20top(),
          ownerInfo(Icons.location_city, "Ankara/Kecioren"),
        ],
      )
    );
  }

  ownerImage(String asset) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(100)),
      child: Image.asset(asset, width: 125,),
    );
  }

  ownerInfo(IconData icon, String text,) {
    return Row(
      children: [
        Icon(icon),
        Text(text),
      ],
    );
  }
}


class AdvertDescription extends StatelessWidget {
  final petName;
  final petGender;
  final petAddress;
  final petBreed;
  final petBirthDay;
  const AdvertDescription(this.petName, this.petAddress, this.petGender,
       this.petBirthDay, this.petBreed,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          petImages(ProjectStrings.testImage1),
          ReusableWidgets.padding5top(),
          petNameText(petName),
          ReusableWidgets.padding20top(),
          InfoTable()
        ],
      ),
    );
  }

  petNameText(String petName) {
    return Text(
      petName,
      style: TextStyle(
          fontFamily: 'JejuGothic',
          fontSize:19
      ),
    );
  }
  petImages(String asset){
    return ClipRRect(
        borderRadius: BorderRadius.all( Radius.circular(15)),
        child: Image.asset(asset,height: 180,width: 240)
    );
  }

  InfoTable() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            infoIconAndText(ProjectStrings.petBreedInfoIcon, petBreed),
            infoIconAndText(ProjectStrings.petGenderInfoIcon, petGender)
          ],
        ),
        ReusableWidgets.padding10Top(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            infoIconAndText(ProjectStrings.petBirthdayInfoIcon, petBirthDay),
            infoIconAndText(ProjectStrings.petLocationInfoIcon, "Ankara")
          ],
        ),
        ReusableWidgets.padding10Top(),
        descriptionInfo("dasfsafawfwaefawwaaewfeaw"),
      ],
    );
  }

  infoIconAndText(String asset, String title) {

      return Row(
        children: [
          Image.asset(asset,width: 35,),
          ReusableWidgets.padding5Right(),
          Text(title, style: TextStyle(
              fontFamily: 'Kadwa',
              fontSize: 15
          ),)
        ],
      );
    }

  descriptionInfo(String description) {
    return Text(
      textAlign: TextAlign.start,
      style: TextStyle(
          fontFamily: 'Kadwa',
          fontSize: 12
      ),
      description,
      maxLines: 10,
    );
  }

}

