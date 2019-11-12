import 'package:GTA/app/app_actions.dart';
import 'package:GTA/app/app_state.dart';
import 'package:GTA/pages/home/home_state.dart';
import 'package:GTA/pages/home/models/query_params_payload.dart';
import 'package:GTA/pages/home/widgets/languages_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:github_trend/github_trend.dart';

class LangugesContainer extends StoreConnector<AppState, AppActions, HomeState>{
  @override
  Widget build(BuildContext context, HomeState state, AppActions actions) {
    return LanguagesList(languages: state.languages,languagesErrMsg: state.languageLoadError,toggleLanguage: (String language){
      actions.homeActions.loadRepos(QueryParamsPayload(Since.daily, language));
    },);
  }

  @override
  HomeState connect(AppState state) {
    return state.homeState;
  }
}