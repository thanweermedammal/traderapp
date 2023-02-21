// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:trader_app/models/login_model.dart';

class NewConsignment extends StatefulWidget {
  List<Login> loginList = [];

  NewConsignment(this.loginList);

  @override
  State<NewConsignment> createState() => _NewConsignmentState();
}

class _NewConsignmentState extends State<NewConsignment> {
  var selectedIndexes = [];
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController itemController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  bool yescheck = true;
  bool nocheck = false;
  bool partialcheck = false;
  final now = DateTime.now();

  List<dynamic> images = [];
  List details = [];

  postShipment() async {
    String jsonData;
    jsonData = json.encode(details);
    var response = await http.post(
        Uri.parse(
            'http://185.188.127.100/WaselleApi/api/Shipment/SaveShipment'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: jsonData);

    if (response.statusCode == 200) {
      // var data = jsonDecode(response.body);
      final snackBar =
          SnackBar(content: Text('Successfully Booked ${response.body}'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => NewConsignment(widget.loginList)));
      print(response.body);
    } else {
      print(response.statusCode);
      print('failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: details.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(1, 1),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Name : ${details[index]["RecieverName"]}',
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          details.removeAt(index);
                                        });
                                      },
                                      child: Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Address : ${details[index]["RecieverAddress1"]}',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'City : ${details[index]["RecieverCity"]}',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Zip Code : ${details[index]["RecieveZip"]}',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Cod Amount : ${details[index]["CODAmount"]}',
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
              SizedBox(
                height: 20,
              ),
              Text(
                "Reciever Info",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Total Orders  : ${details.length}",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "First Name",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        // validator: phoneValidator,

                        keyboardType: TextInputType.text,
                        cursorColor: Colors.green,
                        controller: firstNameController,
                        onChanged: (text) {
                          // mobileNumber = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          focusColor: Colors.greenAccent,
                          // labelStyle: ktext14,
                          // labelText: "First Name",
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
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Last Name",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        // validator: phoneValidator,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.green,
                        controller: lastNameController,
                        onChanged: (text) {
                          // mobileNumber = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          focusColor: Colors.greenAccent,
                          // labelStyle: ktext14,
                          // labelText: "Last Name",
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
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Address",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  // validator: phoneValidator,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.green,
                  controller: address1Controller,
                  onChanged: (text) {
                    // mobileNumber = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    focusColor: Colors.greenAccent,
                    // labelStyle: ktext14,
                    // labelText: "Address Line1",
                    labelStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          color: Colors.black,
                        )),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "ZipCode",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormField(
                                  // validator: phoneValidator,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.green,
                                  controller: zipCodeController,
                                  onChanged: (text) {
                                    // mobileNumber = value;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    focusColor: Colors.greenAccent,
                                    // labelStyle: ktext14,
                                    // labelText: "Zip Code",
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        )),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "City",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: TextFormField(
                                  // validator: phoneValidator,
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.green,
                                  controller: cityController,
                                  onChanged: (text) {
                                    // mobileNumber = value;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    focusColor: Colors.greenAccent,
                                    // labelStyle: ktext14,
                                    // labelText: "City",
                                    labelStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        )),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Contact Number",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    color: HexColor('17aeb4'),
                    child: Icon(
                      Icons.phone_enabled_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        // validator: phoneValidator,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.green,
                        controller: contactController,
                        onChanged: (text) {
                          // mobileNumber = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          focusColor: Colors.greenAccent,
                          // labelStyle: ktext14,
                          // labelText: "Contact Details (mandatory)",
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
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "Alternative Number",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    color: HexColor('17aeb4'),
                    child: Icon(
                      Icons.phone_enabled_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        // validator: phoneValidator,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.green,
                        // controller: _phoneController,
                        onChanged: (text) {
                          // mobileNumber = value;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          focusColor: Colors.greenAccent,
                          // labelStyle: ktext14,

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
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "COD",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Checkbox(
                                  value: yescheck,
                                  onChanged: (bool? newvalue) {
                                    setState(() {
                                      yescheck = true;
                                      if (yescheck == true) {
                                        nocheck = false;
                                        partialcheck = false;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Paid",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Checkbox(
                                  value: nocheck,
                                  onChanged: (bool? newvalue) {
                                    setState(() {
                                      nocheck = true;
                                      if (nocheck == true) {
                                        yescheck = false;
                                        partialcheck = false;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Partial",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Checkbox(
                                  value: partialcheck,
                                  onChanged: (bool? newvalue) {
                                    setState(() {
                                      partialcheck = true;
                                      if (partialcheck == true) {
                                        yescheck = false;
                                        nocheck = false;
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
              if (yescheck == true)
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            "Amount ( OMR )",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextFormField(
                          // validator: phoneValidator,
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.green,
                          controller: amountController,
                          onChanged: (text) {
                            // mobileNumber = value;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            focusColor: Colors.greenAccent,
                            // labelStyle: ktext14,

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
                    ),
                  ],
                ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 140,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          details.add({
                            "ShipperId": widget.loginList.first.shipperId,
                            "BranchId": widget.loginList.first.branchId,
                            "ItemDescription": itemController.text,
                            "RecieverName": firstNameController.text,
                            "RecieverLastName": lastNameController.text,
                            "RecieverAddress1": address1Controller.text,
                            "RecieverAddress2": address2Controller.text,
                            "RecieverCity": cityController.text,
                            "RecieveZip": zipCodeController.text,
                            "RecieverCondactDeatils": contactController.text,
                            "CODAmount":
                                yescheck != true ? 0 : amountController.text,
                            "IsCOD": yescheck.toString(),
                            "IsDelete": false.toString(),
                            "Date": '${now.year}-${now.month}-${now.day}',
                          });
                        });
                        firstNameController.clear();
                        lastNameController.clear();
                        address1Controller.clear();
                        address2Controller.clear();
                        cityController.clear();
                        zipCodeController.clear();
                        contactController.clear();
                        itemController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('17aeb4'),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      postShipment();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: HexColor('17aeb4'),
                    ),
                    child: Text(
                      "Book Now",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
