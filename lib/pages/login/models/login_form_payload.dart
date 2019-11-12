import 'package:built_value/built_value.dart';

part 'login_form_payload.g.dart';

abstract class LoginFormPayload implements Built<LoginFormPayload, LoginFormPayloadBuilder>{
  String get username;
  String get password;

  LoginFormPayload._();
  factory LoginFormPayload(String usernaem, String password) => _$LoginFormPayload._(username: usernaem, password: password);
}