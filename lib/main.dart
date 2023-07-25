import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app.dart';
import 'core/services/get_it.dart';

void bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await setup();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => const App(),
    ),
  );
}

void main() => bootstrap();
