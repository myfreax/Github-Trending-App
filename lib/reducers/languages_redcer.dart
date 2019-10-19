import 'package:redux/redux.dart';
import 'package:GTA/actions/actions.dart';


final languagesReducer = combineReducers<List<String>>([
  TypedReducer<List<String>, LanguagesLoadedAction>(_setLoadedlanguages),
  TypedReducer<List<String>, LanguagesNotLoadedAction>(_setNolanguages),
]);

List<String> _setLoadedlanguages(List<String> languages, LanguagesLoadedAction action) {
  return action.languages;
}

List<String> _setNolanguages(List<String> languages, LanguagesNotLoadedAction action) {
  return [];
}