import 'package:GTA/app/app_state.dart';
import 'package:GTA/pages/home/home_actions.dart';
import 'package:GTA/pages/home/home_state.dart';
import 'package:GTA/pages/home/models/query_params_payload.dart';
import 'package:built_redux/built_redux.dart';
import 'package:github_trend/github_trend.dart';

NestedReducerBuilder<AppState, AppStateBuilder, HomeState, HomeStateBuilder>
    homeReducer = NestedReducerBuilder<AppState, AppStateBuilder, HomeState,
            HomeStateBuilder>((AppState state) => state.homeState,
        (AppStateBuilder builder) => builder.homeState)
      ..add(HomeActionsNames.homeIncrease, _homeIncrease)
      ..add(HomeActionsNames.languagesNotLoaded, _languagesNotLoaded)
      ..add(HomeActionsNames.loadedLanguage, _loadedLanguage)
      ..add(HomeActionsNames.loadedRepos, _loadedRepos)
      ..add(HomeActionsNames.reposNotLoaded, _reposNotLoaded)
      ..add(HomeActionsNames.loadRepos, _loadRepos);

void _homeIncrease(
    HomeState state, Action<int> action, HomeStateBuilder builder) {
  builder.homeCount = builder.homeCount + action.payload + 1;
}

void _languagesNotLoaded(
    HomeState state, Action<String> action, HomeStateBuilder builder) {
  builder.languageLoadError = action.payload;
  _setIsLoadRepos(builder, false);
}

void _loadedLanguage(
    HomeState state, Action<List<String>> action, HomeStateBuilder builder) {
  builder.languages.addAll(action.payload);
  _setIsLoadRepos(builder, false);
}

void _loadedRepos(
    HomeState state, Action<List<Repo>> action, HomeStateBuilder builder) {
  builder.repos.replace(action.payload);
  _setIsLoadRepos(builder, false);
}

void _reposNotLoaded(
    HomeState state, Action<String> action, HomeStateBuilder builder) {
  builder.reposLoadError = action.payload;
  _setIsLoadRepos(builder, false);
}

void _loadRepos(
    HomeState state, Action<QueryParamsPayload> action, HomeStateBuilder builder) {
  _setIsLoadRepos(builder, true);
}


_setIsLoadRepos(HomeStateBuilder builder, bool isLoadding){
  builder.isLoadRepos = isLoadding;
}