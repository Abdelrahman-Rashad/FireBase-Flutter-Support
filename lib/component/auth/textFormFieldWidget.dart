import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget(
      {super.key,
      required this.textController,
      required this.text,
      required this.errorText});
  TextEditingController textController;
  String text;
  String errorText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
          controller: textController,
          decoration: InputDecoration(
            hintText: text,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return errorText;
            }
            return null;
          }),
    );
  }
}
