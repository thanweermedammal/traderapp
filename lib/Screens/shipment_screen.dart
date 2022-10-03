import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:get/get.dart';
import 'package:trader_app/components/shipment_data.dart';
import 'package:trader_app/controller/allshipment_controller.dart';
import 'package:trader_app/models/login_model.dart';

class ShipmetScreen extends StatefulWidget {
  List<Login> loginList = [];
  ShipmetScreen(this.loginList);

  @override
  State<ShipmetScreen> createState() => _ShipmetScreenState();
}

class _ShipmetScreenState extends State<ShipmetScreen>
    with TickerProviderStateMixin {
  int _currentIndex = 1;
  AllShipmentController allShipmentController =
      Get.put(AllShipmentController());
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   allShipmentController.fetchAllShipmentData(widget.loginList.first.shipperId,widget.);
  // }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);

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
          "My Shipments",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(130),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.green,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          'Enter Shipment Id',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('17aeb4'),
                      ),
                      child: Text(
                        "Search",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              TabBar(
                  controller: tabController,
                  indicator: BoxDecoration(
                    color: Color.fromARGB(255, 179, 233, 181),
                  ),
                  indicatorWeight: 5,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Text(
                        'All',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Under Review',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'On Going',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Cancelled',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ])
            ],
          ),
        ),
      ),
      body: TabBarView(controller: tabController, children: [
        ShipmentData(widget.loginList),
        ShipmentData(widget.loginList),
        ShipmentData(widget.loginList),
        ShipmentData(widget.loginList),
      ]),
    );
  }
}
