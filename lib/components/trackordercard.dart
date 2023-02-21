// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:trader_app/components/trackdetails.dart';

import '../../Screens/detail.dart';

Widget trackOrderCard(
    {@required item, required BuildContext context, required loginList}) {
  return Container(
    height: 150,
    width: MediaQuery.of(context).size.width,
    clipBehavior: Clip.antiAlias,
    decoration: const BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, -1),
          blurRadius: 2,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(
                                          "Order Id : ",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          item.shipmentId.toString(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                TrackDetail(item.status)));
                                  },
                                  child: Text(
                                    "Track",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: HexColor("297899"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "Description : ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    item.itemDescription.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Date of order : ",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        item.date.toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
