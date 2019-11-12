import 'package:GTA/app/app_actions.dart';
import 'package:GTA/app/app_state.dart';
import 'package:GTA/pages/home/home_actions.dart';
import 'package:GTA/pages/home/home_state.dart';
import 'package:GTA/pages/home/models/query_params_payload.dart';
import 'package:built_redux/built_redux.dart';
import 'package:github_trend/github_trend.dart';
import 'package:html/dom.dart';

GithubTrend githubTrend = GithubTrend();

NestedMiddlewareBuilder<AppState, AppStateBuilder, AppActions, HomeState,
        HomeStateBuilder, HomeActions>
    homeMiddleware = NestedMiddlewareBuilder(
        (AppState state) => state.homeState,
        (AppActions actions) => actions.homeActions)
      ..add(HomeActionsNames.homeIncreaseAsync, _homeIncrease)
      ..add(HomeActionsNames.loadRepos, _loadRepos);

MiddlewareHandler<HomeState, HomeStateBuilder, HomeActions, QueryParamsPayload>
    _loadRepos = (MiddlewareApi<HomeState, HomeStateBuilder, HomeActions> api,
        ActionHandler next, Action<QueryParamsPayload> action) {
  githubTrend
      .fetchTrending(language: action.payload.language, since: action.payload.since)
      .then((Document document) {
    try {
      api.actions.loadedRepos(Repos(document).list);
    } catch (e) {
      api.actions.reposNotLoaded(e.message);
    }

    if (api.state.languages.isEmpty) {
      try {
        api.actions.loadedLanguage(Languages(document).list);
      } catch (e) {
        api.actions.languagesNotLoaded(e.message);
      }
    }
  }).catchError((onError) {
    api.actions.reposNotLoaded(onError.message);
  });
  next(action);
};

MiddlewareHandler<HomeState, HomeStateBuilder, HomeActions, int> _homeIncrease =
    (MiddlewareApi<HomeState, HomeStateBuilder, HomeActions> api,
        ActionHandler next, Action<int> action) {
  api.actions.homeIncrease(action.payload);
  next(action);
};
