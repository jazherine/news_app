// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:flutter_firebase_full_news_app/product/constants/index.dart';

class SubTitleText extends StatelessWidget {
  const SubTitleText({
    required this.text,
    super.key,
    this.color,
  });
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.general.textTheme.titleMedium?.copyWith(
        color: color,
      ),
    );
  }
}
