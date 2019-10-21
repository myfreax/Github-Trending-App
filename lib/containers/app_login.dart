import 'package:GTA/actions/actions.dart';
import 'package:GTA/models/app_state.dart';
import 'package:GTA/presentation/widgets/login_form.dart';
import 'package:GTA/selectors/selectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class AppLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return LoginForm(
          loading: vm.loading,
          loginErrMsg: vm.loginErrMsg,
          login: vm.login,
        );
      },
    );
  }
}

class _ViewModel {
  final String loginErrMsg;
  final bool loading;
  final void Function({@required String username, @required String password})
      login;
  _ViewModel(
      {@required this.login,
      @required this.loading,
      @required this.loginErrMsg});
  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        loginErrMsg: loginErrMsgSelector(store),
        loading: loadingSelector(store),
        login: ({@required String username, @required String password}) {
          store.dispatch(LoginAction({username: username, password: password}));
        });
  }
}
