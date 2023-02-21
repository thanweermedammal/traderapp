// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:trader_app/Screens/detail.dart';

Widget allShipmentsCard(
    {@required index,
    required BuildContext context,
    required item,
    required loginList}) {
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
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.shade200),
                        child: ImageIcon(
                          AssetImage("assets/images/Vector.png"),
                          color: HexColor('16ADB5'),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shipment ID",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            item.shipmentId.toString(),
                            style: TextStyle(
                                color: HexColor('154C66'),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )

                    // Expanded(
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(vertical: 20),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Expanded(
                    //               child: Padding(
                    //                 padding:
                    //                     const EdgeInsets.symmetric(vertical: 8),
                    //                 child: Row(
                    //                   // ignore: prefer_const_literals_to_create_immutables
                    //                   children: [
                    //                     Text(
                    //                       "Order Id : ",
                    //                       style: TextStyle(
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.normal,
                    //                         color: Colors.black,
                    //                       ),
                    //                     ),
                    //                     Text(
                    //                       item.shipmentId.toString(),
                    //                       style: TextStyle(
                    //                         fontSize: 14,
                    //                         fontWeight: FontWeight.normal,
                    //                         color: Colors.black,
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ),
                    //             Text(
                    //               item.status.toString(),
                    //               style: TextStyle(
                    //                 fontSize: 14,
                    //                 fontWeight: FontWeight.normal,
                    //                 color: HexColor("297899"),
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.symmetric(vertical: 8),
                    //           child: Row(
                    //             // ignore: prefer_const_literals_to_create_immutables
                    //             children: [
                    //               Text(
                    //                 "Description : ",
                    //                 style: TextStyle(
                    //                   fontSize: 16,
                    //                   fontWeight: FontWeight.normal,
                    //                   color: Colors.black,
                    //                 ),
                    //               ),
                    //               Text(
                    //                 item.itemDescription.toString(),
                    //                 style: TextStyle(
                    //                   fontSize: 14,
                    //                   fontWeight: FontWeight.normal,
                    //                   color: Colors.black,
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.symmetric(vertical: 8),
                    //           child: Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Row(
                    //                 children: [
                    //                   Text(
                    //                     "Date of order : ",
                    //                     style: TextStyle(
                    //                       fontSize: 16,
                    //                       fontWeight: FontWeight.normal,
                    //                       color: Colors.black,
                    //                     ),
                    //                   ),
                    //                   Text(
                    //                     item.date.toString(),
                    //                     style: TextStyle(
                    //                       fontSize: 14,
                    //                       fontWeight: FontWeight.normal,
                    //                       color: Colors.black,
                    //                     ),
                    //                   ),
                    //                 ],
                    //               ),
                    //               InkWell(
                    //                 onTap: () {
                    //                   Navigator.push(
                    //                       context,
                    //                       MaterialPageRoute(
                    //                           builder: (context) => Detail(
                    //                                 item: item,
                    //                                 loginList: loginList,
                    //                               )));
                    //                 },
                    //                 child: Text(
                    //                   "View in detail",
                    //                   style: TextStyle(
                    //                     fontSize: 16,
                    //                     fontWeight: FontWeight.normal,
                    //                     color: HexColor("297899"),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 34,
                    width: 68,
                    color: Colors.grey.shade200,
                    child: Center(
                        child: Text(item.isCod == true ? "COD" : "PAID")),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.grey,
                      ),
                      Text(
                        "${item.date.toString()}",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Consumer Name",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 25,
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "${item.recieverName.toString()}",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detail(
                                  item: item,
                                  loginList: loginList,
                                )));
                  },
                  child: Container(
                    height: 31,
                    width: 111,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: HexColor('28759A')),
                    child: Center(
                      child: Text(
                        "View In Details",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
