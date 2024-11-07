import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'getit.dart';
import 'pages/config/config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  setup(true);
  runApp(ConfigApp());
}
