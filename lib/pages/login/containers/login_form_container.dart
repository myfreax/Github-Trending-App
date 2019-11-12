import 'package:GTA/app/app_actions.dart';
import 'package:GTA/app/app_state.dart';
import 'package:GTA/pages/login/login_state.dart';
import 'package:GTA/pages/login/models/login_form_payload.dart';
import 'package:GTA/pages/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

class LoginFormContainer extends StoreConnector<AppState, AppActions, LoginState>{
  @override
  Widget build(BuildContext context, LoginState state, AppActions actions) {
    return LoginForm(loading: state.isLogging,loginMsg: state.loginMsg,login: ({String username, String password}){
      actions.loginActions.login(LoginFormPayload(username, password));
    },);
  }

  @override
  LoginState connect(AppState state) {
    return state.loginState;
  }
}
