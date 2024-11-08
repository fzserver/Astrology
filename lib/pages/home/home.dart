import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../gen/assets.gen.dart';
import '../../getit.dart';
import '../../provider/auth/authNotifier.dart';
import '../../provider/auth/authState.dart';
import '../../router/router.dart';
import '../../router/router.gr.dart';
import '../../validations/fzvalidations.dart';

@RoutePage(name: 'HomeRouter')
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode _passwordFocusNode;
  late FocusNode _emailFocusNode;
  bool _obscure = true;
  String _email = '';
  String _password = '';

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final width = mq.size.width;
    final height = mq.size.height;
    return Scaffold(
      backgroundColor: FzColors.blackColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                          Assets.astrology.path,
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    Constants.appName,
                    style: GoogleFonts.josefinSans(
                      color: FzColors.hexToColor('#FDC830'),
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    focusNode: _emailFocusNode,
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      hintStyle: GoogleFonts.josefinSans(
                        color: FzColors.hexToColor('#FDC830'),
                      ),
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: FzColors.hexToColor('#FDC830'),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction
                        .next, // Set the keyboard action to "Next"
                    onFieldSubmitted: (_) {
                      FocusScope.of(context).requestFocus(
                        _passwordFocusNode,
                      );
                    },
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                    style: GoogleFonts.josefinSans(color: Colors.white),
                    validator: (value) => FzValidation.emailValidator(value),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: _obscure,
                    obscuringCharacter: '*',
                    focusNode: _passwordFocusNode,
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
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscure = !_obscure;
                          });
                        },
                        icon: Icon(
                          _obscure ? Icons.visibility_off : Icons.visibility,
                          color: FzColors.hexToColor('#FDC830'),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: FzColors.hexToColor('#FDC830'),
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
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Consumer<AuthNotifier>(
                    builder: (context, authNotifier, _) => Center(
                      child: authNotifier.state == AuthState.loading
                          ? CircularProgressIndicator(
                              color: FzColors.hexToColor('#FDC830'),
                            )
                          : MaterialButton(
                              onPressed: authNotifier.state == AuthState.loading
                                  ? null
                                  : () {
                                      SystemChannels.textInput
                                          .invokeMethod('TextInput.hide');
                                      if (_formKey.currentState!.validate()) {
                                        authNotifier.login(_email, _password);
                                      }
                                    },
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
                    ),
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
                    onPressed: () =>
                        getIt<ConfigRouter>().push(RegisterRouter()),
                    child: Text(
                      "Don't have an account? Register",
                      style: GoogleFonts.josefinSans(
                        color: FzColors.hexToColor('#FDC830'),
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
                                fontSize: 16.0,
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
