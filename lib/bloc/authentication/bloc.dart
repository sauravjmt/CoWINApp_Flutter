import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cowin_app/bloc/authentication/event.dart';
import 'package:flutter_cowin_app/bloc/authentication/state.dart';
import 'package:flutter_cowin_app/bloc/otp_authenticate_bloc/state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInit());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is ConfirmOTP) {
      yield const VerifyOTPInit();
    } else if (event is OTPAuthenticated) {
      yield AuthenticationSuccess();
    }
  }
}
