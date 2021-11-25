import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget showTextInputField(
    {required String labelText,
    required BuildContext context,
    required TextEditingController textEditingController}) {
  return TextFormField(
    controller: textEditingController,
    style: TextStyle(
        fontSize: 20,
        color: Theme.of(context).hintColor,
        fontWeight: FontWeight.w700),
    decoration: InputDecoration(
      fillColor: Theme.of(context).scaffoldBackgroundColor,
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
