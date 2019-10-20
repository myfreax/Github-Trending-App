import 'package:GTA/actions/actions.dart';
import 'package:redux/redux.dart';

final languageReducer = combineReducers<String>(
    [TypedReducer<String, ToggleLanguageAction>(_setLanguage)]);

String _setLanguage(String language, action) {
  return action.language;
}
