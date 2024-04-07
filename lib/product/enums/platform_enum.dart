import 'dart:io';

import 'package:flutter/foundation.dart';

enum PlatformEnum {
  android,
  ios,
  web;

  static String get versionName {
    if (kIsWeb) {
      return PlatformEnum.web.name;
    }
    if (Platform.isIOS) {
      return PlatformEnum.ios.name;
    }
    if (Platform.isAndroid) {
      return PlatformEnum.android.name;
    }

    throw Exception('Platform unused please Check');
  }
}
