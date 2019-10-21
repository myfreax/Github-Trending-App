import 'package:GTA/actions/actions.dart';
import 'package:redux/redux.dart';

final loginReducer = combineReducers<Map<String, String>>(
    [TypedReducer<Map<String, String>, LoginedAction>(_setLogined)]);

Map<String, String> _setLogined(
    Map<String, String> user, LoginedAction action) {
  return action.user;
}
