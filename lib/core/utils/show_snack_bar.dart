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
      content: Text(
        message.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      behavior: SnackBarBehavior.floating,
      elevation: 0,
    ),
  );
}
