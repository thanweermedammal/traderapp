// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trader_app/Screens/Auth/otp_screen.dart';
import 'package:trader_app/Screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:trader_app/models/login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List<Login> loginList = [];
  bool loading = false;
  login() async {
    final prefs = await SharedPreferences.getInstance();
    var response = await http.get(Uri.parse(
        'http://185.188.127.100/WaselleApi/api/LoginDetails?UName=${userNameController.text}&Password=${passwordController.text}&UserType=Customer'));
    if (response.statusCode == 200) {
      final loginData = jsonDecode(response.body);
      print(response.statusCode);

      loginList = List<Login>.from(loginData.map((x) => Login.fromJson(x)));
      prefs.setString('userName', userNameController.text);
      prefs.setString('password', passwordController.text);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(loginList),
        ),
      );
    } else {
      print('wrong password or username');
      final snackBar = SnackBar(content: Text('Wrong Username or Password'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/loginlogo.png",
                    height: 200,
                    color: HexColor("297899"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  // validator: phoneValidator,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.green,
                  controller: userNameController,
                  onChanged: (text) {
                    // mobileNumber = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: HexColor('17aeb4'),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    focusColor: Colors.greenAccent,
                    // labelStyle: ktext14,
                    labelText: "Enter Your Name",
                    labelStyle: TextStyle(color: HexColor('17aeb4')),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  obscureText: true,
                  // validator: phoneValidator,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.green,
                  controller: passwordController,
                  onChanged: (text) {
                    // mobileNumber = value;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.call,
                      color: HexColor('17aeb4'),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    focusColor: Colors.greenAccent,
                    // labelStyle: ktext14,
                    labelText: "Enter Your Password",
                    labelStyle: TextStyle(color: HexColor('17aeb4')),
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
                      setState(() {
                        loading = true;
                      });
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: HexColor('17aeb4'),
                    ),
                    child: loading == false
                        ? Text(
                            "LOG IN",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xffffffff),
                            ),
                          )
                        : LoadingIndicator(
                            indicatorType: Indicator.ballSpinFadeLoader,
                            colors: const [Colors.white],
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
