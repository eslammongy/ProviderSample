import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget showTextInputField(
    {required String labelText,
    required TextEditingController textEditingController}) {
  return TextFormField(
    controller: textEditingController,
    style: const TextStyle(
        fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w700),
    decoration: InputDecoration(
      fillColor: Colors.white,
      filled: true,
      labelText: labelText,
      labelStyle: const TextStyle(
          fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w600),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return "please $labelText !";
      }
      return null;
    },
  );
}
