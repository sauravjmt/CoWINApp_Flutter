import 'package:flutter/material.dart';
import 'package:flutter_cowin_app/routes/auth_loading_screen.dart';
import 'package:flutter_cowin_app/routes/opt_verificarion_page.dart';
import 'package:flutter_cowin_app/routes/search_vaccine.dart';

import 'routes/home_page.dart';

class RouteGenerator {
  static const String authLoading = '/';
  static const String otpVerificationPage = '/otpverify';
  static const String searchPage = '/search';
  RouteGenerator._();

  // Expose a key to use a navigator without a context
  //link this with Material parameter called navigatorKey:RouteGenerator.key
  //How to use RouteGenerator.key.currentState?.pushName()
  // Use this way when there is extreamly necessary
  static final key = GlobalKey<NavigatorState>();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authLoading:
        return MaterialPageRoute(builder: (_) => AuthLoadingScreen());
      case otpVerificationPage:
        return MaterialPageRoute(builder: (_) => OTPVerificationPage());
      case searchPage:
        return MaterialPageRoute(builder: (_) => SearchVaccineSlots());
      default:
        throw FormatException("Route not found !");
    }
  }
}

class RouteException implements Exception {
  final String message;
  RouteException(this.message);
}
