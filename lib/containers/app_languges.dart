import 'package:GTA/models/app_state.dart';
import 'package:GTA/presentation/languages_list.dart';
import 'package:GTA/selectors/selectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AppLanguages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return LanguagesList(
          languages: vm.languages,
        );
      },
    );
  }
}

class _ViewModel {
  final List<String> languages;
  final bool loading;
  _ViewModel({this.loading, this.languages});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        languages: languagesSelector(store.state),
        loading: isLoadingSelector(store.state));
  }
}
