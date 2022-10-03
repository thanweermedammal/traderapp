import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:http/http.dart' as http;
import 'package:trader_app/Screens/paymentsdetail.dart';
import 'package:trader_app/Screens/receiptdetail.dart';
import 'package:trader_app/models/login_model.dart';
import 'package:trader_app/models/payment_model.dart';

class ReceiptsScreen extends StatefulWidget {
  List<Login> loginList = [];
  ReceiptsScreen({Key? key, required this.loginList}) : super(key: key);

  @override
  State<ReceiptsScreen> createState() => _ReceiptsScreenState();
}

class _ReceiptsScreenState extends State<ReceiptsScreen> {
  List<Payment> receiptlist = [];

  getDatas() async {
    var response = await http.get(Uri.parse(
        'http://185.188.127.100/WaselleApi/api/Payment/GetAllShipperReciept?ShipperId=${widget.loginList.first.shipperId}&BranchId=${widget.loginList.first.branchId}'));
    final paymentData = jsonDecode(response.body);
    print(response.statusCode);
    setState(() {
      receiptlist =
          List<Payment>.from(paymentData.map((x) => Payment.fromJson(x)));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0)),
                    child: Container(
                      height: 173,
                      width: MediaQuery.of(context).size.width,
                      color: HexColor('17B5BC'),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 60.0, left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Material(
                                  type: MaterialType.transparency,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 2),
                                          // color: Colors.greenAccent,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: InkWell(
                                        onTap: (() => Navigator.pop(context)),
                                        child: Padding(
                                          padding: EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.arrow_back_sharp,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // IconButton(
                                //   onPressed: (() => Navigator.pop(context)),
                                //   icon: Icon(
                                //     Icons.arrow_back_sharp,
                                //     color: Colors.white,
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            // validator: phoneValidator,
                            keyboardType: TextInputType.text,
                            cursorColor: Colors.green,

                            onChanged: (text) {
                              // mobileNumber = value;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              focusColor: Colors.greenAccent,
                              // labelStyle: ktext14,
                              // labelText: "Shipper ID",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  )),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 40,
                            width: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: ElevatedButton(
                              onPressed: () async {},
                              style: ElevatedButton.styleFrom(
                                primary: HexColor('17aeb4'),
                              ),
                              child: Text(
                                "Search",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: receiptlist.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReceiptsDetail(
                                receiptlist: receiptlist,
                                index: index,
                              )));
                },
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/Group 1.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 90, left: 70),
                    child: Text(receiptlist[index].txnId.toString()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
