import 'package:GTA/actions/actions.dart';
import 'package:redux/redux.dart';

final loginErrMsgReducer = combineReducers<String>(
    [TypedReducer<String, LoginFailAction>(_setLoginFail)]);

String _setLoginFail(String loginErrMsg, LoginFailAction action) {
  return action.loginErrMsg;
}
