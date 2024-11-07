import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/constants.dart';
import '../../getit.dart';
import '../../router/router.dart';
import '../../router/router.gr.dart';
import '../tokenChecker.dart';
import 'authState.dart';
import 'fzauth.dart';

class AuthNotifier with ChangeNotifier {
  final FzAuth _authProvider = FzAuth();
  final TokenChecker _tokenChecker = TokenChecker();
  AuthState _state = AuthState.unauthenticated;
  String? _error;
  String? _verificationStatus;
  Color? _verificationStatusColor;

  AuthState get state => _state;
  String? get error => _error;
  String? get verificationStatus => _verificationStatus;
  Color? get verificationStatusColor => _verificationStatusColor;

  void clearAll() {
    _error = '';
    _verificationStatus = '';
    setState(AuthState.unauthenticated);
  }

  void setState(AuthState state) {
    _state = state;
  }

  Future<void> resendverificationlink() async {
    try {
      _state = AuthState.loading;
      notifyListeners();
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        _verificationStatus = 'Verification link sent to your email.';
        _state = AuthState.verificationSent;
        _verificationStatusColor = Colors.greenAccent;
      } else {
        _state = AuthState.verified;
        _verificationStatus = '';
        getIt<ConfigRouter>().replaceAll([DashboardRouter()]);
      }
      notifyListeners();
    } catch (e) {
      _state = AuthState.error;
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      _state = AuthState.loading;
      notifyListeners();
      await _authProvider.forgotPassword(email: email);
      _state = AuthState.forgotPasswordSent;
      notifyListeners();
    } catch (e) {
      _state = AuthState.error;
      _error = '$e';
      notifyListeners();
    }
  }

  Future<void> signup(
    String email,
    String password,
  ) async {
    try {
      _state = AuthState.loading;
      notifyListeners();
      User? user = await _authProvider.signUp(email: email, password: password);
      Constants.logger.w(user!.uid);

      Constants.uid = user.uid;
      String? token = await user.getIdToken();

      // await prefs.setString('token', token!);
      Constants.logger.w('Token = ' + token!);

      var decoded = JwtDecoder.decode(token);
      Constants.email = decoded['email'];

      _state = AuthState.authenticated;

      notifyListeners();
    } catch (e) {
      _state = AuthState.error;
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> login(String email, String password) async {
    try {
      _state = AuthState.loading;
      notifyListeners();
      User? user = await _authProvider.signIn(email: email, password: password);
      Constants.logger.w(user!.uid);

      // Save token in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();

      Constants.logger.w(user.emailVerified);

      if (user.emailVerified) {
        await prefs.setString('uid', user.uid);
        Constants.uid = user.uid;
        String? token = await user.getIdToken();

        await prefs.setString('token', token!);
        Constants.logger.w('Token = ' + token);

        var decoded = JwtDecoder.decode(token);
        Constants.email = decoded['email'];

        _state = AuthState.authenticated;

        await _tokenChecker.checkToken();

        if (_tokenChecker.isLoggedIn) {
          getIt<ConfigRouter>().replaceAll([DashboardRouter()]);
        }
      } else {
        getIt<ConfigRouter>().replaceAll([DashboardRouter()]);
      }
      notifyListeners();
    } catch (e) {
      Constants.logger.w('Error = ' + e.toString());
      _state = AuthState.error;
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('All preferences cleared.');
    getIt<ConfigRouter>().replaceAll([SplashRouter()]);
  }
}
