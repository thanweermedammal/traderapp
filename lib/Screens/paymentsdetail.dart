import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:trader_app/models/payment_model.dart';

class PaymentsDetail extends StatelessWidget {
  List<Payment> paymentlist = [];
  int index;
  PaymentsDetail({Key? key, required this.paymentlist, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Material(
                  type: MaterialType.transparency,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          // color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: InkWell(
                        onTap: (() => Navigator.pop(context)),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.arrow_back_sharp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Payment ID',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 42,
                  width: MediaQuery.of(context).size.width - 150,
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          paymentlist[index].txnId.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Date',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 42,
                  width: MediaQuery.of(context).size.width - 200,
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${paymentlist[index].date!.year.toString()}-${paymentlist[index].date!.month.toString()}-${paymentlist[index].date!.day.toString()}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Shipper Name & Details',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 95,
                  width: MediaQuery.of(context).size.width - 150,
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${paymentlist[index].shipperName.toString()}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Description',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 102,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.grey),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          paymentlist[index].description.toString(),
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                      child: Text(
                    'Amount',
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  )),
                  Expanded(
                    // flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 42,
                        width: 67,
                        decoration: BoxDecoration(color: Colors.grey),
                        child: Center(
                            child: Text(
                          'OMR ${paymentlist[index].totalAmount.toString()}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
