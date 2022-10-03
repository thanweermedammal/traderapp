import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trader_app/models/shipment_model.dart';

class AllShipmentService {
  List<ModelFile> allshipmentList = [];
  Future getAllShipmentData(shipperid,branchid) async {
    final response = await http.get(Uri.parse(
        'http://185.188.127.100/WaselleApi/api/Shipment/GetAllShipment?ShipperId=${shipperid}&BranchId=${branchid}'));
    final allshipmentData = jsonDecode(response.body);
    print(response.statusCode);
    // print(allshipmentData.length);
    // List<ModelFile> allshipmentList = [];
    allshipmentList =
        List<ModelFile>.from(allshipmentData.map((x) => ModelFile.fromJson(x)));

    return allshipmentList;
  }
}
