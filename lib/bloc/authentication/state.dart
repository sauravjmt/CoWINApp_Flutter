import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class AuthenticationInit extends AuthenticationState {
  const AuthenticationInit();
}

class GenerateOTPInit extends AuthenticationState {
  const GenerateOTPInit();
}

class GenerateOTPSuccess extends AuthenticationState {
  const GenerateOTPSuccess();
}

class VerifyOTPInit extends AuthenticationState {
  const VerifyOTPInit();
}

class VerifyOTPSuccess extends AuthenticationState {
  const VerifyOTPSuccess();
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();
}

class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess();
}

class AuthenticationRevoked extends AuthenticationState {
  const AuthenticationRevoked();
}
