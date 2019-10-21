import 'package:redux/redux.dart';
import 'package:GTA/actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, LoadDetailAction>(_setLoading),
  TypedReducer<bool, LoadReposAction>(_setLoading),
  TypedReducer<bool, ReposLoadedAction>(_setLoaded),
  TypedReducer<bool, ReposNotLoadedAction>(_setLoaded),
  TypedReducer<bool, LanguagesLoadedAction>(_setLoaded),
  TypedReducer<bool, LanguagesNotLoadedAction>(_setLoaded),
  TypedReducer<bool, DetailLoadedAction>(_setLoaded),
  TypedReducer<bool, DetailNotLoadedAction>(_setLoaded),
  TypedReducer<bool, LoginAction>(_setLoading),
  TypedReducer<bool, LoginFailAction>(_setLoaded),
  TypedReducer<bool, LoginedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}

bool _setLoading(bool state, action) {
  return true;
}
