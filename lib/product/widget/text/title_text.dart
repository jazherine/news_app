import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class TitleText extends StatelessWidget {
  const TitleText({required this.text, super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.general.textTheme.headlineMedium?.copyWith(
        decoration: TextDecoration.underline,
      ),
    );
  }
}
