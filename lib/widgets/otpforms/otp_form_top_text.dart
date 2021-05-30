import 'package:flutter/material.dart';

class OTPFormTopText extends StatelessWidget {
  final String text;
  const OTPFormTopText({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        text,
        style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
