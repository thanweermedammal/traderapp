import 'package:flutter/material.dart';
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
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  '98678',
                  style: TextStyle(fontSize: 16),
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
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  '${paymentlist[index].date!.year.toString()}-${paymentlist[index].date!.month.toString()}-${paymentlist[index].date!.day.toString()}',
                  style: TextStyle(fontSize: 16),
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
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  '${paymentlist[index].shipperName.toString()}',
                  style: TextStyle(fontSize: 16),
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
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  paymentlist[index].description.toString(),
                  style: TextStyle(fontSize: 16),
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
                      child: Text(
                    'OMR ${paymentlist[index].totalAmount.toString()}',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
