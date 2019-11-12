import 'package:GTA/pages/login/models/login_form_payload.dart';
import 'package:GTA/pages/login/models/user.dart';
import 'package:built_redux/built_redux.dart';

part 'login_actions.g.dart';

abstract class LoginActions extends  ReduxActions{
  ActionDispatcher<LoginFormPayload> login;
  ActionDispatcher<User> loginSuccess;
  ActionDispatcher<String> loginFail;
  
  LoginActions._();
  factory LoginActions() => _$LoginActions();
}