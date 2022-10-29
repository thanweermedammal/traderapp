// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trader_app/Screens/Auth/login.dart';

Widget drawer(@required loginList, @required context) {
  return Drawer(
    backgroundColor: HexColor("297899"),
    child: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        transform: Matrix4.translationValues(0, -50, 0),
                        child: SizedBox(
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/images/pro.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Name : ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${loginList.first.name}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "ID : ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "123456",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Mobile No : ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "${loginList.first.mobile}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.white),
                ),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                      title: Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => MyOrders(),
                      //     ),
                      //   );
                      // },
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/images/delivery.png",
                          color: Colors.white,
                          height: 30.0,
                        ),
                      ),
                      title: Text(
                        "Saved Address",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => MyOrders(),
                      //     ),
                      //   );
                      // },
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                      title: Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => MyOrders(),
                      //     ),
                      //   );
                      // },
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.payment,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                      title: Text(
                        "Payment History",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => MyOrders(),
                      //     ),
                      //   );
                      // },
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.report,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                      title: Text(
                        "Reports",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => MyOrders(),
                      //     ),
                      //   );
                      // },
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.rule,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                      title: Text(
                        "Terms & Conditions",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => MyOrders(),
                      //     ),
                      //   );
                      // },
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                      title: Text(
                        "Settings",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      // onTap: () {
                      //   Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => MyOrders(),
                      //     ),
                      //   );
                      // },
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 25.0,
                        ),
                      ),
                      title: Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString("userName", '');
                        prefs.setString("password", '');
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (route) => false);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
