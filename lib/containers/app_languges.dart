import 'package:GTA/models/app_state.dart';
import 'package:GTA/presentation/widgets/languages_list.dart';
import 'package:GTA/selectors/selectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:GTA/actions/actions.dart';

class AppLanguages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return LanguagesList(
          languages: vm.languages,
          toggleLanguage: vm.toggleLanguage,
          languagesErrMsg: vm.languagesErrMsg,
        );
      },
    );
  }
}

class _ViewModel {
  final void Function(String) toggleLanguage;
  final List<String> languages;
  final String languagesErrMsg;

  _ViewModel(
      {@required this.languages,
      @required this.toggleLanguage,
      @required this.languagesErrMsg});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        languagesErrMsg: languagesErrMsgSelector(store),
        languages: languagesSelector(store),
        toggleLanguage: (String language) {
          store.dispatch(ToggleLanguageAction(language));
          store.dispatch(LoadReposAction(language: languageSelector(store)));
        });
  }
}
