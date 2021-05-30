import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cowin_app/api/http_client.dart';
import 'package:flutter_cowin_app/bloc/authentication/bloc.dart';
import 'package:flutter_cowin_app/bloc/authentication/state.dart';
import 'package:flutter_cowin_app/bloc/otp_authenticate_bloc/bloc.dart';
import 'package:flutter_cowin_app/bloc/otp_generate_bloc/bloc.dart';
import 'package:flutter_cowin_app/bloc/otp_generate_bloc/state.dart';
import 'package:flutter_cowin_app/repository/user_repository/user_repository.dart';
import 'package:flutter_cowin_app/widgets/mobile_otp.dart';
import 'package:flutter_cowin_app/widgets/otp_verification.dart';

class OTPVerificationPage extends StatefulWidget {
  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void phoneLayout() {
    if (tabController.index != 0) tabController.animateTo(0);
  }

  void otpLayout() {
    if (tabController.index != 1) tabController.animateTo(1);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is GenerateOTPInit) {
        phoneLayout();
      }
      if (state is VerifyOTPInit) {
        print("VerifyOTPInit==>$VerifyOTPInit");
        otpLayout();
      }

      return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => MobileAuthBloc(
                    requestREST: RequestREST(),
                    userRepository: UserRepository(),
                    authenticationBloc: context.read<AuthenticationBloc>(),
                  )),
          BlocProvider<OTPVerifyBloc>(
              create: (context) => OTPVerifyBloc(
                    requestREST: RequestREST(),
                    userRepository: UserRepository(),
                    authenticationBloc: context.read<AuthenticationBloc>(),
                  )),
        ],
        child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              MobileOTP(),
              OTPVerificationForm(),
            ]),
      );
    });
  }
}
