import 'package:GTA/models/app_state.dart';
import 'package:GTA/reducers/detail_reducer.dart';
import 'package:GTA/reducers/language_err_msg_reducer.dart';
import 'package:GTA/reducers/language_reducer.dart';
import 'package:GTA/reducers/languages_redcer.dart';
import 'package:GTA/reducers/loading_reducer.dart';
import 'package:GTA/reducers/repo_reducer.dart';
import 'package:GTA/reducers/repos_err_msg_reducer.dart';
import 'package:GTA/reducers/repos_reducer.dart';

/// create the State reducer by combining many smaller reducers into one!
AppState appReducer(AppState state, action) {
  return AppState(
      isLoading: loadingReducer(state.isLoading, action),
      repos: reposReducer(state.repos, action),
      languages: languagesReducer(state.languages, action),
      language: languageReducer(state.language, action),
      repo: repoReducer(state.repo, action),
      detail: detailReducer(state.detail, action),
      languagesErrMsg: languageErrMsgReducer(state.languagesErrMsg, action),
      reposErrMsg: reposErrMsgReducer(state.reposErrMsg, action));
}
