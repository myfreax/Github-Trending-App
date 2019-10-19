import 'package:GTA/actions/actions.dart';
import 'package:redux/redux.dart';

final repoReducer = combineReducers<String>([
  TypedReducer<String, RepoLoadedAction>(_setRepo),
  TypedReducer<String, RepoNotLoadedAction>(_setNorepo),
]);

String _setRepo(String repo, RepoLoadedAction action) {
 return action.repo;
}

String _setNorepo(String repo, RepoNotLoadedAction action){
  return action.errorMessage;
}