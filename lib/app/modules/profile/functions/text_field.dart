import 'package:flutter/material.dart';

Widget buildTextFormField({
  required TextEditingController controller,
  required String label,
  required IconData prefixIcon,
}) {
  return Column(
    children: [
      TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          label: Text(label),
          prefixIcon: Icon(prefixIcon),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: const BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
    ],
  );
}