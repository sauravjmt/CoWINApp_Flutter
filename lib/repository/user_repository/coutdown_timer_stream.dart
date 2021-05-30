import 'dart:async';

class CountdownTimerStream {
  Timer _timer;
  StreamController<int> _controller;
  int _currentCount;

  CountdownTimerStream() {
    print('currentCount==.$_currentCount');
    _controller = StreamController(
      onListen: _startStream,
      onCancel: _stopTimer,
      onPause: _stopTimer,
      onResume: _startStream,
    );
  }

  Stream<int> get stream => _controller.stream;

  _startStream() {
    _currentCount = 180;
    _timer = Timer.periodic(Duration(seconds: 1), _runStream);
  }

  _runStream(Timer timer) {
    _currentCount--;
    _controller.add(_currentCount);

    if (_currentCount == 0) _stopTimer();
  }

  _stopTimer() {
    _timer.cancel();
    _controller.close();
  }
}
