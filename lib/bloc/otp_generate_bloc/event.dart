import 'package:equatable/equatable.dart';

abstract class MobileAuthEvent extends Equatable {
  final String mobile;

  MobileAuthEvent(this.mobile);

  @override
  // TODO: implement props
  List<Object> get props => [mobile];
}

class GetOTP extends MobileAuthEvent {
  GetOTP(String mobile) : super(mobile);
}
