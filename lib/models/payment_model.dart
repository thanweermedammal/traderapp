// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'dart:convert';

List<Payment> paymentFromJson(String str) =>
    List<Payment>.from(json.decode(str).map((x) => Payment.fromJson(x)));

String paymentToJson(List<Payment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Payment {
  Payment({
    this.runSheetDetailId,
    this.runsheetId,
    this.status,
    this.fromAddress,
    this.toAddress,
    this.consigneeMobile,
    this.consigneeName,
    this.codAmount,
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

  int? runSheetDetailId;
  int? runsheetId;
  dynamic status;
  dynamic fromAddress;
  dynamic toAddress;
  dynamic consigneeMobile;
  dynamic consigneeName;
  double? codAmount;
  int? pickUpRequestId;
  int? shipmentId;
  int? txnId;
  int? shipperId;
  int? branchId;
  int? customerId;
  int? driverId;
  dynamic name;
  String? mode;
  String? branchName;
  String? shipperName;
  dynamic trader;
  dynamic barcode;
  dynamic driver;
  DateTime? date;
  dynamic address;
  dynamic mobile;
  String? description;
  double? amountRecieved;
  double? payedAmount;
  double? balanceAmount;
  double? totalAmount;
  double? shippingCharge;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        runSheetDetailId: json["RunSheetDetailId"],
        runsheetId: json["RunsheetId"],
        status: json["Status"],
        fromAddress: json["FromAddress"],
        toAddress: json["ToAddress"],
        consigneeMobile: json["ConsigneeMobile"],
        consigneeName: json["ConsigneeName"],
        codAmount: json["CODAmount"],
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
        "RunSheetDetailId": runSheetDetailId,
        "RunsheetId": runsheetId,
        "Status": status,
        "FromAddress": fromAddress,
        "ToAddress": toAddress,
        "ConsigneeMobile": consigneeMobile,
        "ConsigneeName": consigneeName,
        "CODAmount": codAmount,
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
