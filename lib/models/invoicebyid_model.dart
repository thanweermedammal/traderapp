// To parse this JSON data, do
//
//     final invoiceById = invoiceByIdFromJson(jsonString);

import 'dart:convert';

List<InvoiceById> invoiceByIdFromJson(String str) => List<InvoiceById>.from(
    json.decode(str).map((x) => InvoiceById.fromJson(x)));

String invoiceByIdToJson(List<InvoiceById> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InvoiceById {
  InvoiceById({
    this.pickUpRequestId,
    this.shipmentId,
    this.txnId,
    this.shipperId,
    this.branchId,
    this.customerId,
    this.driverId,
    this.name,
    this.mode,
    this.branchName,
    this.shipperName,
    this.trader,
    this.barcode,
    this.driver,
    this.date,
    this.address,
    this.mobile,
    this.description,
    this.amountRecieved,
    this.payedAmount,
    this.balanceAmount,
    this.totalAmount,
    this.shippingCharge,
  });

  int? pickUpRequestId;
  int? shipmentId;
  int? txnId;
  int? shipperId;
  int? branchId;
  int? customerId;
  int? driverId;
  dynamic name;
  dynamic mode;
  dynamic branchName;
  dynamic shipperName;
  String? trader;
  String? barcode;
  String? driver;
  DateTime? date;
  dynamic address;
  dynamic mobile;
  dynamic description;
  double? amountRecieved;
  double? payedAmount;
  double? balanceAmount;
  double? totalAmount;
  double? shippingCharge;

  factory InvoiceById.fromJson(Map<String, dynamic> json) => InvoiceById(
        pickUpRequestId: json["PickUpRequestId"],
        shipmentId: json["ShipmentId"],
        txnId: json["TxnId"],
        shipperId: json["ShipperId"],
        branchId: json["BranchId"],
        customerId: json["CustomerId"],
        driverId: json["DriverId"],
        name: json["Name"],
        mode: json["Mode"],
        branchName: json["BranchName"],
        shipperName: json["ShipperName"],
        trader: json["Trader"],
        barcode: json["Barcode"],
        driver: json["Driver"],
        date: DateTime.parse(json["Date"]),
        address: json["Address"],
        mobile: json["Mobile"],
        description: json["Description"],
        amountRecieved: json["AmountRecieved"],
        payedAmount: json["PayedAmount"],
        balanceAmount: json["BalanceAmount"],
        totalAmount: json["TotalAmount"],
        shippingCharge: json["ShippingCharge"],
      );

  Map<String, dynamic> toJson() => {
        "PickUpRequestId": pickUpRequestId,
        "ShipmentId": shipmentId,
        "TxnId": txnId,
        "ShipperId": shipperId,
        "BranchId": branchId,
        "CustomerId": customerId,
        "DriverId": driverId,
        "Name": name,
        "Mode": mode,
        "BranchName": branchName,
        "ShipperName": shipperName,
        "Trader": trader,
        "Barcode": barcode,
        "Driver": driver,
        "Date": date?.toIso8601String(),
        "Address": address,
        "Mobile": mobile,
        "Description": description,
        "AmountRecieved": amountRecieved,
        "PayedAmount": payedAmount,
        "BalanceAmount": balanceAmount,
        "TotalAmount": totalAmount,
        "ShippingCharge": shippingCharge,
      };
}
