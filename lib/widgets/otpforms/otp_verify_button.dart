import 'package:flutter/material.dart';

class OTPButton extends StatelessWidget {
  final String btnText;
  final Function onClick;
  const OTPButton({this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
          width: double.infinity,
          height: 40.0,
          child: ElevatedButton(
              onPressed: onClick,
              child: Text(
                btnText,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ))),
    );
  }
}
