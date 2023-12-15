import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.controller,
      required this.label,
      required this.isReadOnly});

  final TextEditingController controller;
  final String label;
  final bool isReadOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(), label: Text(label)),
      controller: controller,
      readOnly: isReadOnly,
      textInputAction: TextInputAction.next,
    );
  }
}
