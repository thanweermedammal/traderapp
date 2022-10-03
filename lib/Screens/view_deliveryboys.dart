// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trader_app/components/deliveryboys_card.dart';
import 'package:trader_app/models/pickup_model.dart';

class ViewDelivery extends StatefulWidget {
  const ViewDelivery({Key? key}) : super(key: key);

  @override
  State<ViewDelivery> createState() => _ViewDeliveryState();
}

class _ViewDeliveryState extends State<ViewDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        title: Text(
          "Flash Consignment",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: deliveryBoyModel.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: pickupCard(
                item: deliveryBoyModel[index],
                context: context,
              ),
            );
          },
        ),
      ),
    );
  }
}
