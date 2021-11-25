import 'package:flutter/material.dart';

Widget buildCustomButton(
    {required BuildContext context,
    required String text,
    required Function() onPressed,
    required Color color,
    required Color textColor}) {
  return Expanded(
    child: TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(16),
        elevation: 8,
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    ),
  );
}
