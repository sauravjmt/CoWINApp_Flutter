import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cowin_app/bloc/authentication/bloc.dart';
import 'package:flutter_cowin_app/bloc/authentication/state.dart';
import 'package:flutter_cowin_app/routes/search_vaccine.dart';

import 'opt_verificarion_page.dart';

class AuthLoadingScreen extends StatefulWidget {
  @override
  _AuthLoadingScreenState createState() => _AuthLoadingScreenState();
}

class _AuthLoadingScreenState extends State<AuthLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is AuthenticationSuccess) {
        return SearchVaccineSlots();
      }
      return OTPVerificationPage();
    });
  }
}
