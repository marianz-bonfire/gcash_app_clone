import 'package:flutter/material.dart';
import 'package:gcash_app_clone/core/enums/navbar_enum.dart';
import 'package:gcash_app_clone/data/labels.dart';

class NavBarProvider with ChangeNotifier {
  int selectedNavIndex = NavBarEnum.HOME;
  String title = Labels.home;

  Future<void> init() async {
    selectedNavIndex = NavBarEnum.HOME;
    notifyListeners();
  }

  Future<void> setSelectedNavIndex(int selectedIndex) async {
    selectedNavIndex = selectedIndex;
    setTitle();
    notifyListeners();
  }

  setTitle() {
    if (selectedNavIndex == NavBarEnum.HOME) {
      title = Labels.home;
    } else if (selectedNavIndex == NavBarEnum.INBOX) {
      title = Labels.inbox;
    } else if (selectedNavIndex == NavBarEnum.QR) {
      title = Labels.qr;
    } else if (selectedNavIndex == NavBarEnum.TRANSACTIONS) {
      title = Labels.transactions;
    } else if (selectedNavIndex == NavBarEnum.PROFILE) {
      title = Labels.profile;
    }
    notifyListeners();
  }
}
