import 'dart:async';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../gen/assets.gen.dart';
import '../../getit.dart';
import '../../provider/tokenChecker.dart';
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
      Duration(seconds: 5),
    );

    TokenChecker tokenChecker =
        Provider.of<TokenChecker>(context, listen: false);

    await tokenChecker.checkToken();

    if (tokenChecker.isAuthenticated) {
      getIt<ConfigRouter>().replaceAll([DashboardRouter()]);
    } else {
      getIt<ConfigRouter>().replaceAll([HomeRouter()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final height = mq.size.height;
    return Scaffold(
      backgroundColor: FzColors.appColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: width,
              height: width * .4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.astrology.path,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              Constants.appName,
              style: GoogleFonts.josefinSans(
                color: FzColors.hexToColor('#FDC830'),
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
