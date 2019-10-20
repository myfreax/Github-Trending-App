import 'package:GTA/actions/actions.dart';
import 'package:redux/redux.dart';

final languageErrMsgReducer = combineReducers<String>(
    [TypedReducer<String, LanguagesNotLoadedAction>(_setLanguageErrMsg)]);

String _setLanguageErrMsg(
    String languagesErrMsg, LanguagesNotLoadedAction action) {
  return action.languagesErrMsg;
}
