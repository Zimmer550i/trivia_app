import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String massage) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(massage),
      ),
    );
}
