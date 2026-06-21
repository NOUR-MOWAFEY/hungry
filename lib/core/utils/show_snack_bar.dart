import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context, {
  required String message,
  bool isSuccess = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isSuccess
          ? const Color(0xff428041)
          : const Color.fromARGB(255, 219, 67, 67),
      content: Text(message.toString()),
    ),
  );
}
