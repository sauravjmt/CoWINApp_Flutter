import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cowin_app/api/http_client.dart';
import 'package:flutter_cowin_app/bloc/authentication/bloc.dart';
import 'package:flutter_cowin_app/my_bloc_observer.dart';
import 'package:flutter_cowin_app/repository/user_repository/user_repository.dart';
import 'package:flutter_cowin_app/routes.dart';
import 'package:flutter_cowin_app/routes/auth_loading_screen.dart';
import 'package:flutter_cowin_app/routes/home_page.dart';
import 'package:flutter_cowin_app/routes/opt_verificarion_page.dart';
import 'package:flutter_cowin_app/widgets/mobile_otp.dart';
import 'package:flutter_cowin_app/widgets/otp_verification.dart';

import 'bloc/mobile_auth_bloc.dart';
import 'bloc/otp_authenticate_bloc/bloc.dart';
import 'bloc/otp_generate_bloc/bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: RouteGenerator.authLoading,
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

// home: MultiBlocProvider(providers: [
// BlocProvider(
// create: (context) => MobileAuthBloc(
// requestREST: RequestREST(),
// userRepository: UserRepository())),
// BlocProvider(
// create: (context) => OTPVerifyBloc(
// requestREST: RequestREST(),
// userRepository: UserRepository(),
// ))
// ], child: AuthLoadingScreen()))
