import 'package:GTA/pages/login/models/user.dart';
import 'package:built_value/built_value.dart';

part 'login_state.g.dart';

abstract class LoginState implements Built<LoginState, LoginStateBuilder>{
  User get user;
  bool get isLogging;

  String get loginMsg;

  LoginState._();
  factory LoginState() => _$LoginState._(isLogging: false, user: User(), loginMsg: '');
}