import 'package:GTA/app/app_actions.dart';
import 'package:GTA/app/app_state.dart';
import 'package:built_redux/built_redux.dart';
import 'package:GTA/app/app_reducers.dart';
import 'package:GTA/app/app_middleware.dart';
import 'package:flutter/material.dart';
import 'package:GTA/pages/home/models/query_params_payload.dart';
import 'package:GTA/pages/login/login_page.dart';
import 'package:GTA/pages/home/home_page.dart';
import 'package:GTA/routes.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:github_trend/github_trend.dart';

void main() {
  Store<AppState, AppStateBuilder, AppActions> store = Store(
      appReducer.build(), AppState(), AppActions(),
      middleware: [appMiddleware.build()]);
  runApp(ReduxApp(store));
}

class ReduxApp extends StatelessWidget {
  final Store<AppState, AppStateBuilder, AppActions> store;

  ReduxApp(this.store);

  @override
  Widget build(BuildContext context) {
    return ReduxProvider(
      store: store,
      child: MaterialApp(
        initialRoute: Routes.home,
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: {
          Routes.login: (context) => LoginPage(),
          Routes.home: (context) => HomePage(onInit: () {
                store.actions.homeActions
                    .loadRepos(QueryParamsPayload(Since.daily, 'all'));
              }),
        },
      ),
    );
  }
}
