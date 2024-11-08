import '../../router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../gen/assets.gen.dart';
import '../../getit.dart';
import '../../provider/auth/authNotifier.dart';
import '../../provider/auth/authState.dart';
import '../../router/router.dart';

@RoutePage(name: 'VerificationRouter')
class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final height = mq.size.height;
    return Scaffold(
      backgroundColor: FzColors.blackColor,
      appBar: AppBar(
        backgroundColor: FzColors.blackColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Lottie.asset(
                  Assets.json.verify,
                  width: width,
                  height: height * .3,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Verify Your Email Address. Check your e-mail inbox for verification.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.josefinSans(
                    color: FzColors.hexToColor('#FDC830'),
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Consumer<AuthNotifier>(
                  builder: (context, authNotifier, _) => Center(
                    child: authNotifier.state == AuthState.loading
                        ? CircularProgressIndicator(
                            color: FzColors.hexToColor('#FDC830'),
                          )
                        : MaterialButton(
                            onPressed: () =>
                                authNotifier.resendverificationlink(),
                            child: Text(
                              "Resend Link",
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
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () =>
                      getIt<ConfigRouter>().replaceAll([HomeRouter()]),
                  child: Text(
                    "Back to login",
                    style: GoogleFonts.josefinSans(
                      color: FzColors.hexToColor('#FDC830'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
