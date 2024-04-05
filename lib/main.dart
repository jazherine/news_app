import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_news_app/feature/splash/splash_view.dart';
import 'package:flutter_firebase_full_news_app/product/constants/index.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: always_use_package_imports
import 'feature/home/home_view.dart';
// ignore: always_use_package_imports
import 'product/initialize/app_start_init.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appName,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const SplashView(),
      ),
    );
  }
}
