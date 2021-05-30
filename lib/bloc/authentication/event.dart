import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  const AppStarted();
}

class GenerateOTP extends AuthenticationEvent {
  const GenerateOTP();
}

class ConfirmOTP extends AuthenticationEvent {
  const ConfirmOTP();
}

class OTPAuthenticated extends AuthenticationEvent {
  const OTPAuthenticated();
}

class LoggedOut extends AuthenticationEvent {
  const LoggedOut();
}
