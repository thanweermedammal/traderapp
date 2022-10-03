import 'package:get/get.dart';
import 'package:trader_app/models/shipment_model.dart';
import 'package:trader_app/services/allshipment_services.dart';

class AllShipmentController extends GetxController {
  AllShipmentService allShipmentService = AllShipmentService();
  List<ModelFile>? allshipmentList;
  RxBool isloading = true.obs;

  fetchAllShipmentData(shiperid, branchid) async {
    isloading(true);
    print('running');
    allshipmentList =
        await allShipmentService.getAllShipmentData(shiperid, branchid);
    print('done');
    isloading(false);
  }
}
