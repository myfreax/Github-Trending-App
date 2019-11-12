import 'package:GTA/app/app_actions.dart';
import 'package:GTA/app/app_state.dart';
import 'package:GTA/pages/home/home_state.dart';
import 'package:GTA/pages/home/widgets/repos_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

class ReposContainer extends StoreConnector<AppState, AppActions, HomeState> {
  @override
  build(BuildContext context, HomeState state, AppActions actions) {
    return ReposList(
      errorMsg: state.reposLoadError,
      language: state.language,
      repos: state.repos,
      loadding: state.isLoadRepos,
    );
  }

  @override
  HomeState connect(AppState state) {
    return state.homeState;
  }
}
