import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../getit.dart';
import '../../provider/auth/authNotifier.dart';
import '../../provider/auth/authState.dart';
import '../../router/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../router/router.gr.dart';
import '../../validations/fzvalidations.dart';

@RoutePage(name: 'ForgotRouter')
class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

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
      backgroundColor: FzColors.appColor,
      appBar: AppBar(
        backgroundColor: FzColors.appColor,
        foregroundColor: FzColors.textColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Form(
              key: _formKey,
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
                          Assets.forgot.path,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Forgot Password",
                    style: GoogleFonts.josefinSans(
                      color: FzColors.hexToColor('#FDC830'),
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: GoogleFonts.josefinSans(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: FzColors.hexToColor('#FDC830'),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                    style: GoogleFonts.josefinSans(color: Colors.white),
                    validator: (value) => FzValidation.emailValidator(value),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Consumer<AuthNotifier>(
                    builder: (context, authNotifier, _) => Center(
                      child: authNotifier.state == AuthState.loading
                          ? CircularProgressIndicator(
                              color: FzColors.hexToColor(
                                '#FDC830',
                              ),
                            )
                          : MaterialButton(
                              onPressed: authNotifier.state == AuthState.loading
                                  ? null
                                  : () {
                                      SystemChannels.textInput
                                          .invokeMethod('TextInput.hide');
                                      if (_formKey.currentState!.validate()) {
                                        authNotifier.forgotPassword(_email);
                                      }
                                    },
                              child: Text(
                                "Reset My Password",
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
                  TextButton(
                    onPressed: () => getIt<ConfigRouter>().popForced(),
                    child: Text(
                      "Back to Login",
                      style: GoogleFonts.josefinSans(
                        color: Colors.amber,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Consumer<AuthNotifier>(
                    builder: (context, authNotifier, _) {
                      if (authNotifier.state == AuthState.error) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                            child: Text(
                              authNotifier.error!,
                              style: GoogleFonts.josefinSans(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
                      }
                      return SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
