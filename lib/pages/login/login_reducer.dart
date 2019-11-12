import 'package:GTA/app/app_state.dart';
import 'package:GTA/pages/login/login_actions.dart';
import 'package:GTA/pages/login/login_state.dart';
import 'package:GTA/pages/login/models/login_form_payload.dart';
import 'package:GTA/pages/login/models/user.dart';
import 'package:built_redux/built_redux.dart';

NestedReducerBuilder<AppState, AppStateBuilder, LoginState, LoginStateBuilder>
    loginReducer = NestedReducerBuilder((AppState state) => state.loginState,
        (AppStateBuilder builder) => builder.loginState)
      ..add(LoginActionsNames.login, _login)
      ..add(LoginActionsNames.loginFail, _loginFail)
      ..add(LoginActionsNames.loginSuccess, _loginSuccess);

void _login(
    LoginState, Action<LoginFormPayload> action, LoginStateBuilder builder) {
  builder.isLogging = true;
}

void _loginFail(LoginState, Action<String> action, LoginStateBuilder builder) {
  builder.isLogging = false;
  builder.loginMsg = action.payload;
}

void _loginSuccess(LoginState, Action<User> action, LoginStateBuilder builder) {
  builder.isLogging = false;
  builder.loginMsg = 'success';
  builder.user..replace(action.payload);
}
