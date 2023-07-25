import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:surf_practice_magic_ball/core/services/get_it.dart';

import 'core/services/adaptative.dart';
import 'core/services/internet_connection_check/internet_connection_check_cubit.dart';
import 'core/services/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Adaptive.init(context);
    return BlocProvider(
      create: (context) => InternetConnectionCheckCubit(
          internetConnection: getIt<InternetConnection>())
        ..checkInternetConnection(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
