import 'package:flutter/material.dart';
import 'package:gcash_app_clone/core/enums/login_enum.dart';

class LoginProvider with ChangeNotifier {
  int selectedType = LoginTypeEnum.NONE;
  Future<void> init() async {
    selectedType = LoginTypeEnum.NONE;
    notifyListeners();
  }

  Future<void> setSelectedType(int type) async {
    selectedType = type;
    notifyListeners();
  }
}
