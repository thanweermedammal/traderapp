import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trader_app/controller/allshipment_controller.dart';
import 'package:trader_app/models/delivery_model.dart';
import 'package:http/http.dart' as http;
import 'package:trader_app/models/login_model.dart';
import 'allshipment_card.dart';
import 'home/latest_shipments.dart';

class ShipmentData extends StatefulWidget {
  List<Login> loginList = [];
  ShipmentData(this.loginList);

  @override
  State<ShipmentData> createState() => _ShipmentDataState();
}

class _ShipmentDataState extends State<ShipmentData>
    with SingleTickerProviderStateMixin {
  AllShipmentController allShipmentController =
      Get.put(AllShipmentController());
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   allShipmentController.fetchAllShipmentData();
  //   print(allShipmentController.allshipmentList!.length);
  // }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // allShipmentController.fetchAllShipmentData();
      },
      child: ListView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemCount: allShipmentController.allshipmentList!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: allShipmentsCard(
                context: context,
                allshipmentController: allShipmentController,
                index: index,
                loginList: widget.loginList),
          );
        },
      ),
    );
  }
}
