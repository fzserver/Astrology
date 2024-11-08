import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'auth/authNotifier.dart';
import 'tokenChecker.dart';

class Providers {
  static List<SingleChildWidget> providers() => [
        ChangeNotifierProvider<AuthNotifier>(
          create: (_) => AuthNotifier(),
        ),
        ChangeNotifierProvider<TokenChecker>(
          create: (context) => TokenChecker(),
        ),
      ];
}
