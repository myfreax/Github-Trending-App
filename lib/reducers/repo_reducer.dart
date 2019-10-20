import 'package:GTA/actions/actions.dart';
import 'package:github_trend/github_trend.dart';
import 'package:redux/redux.dart';

final repoReducer =
    combineReducers<Repo>([TypedReducer<Repo, ToggleRepoAction>(_setRepo)]);

Repo _setRepo(Repo repo, action) {
  return action.repo;
}
