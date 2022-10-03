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
import 'package:trader_app/controller/allshipment_controller.dart';
import 'package:trader_app/models/delivery_model.dart';
import 'package:trader_app/components/home/latest_shipments.dart';
import 'package:trader_app/models/login_model.dart';

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
                  "Welcome",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Note to be added here !",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 250,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/dash 1edit.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 30,
                                  left: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'TOTAL',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'SHIPMENTS',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 120,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 130),
                                child: Text(
                                  allShipmentController.allshipmentList!.length
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ) /* add child content here */,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 250,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/dash 2edit.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 30,
                                  left: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PENDING',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'INVOICES',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 120,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 130),
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ) /* add child content here */,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 250,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/dash 3edit.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 30,
                                  left: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'TOTAL',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'PAYMENTS',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 120,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 130),
                                child: Text(
                                  "3",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ) /* add child content here */,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 250,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/dash 4edit.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 30,
                                  left: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'TOTAL',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      'SHIPMENTS',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 120,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 130),
                                child: Text(
                                  "13",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ) /* add child content here */,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 10),
                      child: Text(
                        'Main',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShipmetScreen(widget.loginList)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Image.asset(
                                  "assets/images/category icons my shipments edit.png",
                                  height: 50,
                                  color: Colors.purple.shade900,
                                ),
                                Text(
                                  "My Shipments",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Image.asset(
                                  "assets/images/track order icon edit.png",
                                  height: 50,
                                  color: Colors.yellow.shade600,
                                ),
                                Text(
                                  "Track Order",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReceiptsScreen(
                                            loginList: widget.loginList,
                                          )));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Image.asset(
                                  "assets/images/invoices edit.png",
                                  height: 50,
                                  color: Colors.greenAccent,
                                ),
                                Text(
                                  "Receipts",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentScreen(
                                          loginList: widget.loginList)));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Image.asset("assets/images/payments edit.png",
                                    height: 50, color: Colors.deepOrange),
                                Text(
                                  "Payments",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ReportScreen()));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Image.asset("assets/images/reports edit.png",
                                    height: 50, color: Colors.red.shade400),
                                Text(
                                  "Reports",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
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
                        'Latest',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Shipments',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
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
