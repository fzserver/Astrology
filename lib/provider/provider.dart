import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'auth/authNotifier.dart';

class Providers {
  static List<SingleChildWidget> providers() => [
        ChangeNotifierProvider<AuthNotifier>(
          create: (_) => AuthNotifier(),
        ),
      ];
}
