import 'package:equatable/equatable.dart';

abstract class OTPVerifyState extends Equatable {
  const OTPVerifyState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class OTPVerifyInit extends OTPVerifyState {
  const OTPVerifyInit();
}

class OTPVerifyLoading extends OTPVerifyState {
  const OTPVerifyLoading();
}

class OTPVerifySuccess extends OTPVerifyState {
  const OTPVerifySuccess();
}

class OTPVerifyFailure extends OTPVerifyState {
  const OTPVerifyFailure();
}

class ResendOTPLoading extends OTPVerifyState {
  const ResendOTPLoading();
}

class ResendOTPSuccess extends OTPVerifyState {
  const ResendOTPSuccess();
}

class ResendOTPFailure extends OTPVerifyState {
  const ResendOTPFailure();
}
