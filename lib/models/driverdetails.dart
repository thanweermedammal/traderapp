// To parse this JSON data, do
//
//     final driverDetail = driverDetailFromJson(jsonString);

import 'dart:convert';

List<DriverDetail> driverDetailFromJson(String str) => List<DriverDetail>.from(
    json.decode(str).map((x) => DriverDetail.fromJson(x)));

String driverDetailToJson(List<DriverDetail> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DriverDetail {
  DriverDetail({
    this.dId,
    this.sId,
    this.bId,
    this.rId,
    this.name,
    this.mobile,
    this.alternatemobile,
    this.address,
    this.userName,
    this.password,
    this.logoPath,
    this.isActive,
    this.isDelete,
    this.date,
    this.idNumber,
    this.nameOfBank,
    this.accountNumber,
    this.idProofPath,
    this.cvPath,
    this.language,
    this.routeCode,
    this.collectionCommission,
    this.deliveryCommission,
    this.isOnline,
    this.tblBranch,
    this.tblBranchItemRecieving,
    this.tblBranchItemRecievingDetails,
    this.tblPaymentTransactions,
    this.tblRateMaster,
    this.tblPickUpRequest,
    this.tblPickUpRequest1,
    this.tblPickUpRequest2,
    this.tblProduct,
    this.tblUser,
    this.tblRunSheetStatus,
  });

  int? dId;
  dynamic sId;
  int? bId;
  dynamic rId;
  String? name;
  dynamic mobile;
  dynamic alternatemobile;
  dynamic address;
  dynamic userName;
  dynamic password;
  dynamic logoPath;
  dynamic isActive;
  dynamic isDelete;
  dynamic date;
  dynamic idNumber;
  dynamic nameOfBank;
  dynamic accountNumber;
  dynamic idProofPath;
  dynamic cvPath;
  dynamic language;
  dynamic routeCode;
  dynamic collectionCommission;
  dynamic deliveryCommission;
  dynamic isOnline;
  dynamic tblBranch;
  List<dynamic>? tblBranchItemRecieving;
  List<dynamic>? tblBranchItemRecievingDetails;
  List<dynamic>? tblPaymentTransactions;
  dynamic tblRateMaster;
  List<dynamic>? tblPickUpRequest;
  List<dynamic>? tblPickUpRequest1;
  List<dynamic>? tblPickUpRequest2;
  List<dynamic>? tblProduct;
  List<dynamic>? tblUser;
  List<dynamic>? tblRunSheetStatus;

  factory DriverDetail.fromJson(Map<String, dynamic> json) => DriverDetail(
        dId: json["DId"],
        sId: json["SId"],
        bId: json["BId"],
        rId: json["RId"],
        name: json["Name"],
        mobile: json["Mobile"],
        alternatemobile: json["Alternatemobile"],
        address: json["Address"],
        userName: json["UserName"],
        password: json["Password"],
        logoPath: json["LogoPath"],
        isActive: json["IsActive"],
        isDelete: json["IsDelete"],
        date: json["Date"],
        idNumber: json["IdNumber"],
        nameOfBank: json["NameOfBank"],
        accountNumber: json["AccountNumber"],
        idProofPath: json["IdProofPath"],
        cvPath: json["CvPath"],
        language: json["Language"],
        routeCode: json["RouteCode"],
        collectionCommission: json["Collection_Commission"],
        deliveryCommission: json["Delivery_Commission"],
        isOnline: json["IsOnline"],
        tblBranch: json["Tbl_Branch"],
        tblBranchItemRecieving:
            List<dynamic>.from(json["Tbl_Branch_Item_Recieving"].map((x) => x)),
        tblBranchItemRecievingDetails: List<dynamic>.from(
            json["Tbl_Branch_Item_Recieving_Details"].map((x) => x)),
        tblPaymentTransactions:
            List<dynamic>.from(json["Tbl_Payment_Transactions"].map((x) => x)),
        tblRateMaster: json["Tbl_RateMaster"],
        tblPickUpRequest:
            List<dynamic>.from(json["Tbl_PickUpRequest"].map((x) => x)),
        tblPickUpRequest1:
            List<dynamic>.from(json["Tbl_PickUpRequest1"].map((x) => x)),
        tblPickUpRequest2:
            List<dynamic>.from(json["Tbl_PickUpRequest2"].map((x) => x)),
        tblProduct: List<dynamic>.from(json["Tbl_Product"].map((x) => x)),
        tblUser: List<dynamic>.from(json["Tbl_User"].map((x) => x)),
        tblRunSheetStatus:
            List<dynamic>.from(json["Tbl_RunSheetStatus"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "DId": dId,
        "SId": sId,
        "BId": bId,
        "RId": rId,
        "Name": name,
        "Mobile": mobile,
        "Alternatemobile": alternatemobile,
        "Address": address,
        "UserName": userName,
        "Password": password,
        "LogoPath": logoPath,
        "IsActive": isActive,
        "IsDelete": isDelete,
        "Date": date,
        "IdNumber": idNumber,
        "NameOfBank": nameOfBank,
        "AccountNumber": accountNumber,
        "IdProofPath": idProofPath,
        "CvPath": cvPath,
        "Language": language,
        "RouteCode": routeCode,
        "Collection_Commission": collectionCommission,
        "Delivery_Commission": deliveryCommission,
        "IsOnline": isOnline,
        "Tbl_Branch": tblBranch,
        "Tbl_Branch_Item_Recieving":
            List<dynamic>.from(tblBranchItemRecieving!.map((x) => x)),
        "Tbl_Branch_Item_Recieving_Details":
            List<dynamic>.from(tblBranchItemRecievingDetails!.map((x) => x)),
        "Tbl_Payment_Transactions":
            List<dynamic>.from(tblPaymentTransactions!.map((x) => x)),
        "Tbl_RateMaster": tblRateMaster,
        "Tbl_PickUpRequest":
            List<dynamic>.from(tblPickUpRequest!.map((x) => x)),
        "Tbl_PickUpRequest1":
            List<dynamic>.from(tblPickUpRequest1!.map((x) => x)),
        "Tbl_PickUpRequest2":
            List<dynamic>.from(tblPickUpRequest2!.map((x) => x)),
        "Tbl_Product": List<dynamic>.from(tblProduct!.map((x) => x)),
        "Tbl_User": List<dynamic>.from(tblUser!.map((x) => x)),
        "Tbl_RunSheetStatus":
            List<dynamic>.from(tblRunSheetStatus!.map((x) => x)),
      };
}
