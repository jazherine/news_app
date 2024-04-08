// ignore_for_file: always_use_package_imports

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_news_app/product/initialize/app_cache.dart';
import 'package:kartal/kartal.dart';

import '../../firebase_options.dart';

@immutable
class ApplicationStart {
  const ApplicationStart._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await DeviceUtility.instance.initPackageInfo();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
      GoogleProvider(clientId: ''),
    ]);

    await AppCache.instance.setup();
  }
}
