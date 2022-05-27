// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

// ignore: camel_case_types
class formfield extends StatelessWidget {
  final control;
  final hinttext;
  final keyboard;
  String? initialValue;

  // ignore: use_key_in_widget_constructors
   formfield(
      {required this.control, required this.hinttext, required this.keyboard,this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initialValue,
        controller: control,
        decoration: InputDecoration(
          icon: const Icon(Icons.person),
          hintText: hinttext,
          border: const OutlineInputBorder()
          
        ),
        keyboardType: keyboard,
      ),
    );
  }
}
