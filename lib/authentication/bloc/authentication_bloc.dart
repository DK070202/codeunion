import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

typedef _AuthStateEmitter = Emitter<AuthenticationState>;

class AuthenticationBlock
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBlock() : super(AuthenticationState()) {
    on<LoginEvent>(_onLoginEvent);
    on<LogoutEvent>(_onLogOutEvent);
  }

  void initialize() {}

  void _onLoginEvent(
    LoginEvent loginEvent,
    _AuthStateEmitter emitter,
  ) {}

  void _onLogOutEvent(
    LogoutEvent logoutEvent,
    _AuthStateEmitter emitter,
  ) {}
}
