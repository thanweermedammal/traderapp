import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/components/home/latest_shipments.dart';
import 'package:trader_app/components/trackordercard.dart';
import 'package:trader_app/controller/allshipment_controller.dart';
import 'package:trader_app/models/login_model.dart';
import 'package:trader_app/models/trackitem_model.dart';

class TrackOrderScreen extends StatelessWidget {
  List<Login> loginList = [];
  List<TrackItem> trackdata = [];
  TrackOrderScreen({Key? key, required this.loginList, required this.trackdata})
      : super(key: key);
  AllShipmentController allShipmentController =
      Get.put(AllShipmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: false,
        title: Text(
          "Track Order",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Shipment Id",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(trackdata.first.shipmentId.toString()),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Product",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(trackdata.first.itemDescription.toString())
                  ],
                ),
                Column(
                  children: [
                    // Text(
                    //   "Product",
                    //   style: TextStyle(color: Colors.grey),
                    // ),
                    // Text(trackdata.first.itemDescription.toString())
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Shipment Status",
              style: TextStyle(color: Colors.grey),
            ),
            Text(trackdata.first.status.toString())
          ],
        ),
      )),
    );
  }
}
