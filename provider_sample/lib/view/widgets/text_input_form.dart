import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget showTextInputField(
    {required String labelText,
    required TextEditingController textEditingController}) {
  return TextFormField(
    controller: textEditingController,
    style: const TextStyle(
        fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w700),
    decoration: InputDecoration(
      fillColor: HexColor("D6CBB7"),
      filled: true,
      labelText: labelText,
      labelStyle: const TextStyle(
          fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w600),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
    ),
    validator: (String? value) {
      return value!.isEmpty ? '$labelText is required' : null;
    },
    onSaved: (String? value) {},
  );
}
