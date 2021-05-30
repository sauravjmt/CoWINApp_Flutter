import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cowin_app/api/http_client.dart';
import 'package:flutter_cowin_app/api/json_models/generate_otp_response.dart';
import 'package:flutter_cowin_app/api/json_parser/generate_otp_parser.dart';
import 'package:flutter_cowin_app/bloc/authentication/bloc.dart';
import 'package:flutter_cowin_app/bloc/authentication/event.dart';
import 'package:flutter_cowin_app/bloc/otp_generate_bloc/event.dart';
import 'package:flutter_cowin_app/bloc/otp_generate_bloc/state.dart';
import 'package:flutter_cowin_app/repository/user_repository/user_repository.dart';

class MobileAuthBloc extends Bloc<MobileAuthEvent, MobileAuthState> {
  final RequestREST requestREST;
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  MobileAuthBloc(
      {@required this.requestREST,
      @required this.userRepository,
      @required this.authenticationBloc})
      : super(const MobileAuthInit());

  @override
  Stream<MobileAuthState> mapEventToState(MobileAuthEvent event) async* {
    if (event is GetOTP) {
      yield const MobileAuthLoading();

      try {
        final otpResponse = await requestREST.executePost<GenerateOTPResponse>(
            const GenerateOTPParser(),
            "/v2/auth/public/generateOTP",
            {"mobile": event.mobile});
        print('${otpResponse.txnId}');

        final txnId = otpResponse.txnId;

        await userRepository.persistSPrefItem(UserRepository.TXN_ID, txnId);
        await userRepository.persistSPrefItem(
            UserRepository.PHONE_NUMBER, event.mobile);

        // await Future.delayed(Duration(seconds: 5));

        authenticationBloc.add(ConfirmOTP());

        yield const MobileAuthSuccess();
      } catch (e) {
        print('$e');
        yield const MobileAuthFailure();
      }

      // await Future.delayed(Duration(seconds: 5));

    }
  }
}
