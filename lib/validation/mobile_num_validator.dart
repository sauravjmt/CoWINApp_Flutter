import 'dart:async';

class MobileNumValidator {
  final StreamTransformer<String, String> validateMobNumber =
      StreamTransformer.fromHandlers(handleData: (number, sink) {
    if (number.length == 10) {
      sink.add(number);
    } else {
      sink.addError("10 digit mobile number");
    }
  });
}
