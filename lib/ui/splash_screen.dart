import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gcash_app_clone/core/common/app_color.dart';
import 'package:gcash_app_clone/core/enums/login_enum.dart';
import 'package:gcash_app_clone/core/providers/login_provider.dart';
import 'package:gcash_app_clone/core/utils/navigator_context.dart';
import 'package:gcash_app_clone/ui/screens/login_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  AnimatedSplashScreenState createState() => AnimatedSplashScreenState();
}

class AnimatedSplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController? animationController;
  Animation<double>? animation;

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    context.read<LoginProvider>().setSelectedType(LoginTypeEnum.MPIN);
    NavigatorContext.go(GCashLoginScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = CurvedAnimation(parent: animationController!, curve: Curves.easeOut);

    animation!.addListener(() => setState(() {}));
    animationController!.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 25.0,
                    fit: BoxFit.scaleDown,
                  ))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/gcash-logo.png',
                width: animation!.value * 250,
                height: animation!.value * 250,
              ),
              SizedBox(height: 20,),
              CircularProgressIndicator(),
            ],
          ),
        ],
      ),
    );
  }
}
