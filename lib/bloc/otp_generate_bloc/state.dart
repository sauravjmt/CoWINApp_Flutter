import 'package:equatable/equatable.dart';

abstract class MobileAuthState extends Equatable {

  const MobileAuthState();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class MobileAuthInit extends MobileAuthState{
   const MobileAuthInit();
}

class MobileAuthLoading extends MobileAuthState{

  const MobileAuthLoading();
}


class MobileAuthSuccess extends MobileAuthState{
  const MobileAuthSuccess();
}

class MobileAuthFailure extends MobileAuthState{

  const MobileAuthFailure();
}
