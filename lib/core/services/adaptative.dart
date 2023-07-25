import 'dart:io';

import 'package:flutter/material.dart';

import '../enums/device_type.dart';

class Adaptive {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;
  }

  static double setPadding(double padding) {
    if (isHandset) return padding;
    if (isTablet) return padding * 1.5;
    return padding * 2;
  }

  static DeviceType _getDeviceType() {
    if (Platform.isAndroid || Platform.isIOS && isHandset) {
      return DeviceType.mobile;
    }
    if (Platform.isAndroid || Platform.isIOS && isTablet) {
      return DeviceType.tablet;
    }
    return DeviceType.desktop;
  }

  static bool get isHandset => screenWidth! < 600;

  static bool get isTablet => screenWidth! >= 600 && screenWidth! <= 900;

  static bool get isDesktop => screenWidth! > 900;

  static DeviceType get deviceType => _getDeviceType();
}
