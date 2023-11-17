import 'package:flutter/material.dart';

Container buildInputContainer({
  required TextEditingController controller,
  required String hintText,
  required IconData prefixIcon,
  bool isPassword = false,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          offset: const Offset(1, 1),
          spreadRadius: 7,
          color: Colors.grey.withOpacity(0.2),
        ),
      ],
    ),
    child: TextFormField(
       obscureText: isPassword, // Set obscureText for password field
      keyboardType: isPassword
          ? TextInputType.visiblePassword
          : TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon:  Icon(prefixIcon, color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.white, width: 1.0),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}