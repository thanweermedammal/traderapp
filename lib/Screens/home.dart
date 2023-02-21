import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:get/get.dart';
import 'package:trader_app/Screens/flash_consignment.dart';
import 'package:trader_app/Screens/new_consignment.dart';
import 'package:trader_app/Screens/payment_screen.dart';
import 'package:trader_app/Screens/receipt_screen.dart';
import 'package:trader_app/Screens/report_screen.dart';
import 'package:trader_app/Screens/shipment_screen.dart';
import 'package:trader_app/Screens/trackorderscreen.dart';
import 'package:trader_app/controller/allshipment_controller.dart';
import 'package:trader_app/models/delivery_model.dart';
import 'package:trader_app/components/home/latest_shipments.dart';
import 'package:trader_app/models/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:trader_app/models/trackitem_model.dart';

class Home extends StatefulWidget {
  List<Login> loginList = [];
  Home(this.loginList);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  AllShipmentController allShipmentController =
      Get.put(AllShipmentController());
  List<TrackItem> TrackDataList = [];
  TextEditingController shipmentidController = TextEditingController();
  GetTrackData() async {
    var response = await http.get(Uri.parse(
        'http://185.188.127.100/WaselleApi/api/Shipment/GetShipmentDetails?ShipperId=${widget.loginList.first.shipperId}&BranchId=${widget.loginList.first.branchId}&ShipmentId=${shipmentidController.text}'));
    final trackData = jsonDecode(response.body);
    print(response.statusCode);

    setState(() {
      TrackDataList =
          List<TrackItem>.from(trackData.map((x) => TrackItem.fromJson(x)));
    });
    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TrackOrderScreen(
                    loginList: widget.loginList,
                    trackdata: TrackDataList,
                  )));
    } else {
      print(response.statusCode);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    allShipmentController.fetchAllShipmentData(
        widget.loginList.first.shipperId, widget.loginList.first.branchId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(onRefresh: () async {
      allShipmentController.fetchAllShipmentData(
          widget.loginList.first.shipperId, widget.loginList.first.branchId);
    }, child: Obx(() {
      if (allShipmentController.isloading.value) {
        return Center(child: CircularProgressIndicator());
      } else {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Welcome,",
                  style: TextStyle(
                    color: HexColor('154C66'),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.loginList.first.name.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 154,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/track now bgedit.png'),
                          fit: BoxFit.fill)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Track Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "Track your shipment here",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            GetTrackData();
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 39,
                                  width: 48,
                                  color: HexColor('16ADB5'),
                                  child: Icon(
                                    Icons.location_on_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 39,
                                    child: TextFormField(
                                      style: TextStyle(color: Colors.white),
                                      // validator: phoneValidator,

                                      keyboardType: TextInputType.text,

                                      cursorColor: Colors.white,
                                      controller: shipmentidController,
                                      onChanged: (text) {
                                        // mobileNumber = value;
                                      },
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: HexColor('163047'),
                                        contentPadding: EdgeInsets.all(10),
                                        focusColor: Colors.white,
                                        // labelStyle: ktext14,
                                        labelText: "Search By Shipment ID",
                                        labelStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(0.0)),
                                            borderSide: BorderSide(
                                              color: Colors.black,
                                            )),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(0.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Container(
                //           height: 250,
                //           width: 200,
                //           decoration: BoxDecoration(
                //             image: DecorationImage(
                //               image: AssetImage(
                //                 "assets/images/dash 1edit.png",
                //               ),
                //               fit: BoxFit.fill,
                //             ),
                //           ),
                //           child: Column(
                //             // mainAxisAlignment: MainAxisAlignment.start,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.only(
                //                   top: 30,
                //                   left: 20,
                //                 ),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       'TOTAL',
                //                       style: TextStyle(
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w700,
                //                           color: Colors.white),
                //                     ),
                //                     Text(
                //                       'SHIPMENTS',
                //                       style: TextStyle(
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w900,
                //                           color: Colors.white),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 120,
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(left: 130),
                //                 child: Text(
                //                   allShipmentController.allshipmentList!.length
                //                       .toString(),
                //                   style: TextStyle(
                //                       fontSize: 30,
                //                       fontWeight: FontWeight.w900,
                //                       color: Colors.white),
                //                 ),
                //               )
                //             ],
                //           ) /* add child content here */,
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Container(
                //           height: 250,
                //           width: 200,
                //           decoration: BoxDecoration(
                //             image: DecorationImage(
                //               image: AssetImage(
                //                 "assets/images/dash 2edit.png",
                //               ),
                //               fit: BoxFit.fill,
                //             ),
                //           ),
                //           child: Column(
                //             // mainAxisAlignment: MainAxisAlignment.start,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.only(
                //                   top: 30,
                //                   left: 20,
                //                 ),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       'PENDING',
                //                       style: TextStyle(
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w700,
                //                           color: Colors.white),
                //                     ),
                //                     Text(
                //                       'INVOICES',
                //                       style: TextStyle(
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w900,
                //                           color: Colors.white),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 120,
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(left: 130),
                //                 child: Text(
                //                   "0",
                //                   style: TextStyle(
                //                       fontSize: 30,
                //                       fontWeight: FontWeight.w900,
                //                       color: Colors.white),
                //                 ),
                //               )
                //             ],
                //           ) /* add child content here */,
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Container(
                //           height: 250,
                //           width: 200,
                //           decoration: BoxDecoration(
                //             image: DecorationImage(
                //               image: AssetImage(
                //                 "assets/images/dash 3edit.png",
                //               ),
                //               fit: BoxFit.fill,
                //             ),
                //           ),
                //           child: Column(
                //             // mainAxisAlignment: MainAxisAlignment.start,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.only(
                //                   top: 30,
                //                   left: 20,
                //                 ),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       'TOTAL',
                //                       style: TextStyle(
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w700,
                //                           color: Colors.white),
                //                     ),
                //                     Text(
                //                       'PAYMENTS',
                //                       style: TextStyle(
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w900,
                //                           color: Colors.white),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 120,
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(left: 130),
                //                 child: Text(
                //                   "0",
                //                   style: TextStyle(
                //                       fontSize: 30,
                //                       fontWeight: FontWeight.w900,
                //                       color: Colors.white),
                //                 ),
                //               )
                //             ],
                //           ) /* add child content here */,
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Container(
                //           height: 250,
                //           width: 200,
                //           decoration: BoxDecoration(
                //             image: DecorationImage(
                //               image: AssetImage(
                //                 "assets/images/dash 4edit.png",
                //               ),
                //               fit: BoxFit.fill,
                //             ),
                //           ),
                //           child: Column(
                //             // mainAxisAlignment: MainAxisAlignment.start,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Padding(
                //                 padding: const EdgeInsets.only(
                //                   top: 30,
                //                   left: 20,
                //                 ),
                //                 child: Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Text(
                //                       'TOTAL',
                //                       style: TextStyle(
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w700,
                //                           color: Colors.white),
                //                     ),
                //                     Text(
                //                       'SHIPMENTS',
                //                       style: TextStyle(
                //                           fontSize: 16,
                //                           fontWeight: FontWeight.w900,
                //                           color: Colors.white),
                //                     ),
                //                   ],
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 120,
                //               ),
                //               Padding(
                //                 padding: const EdgeInsets.only(left: 130),
                //                 child: Text(
                //                   "0",
                //                   style: TextStyle(
                //                       fontSize: 30,
                //                       fontWeight: FontWeight.w900,
                //                       color: Colors.white),
                //                 ),
                //               )
                //             ],
                //           ) /* add child content here */,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 10),
                      child: Text(
                        'Main Menu',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: HexColor('9C9C9C')),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 10.0),
                    //   child: Text(
                    //     'Categories',
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.w900,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                // Row(
                //   // ignore: prefer_const_literals_to_create_immutables
                //   children: [
                //     Expanded(
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Divider(
                //           thickness: 1,
                //           color: Colors.green,
                //         ),
                //       ),
                //     ),
                //     Text(
                //       "Main Categories",
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 16,
                //         fontWeight: FontWeight.normal,
                //       ),
                //     ),
                //     Expanded(
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Divider(
                //           thickness: 1,
                //           color: Colors.green,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ShipmetScreen(widget.loginList)));
                        },
                        child: Container(
                          height: 105,
                          width: 105,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage('assets/images/Vector.png'),
                                size: 36,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "My Shipments",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReceiptsScreen(
                                        loginList: widget.loginList,
                                      )));
                        },
                        child: Container(
                          height: 105,
                          width: 105,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage('assets/images/vector1.png'),
                                size: 36,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Reciepts",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentScreen(
                                      loginList: widget.loginList)));
                        },
                        child: Container(
                          height: 105,
                          width: 105,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageIcon(
                                AssetImage('assets/images/invoice1.png'),
                                size: 36,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Invoices",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: 10,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => PaymentScreen(
                      //                 loginList: widget.loginList)));
                      //   },
                      //   child: Container(
                      //     height: 105,
                      //     width: 105,
                      //     decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.grey)),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         ImageIcon(
                      //           AssetImage('assets/images/payments1.png'),
                      //           size: 36,
                      //           color: Colors.grey,
                      //         ),
                      //         SizedBox(
                      //           height: 20,
                      //         ),
                      //         Text(
                      //           "Payments",
                      //           style: TextStyle(color: Colors.grey),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 ShipmetScreen(widget.loginList)));
                      //   },
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       // ignore: prefer_const_literals_to_create_immutables
                      //       children: [
                      //         Image.asset(
                      //           "assets/images/category icons my shipments edit.png",
                      //           height: 50,
                      //           color: Colors.purple.shade900,
                      //         ),
                      //         Text(
                      //           "My Shipments",
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 12,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     // Navigator.push(
                      //     //     context,
                      //     //     MaterialPageRoute(
                      //     //         builder: (context) => TrackOrderScreen(
                      //     //             loginList: widget.loginList)));
                      //   },
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8.0),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       // ignore: prefer_const_literals_to_create_immutables
                      //       children: [
                      //         Image.asset(
                      //           "assets/images/track order icon edit.png",
                      //           height: 50,
                      //           color: Colors.yellow.shade600,
                      //         ),
                      //         Text(
                      //           "Track Order",
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 12,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => ReceiptsScreen(
                      //                     loginList: widget.loginList,
                      //                   )));
                      //     },
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       // ignore: prefer_const_literals_to_create_immutables
                      //       children: [
                      //         Image.asset(
                      //           "assets/images/invoices edit.png",
                      //           height: 50,
                      //           color: Colors.greenAccent,
                      //         ),
                      //         Text(
                      //           "Receipts",
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 12,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => PaymentScreen(
                      //                   loginList: widget.loginList)));
                      //     },
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       // ignore: prefer_const_literals_to_create_immutables
                      //       children: [
                      //         Image.asset("assets/images/payments edit.png",
                      //             height: 50, color: Colors.deepOrange),
                      //         Text(
                      //           "Payments",
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 12,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //               builder: (context) => ReportScreen()));
                      //     },
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       // ignore: prefer_const_literals_to_create_immutables
                      //       children: [
                      //         Image.asset("assets/images/reports edit.png",
                      //             height: 50, color: Colors.red.shade400),
                      //         Text(
                      //           "Reports",
                      //           style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: 12,
                      //             fontWeight: FontWeight.normal,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       GestureDetector(
                //         onTap: () {},
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           // ignore: prefer_const_literals_to_create_immutables
                //           children: [
                //             Image.asset(
                //               "assets/images/invoice.png",
                //               height: 50,
                //             ),
                //             Text(
                //               "Invoices",
                //               style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.normal,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       GestureDetector(
                //         onTap: () {},
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           // ignore: prefer_const_literals_to_create_immutables
                //           children: [
                //             Image.asset(
                //               "assets/images/payments.png",
                //               height: 50,
                //             ),
                //             Text(
                //               "Payments",
                //               style: TextStyle(
                //                 color: Colors.black,
                //                 fontSize: 16,
                //                 fontWeight: FontWeight.normal,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         // ignore: prefer_const_literals_to_create_immutables
                //         children: [
                //           Image.asset(
                //             "assets/images/report.png",
                //             height: 50,
                //           ),
                //           Text(
                //             "Reports",
                //             style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 16,
                //               fontWeight: FontWeight.normal,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 10),
                      child: Text(
                        'Latest Shipments',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 10.0),
                    //   child: Text(
                    //     'Shipments',
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.w900,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                //
                // Row(
                //   // ignore: prefer_const_literals_to_create_immutables
                //   children: [
                //     Expanded(
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Divider(
                //           thickness: 1,
                //           color: Colors.green,
                //         ),
                //       ),
                //     ),
                //     Text(
                //       "Latest Shipments",
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 16,
                //         fontWeight: FontWeight.normal,
                //       ),
                //     ),
                //     Expanded(
                //       child: Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Divider(
                //           thickness: 1,
                //           color: Colors.green,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: 10,
                ),
                Obx(() {
                  if (allShipmentController.isloading.value) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: allShipmentController.allshipmentList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        int reverseIndex =
                            allShipmentController.allshipmentList!.length -
                                1 -
                                index;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: latestShipmentsCard(
                            item: allShipmentController
                                .allshipmentList![reverseIndex],
                            context: context,
                            loginList: widget.loginList,
                          ),
                        );
                      },
                    );
                  }
                }),
              ],
            ),
          ),
        );
      }
    }));
  }
}
