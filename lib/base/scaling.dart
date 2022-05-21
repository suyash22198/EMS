import 'package:flutter/material.dart';

class Scaling {
  static double _height = 0;
  static double _width = 0;

  static void getHeight(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
  }

  static void getWidth(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
  }

  static double scaleByHeight(double value) {
    return (_height / 826) * value;
  }

  static double scaleByWidth(double value) {
    return (_width / 411) * value;
  }
}