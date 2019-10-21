import 'package:GTA/actions/actions.dart';
import 'package:GTA/models/models.dart';
import 'package:GTA/presentation/detail_page.dart';
import 'package:GTA/presentation/widgets/repo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_trend/github_trend.dart';
import 'package:redux/redux.dart';

class AppRepo extends StatelessWidget {
  final Repo repo;
  AppRepo({Key key, @required this.repo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return RepoItem(
          toDetail: vm.toDetail,
          repo: repo,
        );
      },
    );
  }
}

class _ViewModel {
  final void Function({@required Repo repo, @required BuildContext context})
      toDetail;
  _ViewModel({@required this.toDetail});
  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        toDetail: ({@required Repo repo, @required BuildContext context}) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => DetailPage(
          onInit: () {
            StoreProvider.of<AppState>(context)
                .dispatch(LoadDetailAction(repo.url));
          },
          title: repo.name,
        ),
      ));
    });
  }
}
