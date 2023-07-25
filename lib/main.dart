import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';
import 'core/services/get_it.dart';

void bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await setup();
  runApp(const App());
}

void main() => bootstrap();
