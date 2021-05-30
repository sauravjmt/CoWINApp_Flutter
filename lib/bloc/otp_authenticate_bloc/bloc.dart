import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cowin_app/api/http_client.dart';
import 'package:flutter_cowin_app/api/json_models/generate_otp_response.dart';
import 'package:flutter_cowin_app/api/json_models/verify_otp_response.dart';
import 'package:flutter_cowin_app/api/json_parser/generate_otp_parser.dart';
import 'package:flutter_cowin_app/api/json_parser/verify_otp_response_parser.dart';
import 'package:flutter_cowin_app/bloc/authentication/bloc.dart';
import 'package:flutter_cowin_app/bloc/authentication/event.dart';
import 'package:flutter_cowin_app/bloc/otp_authenticate_bloc/event.dart';
import 'package:flutter_cowin_app/bloc/otp_authenticate_bloc/state.dart';
import 'package:flutter_cowin_app/repository/user_repository/user_repository.dart';

class OTPVerifyBloc extends Bloc<OTPVerifyEvent, OTPVerifyState> {
  final RequestREST requestREST;
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  OTPVerifyBloc({
    @required this.requestREST,
    @required this.userRepository,
    @required this.authenticationBloc,
  }) : super(OTPVerifyInit());

  @override
  Stream<OTPVerifyState> mapEventToState(OTPVerifyEvent event) async* {
    if (event is VerifyOTP) {
      yield* _verifyOTP(event);
    } else if (event is ResendOTP) {
      yield* _resendOTP(event);
    }
  }

  Stream<OTPVerifyState> _resendOTP(OTPVerifyEvent event) async* {
    yield ResendOTPLoading();

    try {
      final mobile =
          await userRepository.getSPrefItem(UserRepository.PHONE_NUMBER);
      final otpResponse = await requestREST.executePost<GenerateOTPResponse>(
          const GenerateOTPParser(),
          "/v2/auth/public/generateOTP",
          {"mobile": mobile});
      print('${otpResponse.txnId}');

      final txnId = otpResponse.txnId;

      await userRepository.persistSPrefItem(UserRepository.TXN_ID, txnId);

      // await Future.delayed(Duration(seconds: 5));

      yield ResendOTPSuccess();
    } catch (e) {
      yield ResendOTPFailure();
    }
  }

  Stream<OTPVerifyState> _verifyOTP(OTPVerifyEvent event) async* {
    yield OTPVerifyLoading();

    try {
      print('===>OTP==>${event.otp}');
      final otpSHA = generateSHAFromOTP(event.otp);

      print(' otpSHS==>${otpSHA.length}');
      final txnId = await userRepository.getSPrefItem(UserRepository.TXN_ID);

      print(' txnID====>$txnId');

      final otpVerified = await requestREST.executePost<OTPVerifyResponse>(
          OTPVerifiedParser(),
          "/v2/auth/public/confirmOTP",
          {"otp": otpSHA, "txnId": txnId});

      print('${otpVerified.token}');
      final token = otpVerified.token;

      await userRepository.persistSPrefItem(UserRepository.TOKEN, token);

      // await Future.delayed(Duration(seconds: 5));

      authenticationBloc.add(OTPAuthenticated());

      yield OTPVerifySuccess();
    } catch (e) {
      print('=====>$e');
      yield OTPVerifyFailure();
    }
  }

  String generateSHAFromOTP(String otp) {
    return sha256.convert(utf8.encode(otp)).toString();
  }
}
