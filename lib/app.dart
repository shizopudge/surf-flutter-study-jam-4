import 'package:flutter/material.dart';

import 'core/services/adaptative.dart';
import 'core/services/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Adaptive.init(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      routerConfig: AppRouter.router,
    );
  }
}
