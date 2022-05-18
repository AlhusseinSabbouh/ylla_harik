import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {required this.labelText,
      required this.onSaved,
      required this.validator,
      this.keyboardType = TextInputType.text,
      this.initalValue = ''});

  final String labelText;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String initalValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableSuggestions: false,
      maxLines: 3,
      minLines: 1,
      initialValue: initalValue,
      keyboardType: keyboardType,
      validator: validator,
      onSaved: onSaved,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 3, 50, 95), width: 2)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 3, 50, 95), width: 2)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 3, 50, 95), width: 2)),
          labelText: labelText,
          labelStyle: TextStyle(color: Color.fromARGB(255, 46, 46, 59))),
    );
  }
}
