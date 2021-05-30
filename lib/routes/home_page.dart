import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cowin_app/bloc/otp_generate_bloc/bloc.dart';
import 'package:flutter_cowin_app/bloc/otp_generate_bloc/blocs.dart';
import 'package:flutter_cowin_app/widgets/mobile_otp.dart';
import 'package:flutter_cowin_app/widgets/otp_verification.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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
    return BlocBuilder<MobileAuthBloc, MobileAuthState>(
        builder: (context, state) {
      if (state is MobileAuthSuccess) {
        otpLayout();
      }
      if (state is MobileAuthInit) {
        phoneLayout();
      }

      return TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            MobileOTP(),
            OTPVerificationForm(),
          ]);
    });
  }
}
