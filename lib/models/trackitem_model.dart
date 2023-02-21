// To parse this JSON data, do
//
//     final trackItem = trackItemFromJson(jsonString);

import 'dart:convert';

List<TrackItem> trackItemFromJson(String str) =>
    List<TrackItem>.from(json.decode(str).map((x) => TrackItem.fromJson(x)));

String trackItemToJson(List<TrackItem> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TrackItem {
  TrackItem({
    this.shipmentId,
    this.shipperId,
    this.branchId,
    this.itemDescription,
    this.status,
    this.recieverName,
    this.recieverLastName,
    this.recieverAddress1,
    this.recieverAddress2,
    this.recieverCity,
    this.recieveZip,
    this.recieverCondactDeatils,
    this.isCod,
    this.codAmount,
    this.shipmentType,
    this.isDelete,
    this.date,
    this.tblBranch,
    this.tblBranchItemRecievingDetails,
    this.tblBranchToBranchRecieving,
    this.tblLog,
    this.tblPickUpRequest,
    this.tblProduct,
    this.tblRequest,
    this.tblRunSheetDetails,
    this.tblRunSheetStatus,
    this.tblTrader,
  });

  int? shipmentId;
  int? shipperId;
  int? branchId;
  String? itemDescription;
  String? status;
  String? recieverName;
  String? recieverLastName;
  String? recieverAddress1;
  String? recieverAddress2;
  String? recieverCity;
  String? recieveZip;
  String? recieverCondactDeatils;
  bool? isCod;
  dynamic codAmount;
  dynamic shipmentType;
  dynamic isDelete;
  dynamic date;
  dynamic tblBranch;
  List<dynamic>? tblBranchItemRecievingDetails;
  List<dynamic>? tblBranchToBranchRecieving;
  List<dynamic>? tblLog;
  List<dynamic>? tblPickUpRequest;
  List<dynamic>? tblProduct;
  List<dynamic>? tblRequest;
  List<dynamic>? tblRunSheetDetails;
  List<dynamic>? tblRunSheetStatus;
  dynamic tblTrader;

  factory TrackItem.fromJson(Map<String, dynamic> json) => TrackItem(
        shipmentId: json["ShipmentId"],
        shipperId: json["ShipperId"],
        branchId: json["BranchId"],
        itemDescription: json["ItemDescription"],
        status: json["Status"],
        recieverName: json["RecieverName"],
        recieverLastName: json["RecieverLastName"],
        recieverAddress1: json["RecieverAddress1"],
        recieverAddress2: json["RecieverAddress2"],
        recieverCity: json["RecieverCity"],
        recieveZip: json["RecieveZip"],
        recieverCondactDeatils: json["RecieverCondactDeatils"],
        isCod: json["IsCOD"],
        codAmount: json["CODAmount"],
        shipmentType: json["ShipmentType"],
        isDelete: json["IsDelete"],
        date: json["Date"],
        tblBranch: json["Tbl_Branch"],
        tblBranchItemRecievingDetails: List<dynamic>.from(
            json["Tbl_Branch_Item_Recieving_Details"].map((x) => x)),
        tblBranchToBranchRecieving: List<dynamic>.from(
            json["Tbl_BranchToBranchRecieving"].map((x) => x)),
        tblLog: List<dynamic>.from(json["Tbl_Log"].map((x) => x)),
        tblPickUpRequest:
            List<dynamic>.from(json["Tbl_PickUpRequest"].map((x) => x)),
        tblProduct: List<dynamic>.from(json["Tbl_Product"].map((x) => x)),
        tblRequest: List<dynamic>.from(json["Tbl_Request"].map((x) => x)),
        tblRunSheetDetails:
            List<dynamic>.from(json["Tbl_RunSheetDetails"].map((x) => x)),
        tblRunSheetStatus:
            List<dynamic>.from(json["Tbl_RunSheetStatus"].map((x) => x)),
        tblTrader: json["Tbl_Trader"],
      );

  Map<String, dynamic> toJson() => {
        "ShipmentId": shipmentId,
        "ShipperId": shipperId,
        "BranchId": branchId,
        "ItemDescription": itemDescription,
        "Status": status,
        "RecieverName": recieverName,
        "RecieverLastName": recieverLastName,
        "RecieverAddress1": recieverAddress1,
        "RecieverAddress2": recieverAddress2,
        "RecieverCity": recieverCity,
        "RecieveZip": recieveZip,
        "RecieverCondactDeatils": recieverCondactDeatils,
        "IsCOD": isCod,
        "CODAmount": codAmount,
        "ShipmentType": shipmentType,
        "IsDelete": isDelete,
        "Date": date,
        "Tbl_Branch": tblBranch,
        "Tbl_Branch_Item_Recieving_Details":
            List<dynamic>.from(tblBranchItemRecievingDetails!.map((x) => x)),
        "Tbl_BranchToBranchRecieving":
            List<dynamic>.from(tblBranchToBranchRecieving!.map((x) => x)),
        "Tbl_Log": List<dynamic>.from(tblLog!.map((x) => x)),
        "Tbl_PickUpRequest":
            List<dynamic>.from(tblPickUpRequest!.map((x) => x)),
        "Tbl_Product": List<dynamic>.from(tblProduct!.map((x) => x)),
        "Tbl_Request": List<dynamic>.from(tblRequest!.map((x) => x)),
        "Tbl_RunSheetDetails":
            List<dynamic>.from(tblRunSheetDetails!.map((x) => x)),
        "Tbl_RunSheetStatus":
            List<dynamic>.from(tblRunSheetStatus!.map((x) => x)),
        "Tbl_Trader": tblTrader,
      };
}
