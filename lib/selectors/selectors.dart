import 'package:github_trend/github_trend.dart';
import 'package:GTA/models/models.dart';
import 'package:redux/redux.dart';

List<Repo> reposSelector(Store<AppState> store) => store.state.repos;

bool loadingSelector(Store<AppState> store) => store.state.isLoading;

String languageSelector(Store<AppState> store) => store.state.language;

List<String> languagesSelector(Store<AppState> store) => store.state.languages;

Since sinceSelector(Store<AppState> store) => store.state.since;

Repo repoSelector(Store<AppState> store) => store.state.repo;

String detailSelector(Store<AppState> store) => store.state.detail;

String reposErrMsgSelector(Store<AppState> store) => store.state.reposErrMsg;

String languagesErrMsgSelector(Store<AppState> store) =>
    store.state.languagesErrMsg;
