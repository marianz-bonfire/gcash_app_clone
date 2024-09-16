import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gcash_app_clone/core/common/app_color.dart';
import 'package:gcash_app_clone/core/enums/navbar_enum.dart';
import 'package:gcash_app_clone/core/providers/navbar_provider.dart';
import 'package:gcash_app_clone/data/labels.dart';
import 'package:gcash_app_clone/ui/screens/home/home_content.dart';
import 'package:gcash_app_clone/ui/screens/home/inbox_content.dart';
import 'package:gcash_app_clone/ui/screens/home/profile_content.dart';
import 'package:gcash_app_clone/ui/screens/home/qr_content.dart';
import 'package:gcash_app_clone/ui/screens/home/transactions_content.dart';
import 'package:gcash_app_clone/ui/widgets/bottom_navbar.dart';
import 'package:provider/provider.dart';

class GCashHomeScreen extends StatefulWidget {
  static String routeName = 'GCashHomeScreen';
  const GCashHomeScreen({super.key});

  @override
  State<GCashHomeScreen> createState() => _GCashHomeScreenState();
}

class _GCashHomeScreenState extends State<GCashHomeScreen> {
  Widget content(int index) {
    if (index == NavBarEnum.HOME) {
      return HomeContent();
    } else if (index == NavBarEnum.INBOX) {
      return InboxContent();
    } else if (index == NavBarEnum.QR) {
      return QRContent();
    } else if (index == NavBarEnum.TRANSACTIONS) {
      return TransactionsContent();
    } else if (index == NavBarEnum.PROFILE) {
      return ProfileContent();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavBarProvider>(builder: (context, provider, child) {
      return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: buildAppBar(provider.selectedNavIndex),
        body: SingleChildScrollView(
          child: content(provider.selectedNavIndex),
        ),
        bottomNavigationBar: BottomNavBar(navBarProvider: provider),
      );
    });
  }

  PreferredSizeWidget buildAppBar(int navIndex) {
    PreferredSizeWidget content = AppBar();
    if (navIndex == NavBarEnum.HOME) {
      content = AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,

          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      );
    } else if (navIndex == NavBarEnum.INBOX) {
      content = AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        title: Text(Labels.inbox),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColor.primaryColor,

          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      );
    } else if (navIndex == NavBarEnum.QR) {
      content = AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        title: Text('QR Reader'),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColor.primaryColor,

          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      );
    } else if (navIndex == NavBarEnum.TRANSACTIONS) {
      content = AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        title: Text(Labels.transactionHistory),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColor.primaryColor,

          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      );
    } else if (navIndex == NavBarEnum.PROFILE) {
      content = AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.primaryColor,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: AppColor.primaryColor,

          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(140), // Set this height
          child: Container(
            color: AppColor.primaryColor,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Text('MD', style: TextStyle(fontSize: 24, color: AppColor.activeTextColor)),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Marian',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          '09090200000',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Icon(Icons.verified, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text(
                              'Fully Verified',
                              style: TextStyle(color: Colors.white70, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue, backgroundColor: AppColor.primaryColor,
                          side: BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text(
                          'View Benefits',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue, backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Back to School'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    return content;
  }
}
