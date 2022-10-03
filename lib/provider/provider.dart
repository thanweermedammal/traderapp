import 'package:flutter/cupertino.dart';
import 'package:trader_app/models/login_model.dart';

class DataProvider with ChangeNotifier {
  List<Login>? loginList = [];

  setTotalAmount(loginList) {
    loginList = loginList;
    print(loginList);
    notifyListeners();
  }
}
