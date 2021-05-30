import 'package:flutter/material.dart';

class OTPFormSecTopText extends StatelessWidget {
  final String text;
  const OTPFormSecTopText({
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black54, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
