import 'package:flutter/material.dart';

class CountDown extends StatelessWidget {
  final int counter;

  const CountDown({this.counter});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '$counter' '\bsec',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
      ),
    );
  }
}
