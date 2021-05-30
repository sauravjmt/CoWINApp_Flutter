import 'package:flutter_cowin_app/validation/mobile_num_validator.dart';
import 'package:rxdart/rxdart.dart';

class MobileAuthValidationBloc extends Object with MobileNumValidator {
  final BehaviorSubject<String> _mobileStreamController = BehaviorSubject();
  //Input for Mobile Number

  Function(String) get mobNumberChanged => _mobileStreamController.sink.add;

  //OutPut for Mobile Number Field

  Stream<String> get mobNumberStream =>
      _mobileStreamController.stream.transform(validateMobNumber);

  Stream<bool> get submitStream =>
      Rx.combineLatest2(mobNumberStream, mobNumberStream, (a, b) => true);

  void dispose() {
    _mobileStreamController.close();
  }
}
