// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

@immutable
class AppTheme {
  final BuildContext context;
  const AppTheme({
    required this.context,
  });
  ThemeData get theme => ThemeData.light().copyWith(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(12)),
            textStyle: MaterialStatePropertyAll(context.general.textTheme.headlineSmall),
          ),
        ),
        colorScheme: const ColorScheme.light(
          background: Colors.blue,
          primary: Colors.white,
        ),
      );
}
