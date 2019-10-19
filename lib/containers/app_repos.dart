import 'package:GTA/models/models.dart';
import 'package:GTA/presentation/repos_list.dart';
import 'package:GTA/selectors/selectors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_trend/github_trend.dart';
import 'package:redux/redux.dart';

class AppRepos extends StatelessWidget {
  AppRepos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return ReposList(
          repos: vm.repos,
        );
      },
    );
  }
}

class _ViewModel {
  final List<Repo> repos;
  final bool loading;

  _ViewModel({this.repos, this.loading});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        repos: reposSelector(store.state), loading: store.state.isLoading);
  }
}
