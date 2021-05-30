import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  Timer _timer;
  int _startTime = 180;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    const sec = Duration(seconds: 1);
    _timer = Timer.periodic(sec, (timer) {
      if (_startTime == 0) {
        timer.cancel();
      } else {
        setState(() {
          _startTime--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        '$_startTime' '\bsec',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
      ),
    );
  }
}
