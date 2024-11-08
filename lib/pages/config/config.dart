import '../../getit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../router/router.dart';

class ConfigApp extends StatefulWidget {
  const ConfigApp({super.key});

  @override
  State<ConfigApp> createState() => _ConfigAppState();
}

class _ConfigAppState extends State<ConfigApp> {
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
    final _configRouter = getIt<ConfigRouter>();
    return MultiProvider(
      providers: Providers.providers(),
      child: MaterialApp.router(
        title: 'AstroApp',
        debugShowCheckedModeBanner: false,
        routerConfig: _configRouter.config(),
      ),
    );
  }
}
