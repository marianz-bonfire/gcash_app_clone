import 'package:flutter/material.dart';
import 'package:gcash_app_clone/core/app_routes.dart';
import 'package:gcash_app_clone/core/providers/login_provider.dart';
import 'package:gcash_app_clone/core/providers/navbar_provider.dart';
import 'package:gcash_app_clone/core/utils/navigator_context.dart';
import 'package:gcash_app_clone/ui/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavBarProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Simply Rounded'),
        navigatorKey: NavigatorContext.key,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: AppRoutes.routes,
      ),
    );
  }
}
