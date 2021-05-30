import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cowin_app/bloc/otp_authenticate_bloc/bloc.dart';
import 'package:flutter_cowin_app/bloc/otp_authenticate_bloc/event.dart';
import 'package:flutter_cowin_app/bloc/otp_authenticate_bloc/state.dart';
import 'package:flutter_cowin_app/repository/user_repository/coutdown_timer_stream.dart';

import 'otpforms/circle_widget.dart';
import 'otpforms/countdown.dart';
import 'otpforms/countdown_widget.dart';
import 'otpforms/otp_form_sec_top_text.dart';
import 'otpforms/otp_form_top_text.dart';
import 'otpforms/otp_text_field.dart';
import 'otpforms/otp_verify_button.dart';

class OTPVerificationForm extends StatelessWidget {
  final otpEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print("OTP VErif");
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification"),
      ),
      body: Stack(children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 4),
                    blurRadius: 10,
                  )
                ]),
                constraints: BoxConstraints.expand(height: 400),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OTPFormTopText(
                      text: "OTP Verification",
                    ),
                    OTPFormSecTopText(
                        text: "An OTP has been sent to XXX XXX 6765"),
                    OTPTextField(
                      textEditingController: otpEditingController,
                      hintText: "Enter OTP",
                      onTextChange: (phone) {
                        print(phone);
                      },
                    ),
                    BlocBuilder<OTPVerifyBloc, OTPVerifyState>(
                        builder: (context, state) {
                      if (state is OTPVerifyInit || state is ResendOTPSuccess) {
                        return StreamBuilder<Object>(
                            stream: CountdownTimerStream().stream,
                            builder: (context, snapshot) {
                              if (snapshot.data == 0) {
                                return Container(
                                  child: ElevatedButton(
                                    onPressed: () => {
                                      context
                                          .read<OTPVerifyBloc>()
                                          .add(ResendOTP(""))
                                    },
                                    child: Text("Resend"),
                                  ),
                                );
                              }
                              return CountDown(
                                counter: snapshot.data,
                              );
                            });
                      }

                      return Container();
                    }),
                    OTPFormSecTopText(
                        text:
                            "There might be some delay in receiving the OTP due to "
                            "heavy traffic"),
                    OTPButton(
                      btnText: "Verify & Proceed",
                      onClick: () => context
                          .read<OTPVerifyBloc>()
                          .add(VerifyOTP(otpEditingController.text)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        BlocBuilder<OTPVerifyBloc, OTPVerifyState>(builder: (context, state) {
          if (state is OTPVerifyLoading || state is ResendOTPLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Container();
        }),
      ]),
    );
  }
}
