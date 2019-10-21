import 'package:GTA/models/app_state.dart';
import 'package:GTA/reducers/detail_reducer.dart';
import 'package:GTA/reducers/language_err_msg_reducer.dart';
import 'package:GTA/reducers/language_reducer.dart';
import 'package:GTA/reducers/languages_redcer.dart';
import 'package:GTA/reducers/loading_reducer.dart';
import 'package:GTA/reducers/login_err_mgs_reducer.dart';
import 'package:GTA/reducers/login_reducer.dart';
import 'package:GTA/reducers/repos_err_msg_reducer.dart';
import 'package:GTA/reducers/repos_reducer.dart';

/// create the State reducer by combining many smaller reducers into one!
AppState appReducer(AppState state, action) {
  return AppState(
      isLoading: loadingReducer(state.isLoading, action),
      repos: reposReducer(state.repos, action),
      languages: languagesReducer(state.languages, action),
      language: languageReducer(state.language, action),
      detail: detailReducer(state.detail, action),
      user: loginReducer(state.user, action),
      loginErrMsg: loginErrMsgReducer(state.loginErrMsg, action),
      languagesErrMsg: languageErrMsgReducer(state.languagesErrMsg, action),
      reposErrMsg: reposErrMsgReducer(state.reposErrMsg, action));
}
