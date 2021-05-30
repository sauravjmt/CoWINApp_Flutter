import 'package:equatable/equatable.dart';

abstract class OTPVerifyEvent extends Equatable {
  final String otp;

  OTPVerifyEvent(this.otp);

  @override
  // TODO: implement props
  List<Object> get props => [otp];
}

class VerifyOTP extends OTPVerifyEvent {
  VerifyOTP(String otp) : super(otp);
}

class ResendOTP extends OTPVerifyEvent {
  ResendOTP(String otp) : super(otp);
}
