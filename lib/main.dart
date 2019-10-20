import 'package:GTA/actions/actions.dart';
import 'package:GTA/middleware/app_middleware.dart';
import 'package:GTA/models/app_state.dart';
import 'package:GTA/reducers/app_state_reducer.dart';
import 'package:GTA/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:GTA/presentation/home_page.dart';
import 'package:GTA/presentation/login_page.dart';
import 'package:GTA/presentation/stars_page.dart';

void main() => runApp(ReduxApp());

class ReduxApp extends StatelessWidget {
  final Store store = Store<AppState>(appReducer,
      initialState: AppState.loading(), middleware: AppMiddleware());
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          initialRoute: '/',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            Routes.home: (context) => HomePage(onInit: () {
                  StoreProvider.of<AppState>(context)
                      .dispatch(LoadReposAction());
                }),
            Routes.login: (context) => LoginPage(),
            Routes.stars: (context) => StarsPage(),
          }),
    );
  }
}
