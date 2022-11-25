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
  GoogleMapController? mapController;
  Set<Marker> markers = Set();
  LatLng startLocation = LatLng(39.9033766, 32.7627648);

  @override
  void initState() {
    addMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ReusableWidgets.getBottomNavigationBar(2),
      appBar: ReusableWidgets.getAppBar(),
      body: mapWidget(),
    );
  }

  mapWidget() {
    return GoogleMap(
      markers: markers,
      myLocationButtonEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
          target: startLocation,
          zoom: 15
      ),
      tiltGesturesEnabled: true,
      compassEnabled: true,
      scrollGesturesEnabled: true,
      zoomGesturesEnabled: true,
      onMapCreated: (GoogleMapController controller) {
        setState(() {
          mapController = controller;
        });
      },
    );
  }

  addMarkers() async {
    final Uint8List markerIcon = await getBytesFromAsset(ProjectStrings.petMarkerIcon,200);
    markers.add(
        Marker( //add start location marker
          markerId: MarkerId(startLocation.toString()),
          position: startLocation, //position of marker
          infoWindow: InfoWindow( //popup info
            title: 'Test',
            snippet: 'Marker',
          ),
          icon: BitmapDescriptor.fromBytes(markerIcon), //Icon for Marker
        )
    );
    setState(() {
      //refresh UI
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
}
