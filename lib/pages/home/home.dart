import 'package:astrology/getit.dart';
import 'package:astrology/pages/forgot/forgot.dart';
import 'package:astrology/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../router/router.dart';
import '../../validations/fzvalidations.dart';

@RoutePage(name: 'HomeRouter')
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final height = mq.size.height;
    return Scaffold(
      backgroundColor: FzColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FlutterLogo(
                size: width * .3,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                Constants.appName,
                style: GoogleFonts.josefinSans(
                  color: FzColors.hexToColor('#FDC830'),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: GoogleFonts.josefinSans(
                    color: FzColors.hexToColor('#FDC830'),
                  ),
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: GoogleFonts.josefinSans(color: Colors.white),
                validator: (value) => FzValidation.emailValidator(value),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  hintStyle: GoogleFonts.josefinSans(
                    color: FzColors.hexToColor('#FDC830'),
                  ),
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                ),
                style: GoogleFonts.josefinSans(
                  color: Colors.white,
                ),
                validator: (value) {
                  if (value == null || value == '') {
                    return 'Password can\'t be empty.';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              MaterialButton(
                onPressed: () => getIt<ConfigRouter>().push(DashboardRouter()),
                child: Text(
                  "Login",
                  style: GoogleFonts.josefinSans(
                    fontSize: 18.0,
                    color: FzColors.blackColor,
                  ),
                ),
                color: FzColors.hexToColor('#FDC830'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                minWidth: width * .8,
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () => getIt<ConfigRouter>().push(ForgotRouter()),
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.josefinSans(
                    color: FzColors.hexToColor('#FDC830'),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Don't have an account? Register",
                  style: GoogleFonts.josefinSans(
                    color: FzColors.hexToColor('#FDC830'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
