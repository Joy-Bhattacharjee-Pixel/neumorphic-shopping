import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_neumorphic/models/color.model.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.validator,
      this.textInputType = TextInputType.text,
      this.inputFormatters});

  final TextEditingController controller;
  final String hint;
  final String? Function(String?) validator;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        validator: (value) {
          return validator(value);
        },
        controller: controller,
        decoration: decoration,
        style: style);
  }

  InputDecoration get decoration => InputDecoration(
      filled: true,
      fillColor: Colors.black.withOpacity(0.03),
      isDense: true,
      hintText: hint,
      hintStyle: hintStyle,
      border: border,
      enabledBorder: border);

  TextStyle get style => TextStyle(
      fontSize: 14.5, color: Colors.black, fontWeight: FontWeight.w500);

  TextStyle get hintStyle => TextStyle(
      fontSize: 14, color: AppColors.grey, fontWeight: FontWeight.w400);

  OutlineInputBorder get border => OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(color: Colors.black12, width: 1));
}
