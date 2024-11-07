import 'package:get_it/get_it.dart';

import 'router/router.dart';

GetIt getIt = GetIt.instance;

void setup(bool isProductionEnv) {
  getIt.registerSingleton<ConfigRouter>(ConfigRouter());
}
