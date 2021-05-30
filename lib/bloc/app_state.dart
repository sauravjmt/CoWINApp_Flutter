import 'package:flutter/material.dart';
import 'package:flutter_cowin_app/bloc/mobile_auth_bloc.dart';

class AppStateContainer extends StatefulWidget {
  final Widget child;
  final BlocProvider blocProvider;

  const AppStateContainer({@required this.blocProvider, @required this.child});

  @override
  AppState createState() => AppState();

  static AppState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_AppStoreContainer>()
        .appData;
  }
}

class AppState extends State<AppStateContainer> {
  BlocProvider get blocProvider => widget.blocProvider;
  @override
  Widget build(BuildContext context) {
    return _AppStoreContainer(
      appData: this,
      blocProvider: widget.blocProvider,
      child: widget.child,
    );
  }

  void dispose() {
    super.dispose();
  }
}

class _AppStoreContainer extends InheritedWidget {
  final AppState appData;
  final BlocProvider blocProvider;

  _AppStoreContainer(
      {Key key,
      @required this.appData,
      @required child,
      @required this.blocProvider})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_AppStoreContainer oldWidget) =>
      oldWidget.appData != this.appData;
}

class BlocProvider {
  final MobileAuthValidationBloc mobileAuthValidationBloc;
  BlocProvider({@required this.mobileAuthValidationBloc});
}
