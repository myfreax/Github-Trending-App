import 'package:github_trend/github_trend.dart';
import 'package:redux/redux.dart';
import 'package:GTA/actions/actions.dart';

final reposReducer = combineReducers<List<Repo>>([
  TypedReducer<List<Repo>, ReposLoadedAction>(_setLoadedrepos),
]);

List<Repo> _setLoadedrepos(List<Repo> repos, ReposLoadedAction action) {
  return action.repos;
}
