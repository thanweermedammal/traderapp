import 'package:flutter/material.dart';
import 'package:trader_app/models/payment_model.dart';

class ReceiptsDetail extends StatelessWidget {
  List<Payment> receiptlist = [];
  int index;
  ReceiptsDetail({Key? key, required this.receiptlist, required this.index})
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
                  receiptlist[index].txnId.toString(),
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
                  '${receiptlist[index].date!.year.toString()}-${receiptlist[index].date!.month.toString()}-${receiptlist[index].date!.day.toString()}',
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
                  '${receiptlist[index].shipperName.toString()}',
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
                  receiptlist[index].description.toString(),
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
                    'OMR ${receiptlist[index].totalAmount.toString()}',
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
