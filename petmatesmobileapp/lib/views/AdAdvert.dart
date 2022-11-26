import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmatesmobileapp/constants/ProjectStrings.dart';
import 'package:petmatesmobileapp/constants/ReusableWidgets.dart';

class AdAdvert extends StatefulWidget {
  const AdAdvert({Key? key}) : super(key: key);

  @override
  State<AdAdvert> createState() => _AdAdvertState();
}

class _AdAdvertState extends State<AdAdvert> {
  final ImagePicker _picker = ImagePicker();
  File? image;
  List<File> multipleImages = [];
  double? heightImage = 70.0;
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  List<String> genderItems = ['Male', 'Female', 'Unknown'];
  String? selectedGender = 'Male';
  List<String> petTypeItems = ['Dog', 'Cat', 'Bird', 'Fish'];
  String? selectedPetType = 'Dog';
  TextEditingController petNameController = TextEditingController();
  TextEditingController advertDescriptionController = TextEditingController();
  TextEditingController addressDescriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusableWidgets.getAppBar(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            ReusableWidgets.divider('Images'),
            imagePicker(heightImage!),
            ReusableWidgets.padding20top(),
            ReusableWidgets.divider('Pet Name'),
            ReusableWidgets.editText("", petNameController),
            ReusableWidgets.padding20top(),
            editTextGenderAndBirthDate(),
            ReusableWidgets.padding20top(),
            editTextPetTypeAndPetBreed(),
            ReusableWidgets.padding20top(),
            ReusableWidgets.divider('Description'),
            ReusableWidgets.editText(
                "", advertDescriptionController,
                maxLines: 3),
            ReusableWidgets.padding20top(),
            editTextCityAndDisctrict(),
            ReusableWidgets.padding20top(),
            ReusableWidgets.editText(
                "", addressDescriptionController,
                maxLines: 3),
            ReusableWidgets.padding20top(),
            ReusableWidgets.buttonPurpleElevated("Share", 200, () { })
          ],
        ),
      ),
    );
  }

  Row editTextGenderAndBirthDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        genderDropDownButton(),
        birtDateTextField(),
      ],
    );
  }

  genderDropDownButton() {
    return Column(
      children: [
        ReusableWidgets.divider("Gender"),
        SizedBox(
          width: 120,
          child: DropdownButton<String>(
            icon: Image.asset(ProjectStrings.dropDownIcon),
            isExpanded: true,
            value: selectedGender,
            items: genderItems
                .map((item) =>
                    DropdownMenuItem<String>(value: item, child: Text(item, style: TextStyle(
                      fontFamily: 'Kalam'
                    ),)))
                .toList(),
            onChanged: (item) => setState(() => selectedGender = item),
          ),
        ),
      ],
    );
  }

  birtDateTextField() {
    return Column(
      children: [
        ReusableWidgets.divider("Birthdate"),
        SizedBox(
          width: 120,
          child: TextField(
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize:  12
                ),
                icon: Icon(Icons.calendar_month_outlined),
                contentPadding: EdgeInsets.all(5),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.purple,
                    width: 0.1,
                  ),
                ),
                hintText: birthDateHintText(),
              ),
              readOnly: true,
              onTap: () async {
                _selectDate(context);
              }),
        ),
      ],
    );
  }

  editTextPetTypeAndPetBreed() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        petTypeDropDownButton(),
        petBreedDropDownButton(),
      ],
    );
  }

  petTypeDropDownButton() {
    return Column(
      children: [
        ReusableWidgets.divider("Pet Type"),
        SizedBox(
          width: 120,
          child: DropdownButton<String>(
            icon: Image.asset(ProjectStrings.dropDownIcon),
            isExpanded: true,
            value: selectedPetType,
            items: petTypeItems
                .map((item) =>
                    DropdownMenuItem<String>(value: item, child: Text(item, style: TextStyle(fontFamily: 'Kalam'),)))
                .toList(),
            onChanged: (item) => setState(() => selectedPetType = item),
          ),
        ),
      ],
    );
  }

  petBreedDropDownButton() {
    return Column(
      children: [
        ReusableWidgets.divider("Pet Breed"),
        SizedBox(
          width: 120,
          child: DropdownButton<String>(
            icon: Image.asset(ProjectStrings.dropDownIcon),
            isExpanded: true,
            value: selectedPetType,
            items: petTypeItems
                .map((item) =>
                    DropdownMenuItem<String>(value: item, child: Text(item, style: TextStyle(fontFamily: 'Kalam'),)))
                .toList(),
            onChanged: (item) => setState(() => selectedPetType = item),
          ),
        ),
      ],
    );
  }

  editTextCityAndDisctrict() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        cityDropDownButton(),
        districtDropDownButton(),
      ],
    );
  }

  cityDropDownButton() {
    return Column(
      children: [
        ReusableWidgets.divider("City"),
        SizedBox(
          width: 120,
          child: DropdownButton<String>(
            icon: Image.asset(ProjectStrings.dropDownIcon),
            isExpanded: true,
            value: selectedPetType,
            items: petTypeItems
                .map((item) =>
                    DropdownMenuItem<String>(value: item, child: Text(item, style: TextStyle(fontFamily: 'Kalam'),)))
                .toList(),
            onChanged: (item) => setState(() => selectedPetType = item),
          ),
        ),
      ],
    );
  }

  districtDropDownButton() {
    return Column(
      children: [
        ReusableWidgets.divider("District"),
        SizedBox(
          width: 120,
          child: DropdownButton<String>(
            icon: Image.asset(ProjectStrings.dropDownIcon),
            isExpanded: true,
            value: selectedPetType,
            items: petTypeItems
                .map((item) =>
                    DropdownMenuItem<String>(value: item, child: Text(item, style: TextStyle(fontFamily: 'Kalam'),)))
                .toList(),
            onChanged: (item) => setState(() => selectedPetType = item),
          ),
        ),
      ],
    );
  }


  imagePicker(double heightImage) {
    print(heightImage);
    return Container(
      height: heightImage,
      child: Column(
        children: [
          IconButton(
            iconSize: 50,
            icon: Image.asset(ProjectStrings.addPetImageBlack),
            onPressed: () {
              selectImages();
            },
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, mainAxisSpacing: 5,crossAxisSpacing: 5),
                itemCount: multipleImages.length,
                itemBuilder: (context, index) {
                  return Image.file(File(
                    multipleImages[index].path),
                    fit: BoxFit.cover,
                  );
                }),
          ),

        ],
      ),
    );
  }

  void selectImages() async {
    List<XFile>? picked = await _picker.pickMultiImage();
    if (picked.isNotEmpty) {
      setState(() {
        multipleImages = picked.map((e) => File(e.path)).toList();
        if (multipleImages.length > 0){
          heightImage = 160.0;
        }
        if (multipleImages.length > 4){
          heightImage = 250.0;
        }
      });
    }
  }

  String birthDateHintText() {
    if (selectedDate == null){
      return DateTime.now().toString();
    }else{
      return ('${selectedDate.year} -' + '${selectedDate.month} -' + '${selectedDate.day}');
    }
  }
}
