// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, avoid_unnecessary_containers, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bottom_nav_bar/bottom_nav_bar.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:provider/provider.dart';
import 'package:trader_app/Screens/flash_consignment.dart';
import 'package:trader_app/Screens/new_consignment.dart';
import 'package:trader_app/Screens/shipment_screen.dart';
import 'package:trader_app/models/delivery_model.dart';
import 'package:trader_app/components/home/latest_shipments.dart';
import 'package:trader_app/controller/allshipment_controller.dart';

import 'package:trader_app/components/drawer.dart';
import 'package:trader_app/models/login_model.dart';
import 'package:trader_app/provider/provider.dart';

import 'home.dart';

class HomeScreen extends StatefulWidget {
  List<Login> loginList = [];
  HomeScreen(this.loginList);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;

  List<Widget>? _widgetOptions;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  AllShipmentController allShipmentController =
      Get.put(AllShipmentController());
  @override
  void initState() {
    _widgetOptions = [
      Home(widget.loginList),
      NewConsignment(widget.loginList),
      FlashConsignment(),
      Text('Notification',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ];
    // TODO: implement initState
    super.initState();
    allShipmentController.fetchAllShipmentData(
        widget.loginList.first.shipperId, widget.loginList.first.branchId);
    // Provider.of<DataProvider>(context, listen: false)
    //     .setTotalAmount(widget.loginList);
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10.0),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            color: Colors.black,
            icon: Icon(
              Icons.menu,
            ),
          ),
        ),
        // title: Container(
        //   padding: EdgeInsets.all(8),
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(8),
        //     color: Colors.white,
        //     border: Border.all(),
        //   ),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     // ignore: prefer_const_literals_to_create_immutables
        //     children: [
        //       Text(
        //         'Search ',
        //         style: TextStyle(color: Colors.grey, fontSize: 12),
        //       ),
        //       Icon(
        //         Icons.search,
        //         size: 20,
        //         color: Colors.grey,
        //       ),
        //     ],
        //   ),
        // ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "assets/images/pro.jpg",
                  height: 30,
                ),
              )),
        ],
      ),
      drawer: drawer(widget.loginList),
      body: _widgetOptions!.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
            ),
            label: 'Add Shipment',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on_outlined),
            label: 'Flash Shipment',
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
            // backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _currentIndex,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue.shade300,
        onTap: _onItemTapped,
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   // showElevation: true,
      //   selectedIndex: _currentIndex,
      //   onItemSelected: (index) {
      //     setState(() => _currentIndex = index);
      //   },
      //   items: <BottomNavBarItem>[
      //     BottomNavBarItem(
      //       title: 'Home',
      //       icon: const Icon(Icons.home_outlined),
      //       activeColor: Colors.blue.shade300,
      //       inactiveColor: Colors.black,
      //       activeBackgroundColor: Colors.white,
      //     ),
      //     BottomNavBarItem(
      //       title: 'N',
      //       icon: Icon(Icons.add_box_outlined),
      //       // Image.asset(
      //       //   "assets/images/delivery.png",
      //       //   height: 40,
      //       //   color: Colors.black,
      //       // ),
      //       activeColor: Colors.blue.shade300,
      //       inactiveColor: Colors.black,
      //       activeBackgroundColor: Colors.white,
      //     ),
      //     BottomNavBarItem(
      //       title: 'Fi',
      //       icon: const Icon(Icons.flash_auto_outlined),
      //       inactiveColor: Colors.black,
      //       activeColor: Colors.blue.shade300,
      //       activeBackgroundColor: Colors.white,
      //     ),
      //     BottomNavBarItem(
      //       title: 'Notifications',
      //       icon: const Icon(Icons.notifications_outlined),
      //       inactiveColor: Colors.black,
      //       activeColor: Colors.blue.shade300,
      //       activeBackgroundColor: Colors.white,
      //     ),
      //   ],
      // )
      // bottomNavigationBar: Row(
      //   children: [
      //     Expanded(
      //       child: Container(
      //         height: 100,
      //         color: Color.fromARGB(31, 75, 75, 75),
      //         child: InkWell(
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => NewConsignment(),
      //               ),
      //             );
      //           },
      //           child: Padding(
      //             padding: EdgeInsets.only(top: 8.0),
      //             child: Column(
      //               children: <Widget>[
      //                 Image.asset(
      //                   "assets/images/delivery.png",
      //                   height: 40,
      //                   color: HexColor('17aeb4'),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.all(5.0),
      //                   child: Text(
      //                     'New Shipment',
      //                     style: TextStyle(
      //                       color: HexColor('17aeb4'),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Expanded(
      //       child: Container(
      //         height: 100,
      //         color: Color.fromARGB(31, 75, 75, 75),
      //         child: InkWell(
      //           onTap: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => FlashConsignment(),
      //               ),
      //             );
      //           },
      //           child: Padding(
      //             padding: EdgeInsets.only(top: 8.0),
      //             child: Column(
      //               children: <Widget>[
      //                 Image.asset(
      //                   "assets/images/delivery.png",
      //                   height: 40,
      //                   color: HexColor('17aeb4'),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.all(5.0),
      //                   child: Text(
      //                     'Flash Shipment',
      //                     style: TextStyle(
      //                       color: HexColor('17aeb4'),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
