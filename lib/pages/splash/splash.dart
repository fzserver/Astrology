import 'dart:async';

import 'package:astrology/constants/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../getit.dart';
import '../../router/router.dart';
import '../../router/router.gr.dart';

@RoutePage(name: 'SplashRouter')
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateToNextScreen();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(
      Duration(seconds: 2),
    );

    getIt<ConfigRouter>().replaceAll([HomeRouter()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FzColors.appColor,
      body: Center(
        child: Text(Constants.appName),
      ),
    );
  }
}
