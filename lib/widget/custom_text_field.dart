import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? labelText;
  final IconData preFixIcon;
  final Widget? sufixIcon;
  final TextInputAction? textInputAction;
  final bool obsucure;
  final String? Function(String?) validator;
  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.labelText,
    required this.preFixIcon,
    this.sufixIcon,
    this.obsucure = false,
    this.textInputAction,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: TextFormField(
        validator: validator,
        controller: controller,
        obscureText: obsucure,
        textInputAction: textInputAction,
        decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.black),
            hintText: hintText,
            labelText: labelText,
            prefixIcon: Icon(preFixIcon),
            suffixIcon: sufixIcon),
      ),
    );
  }
}
