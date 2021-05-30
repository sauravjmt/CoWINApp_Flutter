import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_cowin_app/bloc/mobile_auth_bloc.dart';
import 'package:flutter_cowin_app/bloc/otp_generate_bloc/bloc.dart';
import 'package:flutter_cowin_app/bloc/otp_generate_bloc/blocs.dart';
import 'package:flutter_cowin_app/widgets/otpforms/otp_form_sec_top_text.dart';
import 'package:flutter_cowin_app/widgets/otpforms/otp_form_top_text.dart';

import 'otpforms/circle_widget.dart';
import 'otpforms/otp_text_field.dart';
import 'otpforms/otp_verify_button.dart';

class MobileOTP extends StatefulWidget {
  @override
  _MobileOTPState createState() => _MobileOTPState();
}

class _MobileOTPState extends State<MobileOTP> {
  MobileAuthValidationBloc mobileAuthValidationBloc;

  final phoneEditingController = TextEditingController();

  @override
  void didChangeDependencies() {
    mobileAuthValidationBloc = MobileAuthValidationBloc();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    mobileAuthValidationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verification"),
      ),
      body: Stack(children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 4),
                    blurRadius: 10,
                  )
                ]),
                constraints: BoxConstraints.expand(height: 350),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<MobileAuthBloc, MobileAuthState>(
                        builder: (context, state) {
                      if (state is MobileAuthLoading) {
                        return Center(child: CircularProgressIndicator());
                      }

                      return Container();
                    }),
                    OTPFormTopText(
                      text: "Register or Sign in for Verification",
                    ),
                    OTPFormSecTopText(
                        text:
                            "An OTP will be sent to your mobile number for verification"),
                    StreamBuilder<String>(
                        stream: mobileAuthValidationBloc.mobNumberStream,
                        builder: (context, snapshot) {
                          return OTPTextField(
                            textEditingController: phoneEditingController,
                            errorText: snapshot.error,
                            hintText: "Enter your mobile number",
                            onTextChange:
                                mobileAuthValidationBloc.mobNumberChanged,
                          );
                        }),
                    StreamBuilder<Object>(
                        stream: mobileAuthValidationBloc.submitStream,
                        builder: (context, snapshot) {
                          return OTPButton(
                            btnText: "Get OTP",
                            onClick: snapshot.hasData
                                ? () => context.read<MobileAuthBloc>().add(
                                    GetOTP(phoneEditingController
                                        .text)) //using Extension same as BlocProvider.of<MobileAuthBloc>(context).add()
                                : null,
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
        //CircleWidget()
      ]),
    );
  }
}
