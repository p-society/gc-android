import 'package:flutter/material.dart';

class MyScrollController {
  final ScrollController controller;

  MyScrollController({required this.controller});

  void scrolltoBottom() {
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 30),
      curve: Curves.easeInOut,
    );
  }
}
