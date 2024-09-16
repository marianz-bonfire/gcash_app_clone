import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gcash_app_clone/core/common/app_color.dart';
import 'package:gcash_app_clone/core/enums/navbar_enum.dart';

class HomeAppBar extends StatelessWidget  {
  final int navIndex;
  const HomeAppBar({super.key, required this.navIndex});


  @override
  Widget build(BuildContext context) {
    Widget content = AppBar();
    if (navIndex == NavBarEnum.HOME) {
      content = AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      );
    } else if (navIndex == NavBarEnum.INBOX) {
      content = PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Set this height
        child: Container(
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('One'),
              Text('Two'),
              Text('Three'),
              Text('Four'),
            ],
          ),
        ),
      );
    } else if (navIndex == NavBarEnum.QR) {
    } else if (navIndex == NavBarEnum.TRANSACTIONS) {
      content = AppBar(
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        toolbarHeight: 0,
        title: const Text('Transactions', style: TextStyle(color: Colors.white)),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      );
    } else if (navIndex == NavBarEnum.PROFILE) {

    }
    return content;
  }

}
