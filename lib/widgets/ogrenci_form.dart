import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildTextFormField extends StatelessWidget {
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  final String text;
  final TextEditingController controller;
  const BuildTextFormField({
    Key? key,
    required this.controller,
    required this.text, this.textInputType, this.textInputFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: textInputType,
  inputFormatters: textInputFormatter,
        controller: controller,
        decoration: InputDecoration(
            labelText: text,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 3, color: Colors.red),
              borderRadius: BorderRadius.circular(15),
            )),
      ),
    );
  }
}
