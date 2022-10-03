import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:trader_app/models/login_model.dart';
import 'package:trader_app/provider/provider.dart';

class Detail extends StatelessWidget {
  Detail({Key? key, required this.item, required this.loginList})
      : super(key: key);
  final item;
  List<Login> loginList = [];

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Order Id /Shipment Id ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text('${item.shipmentId.toString()}'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Branch Id',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text('${item.branchId.toString()}'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Branch Id',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Item',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text('${item.itemDescription.toString()}'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Status ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text('${item.status.toString()}'),
              SizedBox(
                height: 10,
              ),
              Text(
                'From Adress ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                  '${loginList.first.name}\n${loginList.first.address}\n${loginList.first.city}'
                  ' , '
                  '${loginList.first.country}\npin :${loginList.first.zipCode}\nContact Number: ${loginList.first.mobile}'),
              SizedBox(
                height: 10,
              ),
              Text(
                'Delivered To ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text('${item.recieverName.toString()}'
                  ' '
                  '${item.recieverLastName.toString()}\n${item.recieverAddress1.toString()}\n${item.recieverCity.toString()}\npin :${item.recieveZip.toString()}\nContact Number: ${item.recieverCondactDeatils.toString()}'),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   'Customer Name  ',
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              // ),
              // Text('${loginList.first.name} '),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   'Reciever Adress  ',
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              // ),
              // Text('${item.recieverAddress1.toString()} '),
              SizedBox(
                height: 10,
              ),
              Text(
                'Reciever city  ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text('${item.recieverCity.toString()} '),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   'Reciever Zip  ',
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              // ),
              // Text('${item.recieveZip.toString()} '),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   'Reciever ContactDetails  ',
              //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              // ),
              Text('${item.recieverCondactDeatils.toString()} '),
              SizedBox(height: 20),
              QrImage(
                data:
                    "ShipmentId:${item.shipmentId.toString()},\nBranchId:${item.branchId.toString()},\nItem:${item.itemDescription.toString()},\n"
                    "status:${item.status.toString()},\nFrom Adress:${loginList.first.name}\n${loginList.first.address}\n${loginList.first.city}"
                    '${loginList.first.country}\npin :${loginList.first.zipCode}\nContact Number: ${loginList.first.mobile},'
                    '\nDelivered to: ${item.recieverName.toString()}'
                    '${item.recieverLastName.toString()}\n${item.recieverAddress1.toString()}\n${item.recieverCity.toString()}\npin :${item.recieveZip.toString()}\nContact Number: ${item.recieverCondactDeatils.toString()}',
                version: QrVersions.auto,
                size: 200.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
