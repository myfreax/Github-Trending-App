import 'package:GTA/app/app_actions.dart';
import 'package:GTA/app/app_state.dart';
import 'package:GTA/pages/home/widgets/drawer.dart';
import 'package:GTA/pages/login/login_state.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

class DrawerContainer extends StoreConnector<AppState, AppActions, LoginState> {
  @override
  Widget build(BuildContext context, LoginState state, AppActions actions) {
    return AppDrawer(state.user.name);
  }

  @override
  LoginState connect(AppState state) {
    return state.loginState;
  }
}
