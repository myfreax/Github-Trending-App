import 'package:GTA/actions/actions.dart';
import 'package:GTA/models/models.dart';
import 'package:GTA/presentation/widgets/reflesh_button.dart';
import 'package:GTA/selectors/selectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ReFleshRepos extends StatelessWidget {
  ReFleshRepos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return RefleshButton(
          reflesh: vm.reflesh,
        );
      },
    );
  }
}

class _ViewModel {
  final void Function() reflesh;

  _ViewModel({@required this.reflesh});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(reflesh: () {
      store.dispatch(LoadReposAction(
          language: languageSelector(store), since: sinceSelector(store)));
    });
  }
}
