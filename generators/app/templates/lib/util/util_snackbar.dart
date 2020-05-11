import 'package:flutter/material.dart';

class SnackBarUtil {
  static void show(BuildContext context, String content) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(content)));
  }
}
