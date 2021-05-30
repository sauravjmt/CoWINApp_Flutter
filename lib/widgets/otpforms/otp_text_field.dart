import 'package:flutter/material.dart';

class OTPTextField extends StatelessWidget {
  final String hintText;
  final String errorText;
  final Function(String) onTextChange;
  final TextEditingController textEditingController;
  const OTPTextField({
    this.hintText,
    this.onTextChange,
    this.errorText,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        controller: textEditingController,
        maxLength: 10,
        keyboardType: TextInputType.phone,
        onChanged: onTextChange,
        decoration: InputDecoration(hintText: hintText, errorText: errorText),
      ),
    );
  }
}
