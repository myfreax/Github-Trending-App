import 'package:GTA/app/app_actions.dart';
import 'package:GTA/app/app_state.dart';
import 'package:GTA/pages/detail/detail_page.dart';
import 'package:GTA/pages/home/widgets/repo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:github_trend/github_trend.dart';

class RepoContainer extends StoreConnector<AppState, AppActions, Null> {
  final Repo repo;
  RepoContainer(this.repo);

  @override
  build(BuildContext context, AppState state, AppActions actions) {
    return RepoItem(
      repo: repo,
      toDetail: ({@required Repo repo, @required BuildContext context}) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => DetailPage(
            onInit: () {
              actions.detailActions.loadDetail(repo.url);
            },
            title: repo.name,
          ),
        ));
      },
    );
  }

  @override
  connect(state) {}
}