import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmatesmobileapp/constants/ProjectStrings.dart';
import 'package:petmatesmobileapp/constants/ReusableWidgets.dart';
import 'dart:ui' as ui;

class PetMap extends StatefulWidget {
  const PetMap({Key? key}) : super(key: key);

  @override
  State<PetMap> createState() => _PetMapState();
}

class _PetMapState extends State<PetMap> {
  bool _selectedAnyPointOnMap = false;
  GoogleMapController? mapController;
  Set<Marker> markers = Set();
  LatLng startLocation = LatLng(39.9033766, 32.7627648);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: ReusableWidgets.getAppBar(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                mapWidget(),
                ReusableWidgets.padding20top(),
                ReusableWidgets.buttonPurpleElevated(
                    "Add Report",
                    200,
                    _selectedAnyPointOnMap
                        ? () {
                            showReportDialog();
                          }
                        : null),
              ],
            ),
          ),
        ));
  }

  mapWidget() {
    return SizedBox(
      width: MediaQuery.of(context).size.width, // or use fixed size like 200
      height: 550,
      child: GoogleMap(
        onLongPress: (LatLng geo) {
          setState(() {
            _selectedAnyPointOnMap = true;
          });
          if (markers.isNotEmpty) {
            markers.remove(markers.last);
          }
          addMarkers(geo);
        },
        markers: markers,
        myLocationButtonEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(target: startLocation, zoom: 15),
        tiltGesturesEnabled: true,
        compassEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }

  addMarkers(LatLng geo) async {
    final Uint8List markerIcon =
        await getBytesFromAsset(ProjectStrings.petMarkerIcon, 200);
    markers.add(markerWidget(geo, markerIcon));
    setState(() {
      //refresh UI
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  Marker markerWidget(LatLng geo, Uint8List icon) {
    return Marker(
      markerId: MarkerId(geo.toString()),
      position: geo, //position of marker
      icon: BitmapDescriptor.fromBytes(icon), //Icon for Marker
    );
  }

  showReportDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add Report"),
              content: showAddReportDialog(),
              actions: [
                Center(
                    child:
                        ReusableWidgets.buttonPurpleElevated("Add", 150, null))
              ],
            ));
  }
}

class showAddReportDialog extends StatefulWidget {
  const showAddReportDialog({Key? key}) : super(key: key);

  @override
  State<showAddReportDialog> createState() => _showAddReportDialogState();
}

class _showAddReportDialogState extends State<showAddReportDialog> {
  List<String> dropdownItems = [
    'Dangereous Stray Dogs',
    'Injured Animals',
    'Hungry Animals',
    'Abondoned Animals'
  ];
  String? selectedDropdown = 'Dangereous Stray Dogs';
  TextEditingController textEditingController = TextEditingController();
  File? image;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(children: [
          imageIconButton(),
          ReusableWidgets.padding40top(),
          addReportDropDown(),
          ReusableWidgets.padding40top(),
          ReusableWidgets.editText("Description", textEditingController,
              maxLines: 3)
        ]),
      ),
    );
  }

  imageIconButton() {
    return IconButton(
        icon: IconButtonImage(),
        onPressed: () {
          pickImage();
        },
        iconSize: 250);
  }

  addReportDropDown() {
    return DropdownButton<String>(
      icon: Image.asset(ProjectStrings.dropDownIcon),
      isExpanded: true,
      value: selectedDropdown,
      items: dropdownItems
          .map((item) =>
              DropdownMenuItem<String>(value: item, child: Text(item)))
          .toList(),
      onChanged: (item) => setState(() => selectedDropdown = item),
    );
  }

    Future pickImage() async {
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemp = File(image.path);
        setState(() => this.image = imageTemp);
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    }

  Widget IconButtonImage() {
    if (image!=null){
      return Image.file(image!);
    }else{
      return Image.asset(ProjectStrings.petAddReportImage);
    }
  }
}
