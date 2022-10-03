// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trader_app/Screens/view_deliveryboys.dart';

class FlashConsignment extends StatefulWidget {
  const FlashConsignment({Key? key}) : super(key: key);

  @override
  State<FlashConsignment> createState() => _FlashConsignmentState();
}

class _FlashConsignmentState extends State<FlashConsignment> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(9.9312, 76.2673);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Flash Consignment",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Search by name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 15.0,
        ),
      ),
      bottomNavigationBar: Container(
        height: 200,
        color: Colors.white,
        child: Center(
          child: Container(
            height: 50,
            width: 300,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewDelivery()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: HexColor('17aeb4'),
              ),
              child: Text(
                "Click Here to view",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xffffffff),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
