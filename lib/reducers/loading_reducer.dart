import 'package:redux/redux.dart';
import 'package:GTA/actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, ReposLoadedAction>(_setLoaded),
  TypedReducer<bool, ReposNotLoadedAction>(_setLoaded),
  TypedReducer<bool, LanguagesLoadedAction>(_setLoaded),
  TypedReducer<bool, LanguagesNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}