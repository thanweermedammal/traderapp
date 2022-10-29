// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trader_app/Screens/view_deliveryboys.dart';
import 'package:trader_app/models/driverdetails.dart';
import 'package:trader_app/models/login_model.dart';
import 'package:http/http.dart' as http;

class FlashConsignment extends StatefulWidget {
  List<Login> loginList = [];
  FlashConsignment({Key? key, required this.loginList}) : super(key: key);

  @override
  State<FlashConsignment> createState() => _FlashConsignmentState();
}

class _FlashConsignmentState extends State<FlashConsignment> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(9.9312, 76.2673);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  TextEditingController searchController = TextEditingController();
  List<DriverDetail> driverDetailList = [];
  GetDriverData() async {
    var response = await http.get(Uri.parse(
        'http://185.188.127.100/WaselleApi/api/Driver/GetDriverDetails?BranchId=${widget.loginList.first.branchId}&DriverId=${searchController.text}'));
    final driverData = jsonDecode(response.body);
    print(response.statusCode);

    setState(() {
      driverDetailList = List<DriverDetail>.from(
          driverData.map((x) => DriverDetail.fromJson(x)));
    });
    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ViewDelivery(
                    loginList: widget.loginList,
                    driverDetailList: driverDetailList,
                  )));
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    GetDriverData();
    super.initState();
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
          child: Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: TextFormField(
                // validator: phoneValidator,
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                controller: searchController,
                onChanged: (text) {
                  // mobileNumber = value;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  focusColor: Colors.greenAccent,
                  // labelStyle: ktext14,
                  labelText: "Search by Driver Id",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
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
                GetDriverData();
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
