import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                                    borderRadius: BorderRadius.circular(10.0)),
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
          ],
        ),
      ),
    );
  }
}
