import 'package:flutter/material.dart';
import 'package:flutter_firebase_full_news_app/feature/home/home_view.dart';
import 'package:flutter_firebase_full_news_app/product/initialize/app_start_init.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const HomeView(),
      ),
    );
  }
}
