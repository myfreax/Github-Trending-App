import 'dart:convert';
import 'package:GTA/app/app_actions.dart';
import 'package:GTA/app/app_state.dart';
import 'package:GTA/pages/login/login_actions.dart';
import 'package:GTA/pages/login/login_state.dart';
import 'package:GTA/pages/login/models/login_form_payload.dart';
import 'package:GTA/pages/login/models/user.dart';
import 'package:built_redux/built_redux.dart';
import 'package:GTA/serializers.dart';
import 'package:http/http.dart' as http;

NestedMiddlewareBuilder<AppState, AppStateBuilder, AppActions, LoginState,
        LoginStateBuilder, LoginActions>
    loginMiddleware = NestedMiddlewareBuilder(
        (AppState state) => state.loginState,
        (AppActions actions) => actions.loginActions)
      ..add(LoginActionsNames.login, _login);

void _login(MiddlewareApi<LoginState, LoginStateBuilder, LoginActions> api,
    ActionHandler next, Action<LoginFormPayload> action) {
  Map<String, String> headers = {};
  String userAndPass = base64Encode(
      utf8.encode('${action.payload.username}:${action.payload.password}'));
  headers.putIfAbsent("Authorization", () => "basic $userAndPass");
  http
      .get('https://api.github.com/user', headers: headers)
      .then((http.Response res) {
    if (res.statusCode == 200) {
      Map<String, dynamic> map = json.decode(res.body);
      map['password'] = action.payload.password;
      api.actions
          .loginSuccess(serializers.deserializeWith(User.serializer, map));
    } else {

      api.actions
          .loginFail('${res.statusCode.toString()} ${res.body.toString()}');
    }
  }).catchError((e) {
    print(e);
    api.actions.loginFail(e.message);
  });
  next(action);
}
