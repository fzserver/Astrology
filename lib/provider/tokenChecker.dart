import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/constants.dart';

class TokenChecker with ChangeNotifier {
  TokenChecker();
  bool _isLoggedIn = true;

  bool get isAuthenticated => _isLoggedIn;

  Future<void> checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token =
        prefs.containsKey('token') ? prefs.getString('token') : null;

    Constants.logger.w(token);
    if (token == null) {
      _isLoggedIn = false;
      notifyListeners();
      return;
    } else {
      var decoded = JwtDecoder.decode(token);
      String uid = decoded['user_id'];

      Constants.token = token;
      Constants.uid = uid;
      Constants.email = decoded['email'];
    }

    // Convert Unix timestamp to DateTime object
    DateTime expiryDateTime = JwtDecoder.getExpirationDate(token);
    // DateTime.fromMillisecondsSinceEpoch(expiry! * 1000).toUtc();

    // Get the current DateTime in UTC
    DateTime currentDateTime = DateTime.now().toUtc();

    // Check if expiry time has passed
    bool hasExpired = expiryDateTime.isBefore(currentDateTime);
    Constants.logger.w('Exp Date = ${expiryDateTime.toString()}');
    Constants.logger.w('Current Date = ${currentDateTime.toString()}');
    Constants.logger.w('hasExpired = ${hasExpired.toString()}');
    Constants.logger.w('Token = ${token != null.toString()}');

    _isLoggedIn ? _isLoggedIn = !hasExpired : false;
    Constants.logger.w(_isLoggedIn.toString());
    notifyListeners();
  }
}
