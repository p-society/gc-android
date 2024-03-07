import 'package:flutter/material.dart';

class MyScaffoldMessage {
  void showScaffoldMessenge({
    required BuildContext context,
    required String content,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
        ),
      ),
    );
  }
}
