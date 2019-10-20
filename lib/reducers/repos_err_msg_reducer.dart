import 'package:GTA/actions/actions.dart';
import 'package:redux/redux.dart';

final reposErrMsgReducer = combineReducers<String>(
    [TypedReducer<String, ReposNotLoadedAction>(_setReposErrMsge)]);

String _setReposErrMsge(String reposErrMsg, ReposNotLoadedAction action) {
  return action.reposErrMsg;
}
