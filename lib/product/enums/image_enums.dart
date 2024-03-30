import 'package:flutter/material.dart';

enum IconConstants {
  microphone('ic_microphone');

  final String value;
  const IconConstants(this.value);

  String get toPng => 'assets/images/$value.png';
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(IconConstants.microphone.toPng);
  }
}
