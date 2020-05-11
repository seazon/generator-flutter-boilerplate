import 'package:flutter/material.dart';

class DialogUtil {
  static void alert(BuildContext context, String title, String content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(content),
          );
        });
  }
}
