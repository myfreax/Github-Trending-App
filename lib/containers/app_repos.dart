import 'package:GTA/models/app_state.dart';
import 'package:GTA/presentation/widgets/repos_list.dart';
import 'package:GTA/selectors/selectors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:github_trend/github_trend.dart';
import 'package:redux/redux.dart';

class AppRepos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 这里将store转换成_ViewModel的原因是我们需要传递toggleRepo方法到RepoItem
    return StoreConnector<AppState, _ViewModel>(
      // 这里的转换器要求传递_ViewModel Function(Store<AppState>)方法
      // 所以我们必须要定义一个函数返回，这个函数必须返回_ViewModel，转换器执行的我们定义的函数，并传递store该该函数
      converter: _ViewModel.formStore,
      builder: (context, vm) {
        return ReposList(
          repos: vm.repos,
          language: vm.language,
          errorMsg: vm.errorMsg,
          loadding: vm.loadding,
        );
      },
    );
  }
}

// 该类设置为私有不允许在其它地方实例化
class _ViewModel {
  final String errorMsg;
  final bool loadding;
  final List<Repo> repos;
  final String language;

  _ViewModel(
      {@required this.repos,
      @required this.loadding,
      @required this.errorMsg,
      @required this.language});

  static _ViewModel formStore(Store<AppState> store) {
    return _ViewModel(
        errorMsg: reposErrMsgSelector(store),
        language: languageSelector(store),
        loadding: loadingSelector(store),
        repos: reposSelector(store));
  }
}
