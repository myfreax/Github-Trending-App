import 'package:GTA/actions/actions.dart';
import 'package:GTA/models/models.dart';
import 'package:redux/redux.dart';

final loginReducer = combineReducers<User>(
    [TypedReducer<User, LoginedAction>(_setLogined)]);

User _setLogined(
    User user, LoginedAction action) {
  return action.user;
}
