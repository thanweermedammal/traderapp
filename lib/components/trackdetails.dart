import 'package:flutter/material.dart';

class TrackDetail extends StatefulWidget {
  var status;

  TrackDetail(this.status) : super();

  final String title = "Stepper Demo";

  @override
  TrackDetailState createState() => TrackDetailState();
}

class TrackDetailState extends State<TrackDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Appbar
      appBar: AppBar(
        // Title
        title: Text(""),
      ),
      // Body
      body: Container(
          child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.blue,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
