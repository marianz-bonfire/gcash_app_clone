import 'package:flutter/material.dart';
import 'package:gcash_app_clone/ui/screens/home_screen.dart';
import 'package:gcash_app_clone/ui/screens/inbox_detail_screen.dart';
import 'package:gcash_app_clone/ui/screens/inbox_message_screen.dart';
import 'package:gcash_app_clone/ui/screens/login_screen.dart';
import 'package:gcash_app_clone/ui/splash_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    SplashScreen.routeName: (context) => SplashScreen(),
    GCashLoginScreen.routeName: (context) => GCashLoginScreen(),
    GCashHomeScreen.routeName: (context) => GCashHomeScreen(),
    InboxDetailScreen.routeName: (context) => InboxDetailScreen(),
    InboxMessageScreen.routeName: (context) => InboxMessageScreen(),
  };
}
