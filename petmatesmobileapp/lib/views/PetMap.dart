import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
      appBar: ReusableWidgets.getAppBar(),
      body: Container(
        child: Column(
            children: [
            mapWidget(),
            ReusableWidgets.padding20top(),
            ReusableWidgets.buttonPurpleElevated("Add Report", 200, _selectedAnyPointOnMap ? (){
              showReportDialog();
            }: null
            ),
      ],
    ),)
    ,
    );
  }

  mapWidget() {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width, // or use fixed size like 200
      height: 550,
      child: GoogleMap(
        onLongPress: (LatLng geo) {
          setState(() {
            _selectedAnyPointOnMap = true;
          });
          if (markers.isNotEmpty){
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
        builder: (context) =>
        AlertDialog(
          title: Text("Add Report"),
          content: Container(
          ),
          actions: [
            Center(
              child: ReusableWidgets.buttonPurpleElevated("Add", 150, null)
            )
          ],
        ));
  }
}
