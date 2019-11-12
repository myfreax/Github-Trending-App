import 'package:GTA/pages/home/models/query_params_payload.dart';
import 'package:built_redux/built_redux.dart';
import 'package:github_trend/github_trend.dart';

part 'home_actions.g.dart';

abstract class HomeActions extends ReduxActions{
  HomeActions._();
  factory HomeActions() => _$HomeActions();
  ActionDispatcher<Null> homeActions;
  ActionDispatcher<int> homeIncreaseAsync;
  ActionDispatcher<int> homeIncrease;
  ActionDispatcher<QueryParamsPayload> loadRepos;
  ActionDispatcher<List<Repo>> loadedRepos;
  ActionDispatcher<List<String>> loadedLanguage;
  ActionDispatcher<String> reposNotLoaded;
  ActionDispatcher<String> languagesNotLoaded;
}