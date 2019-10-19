import 'package:GTA/actions/actions.dart';
import 'package:GTA/middleware/app_middleware.dart';
import 'package:GTA/models/app_state.dart';
import 'package:GTA/reducers/app_state_reducer.dart';
import 'package:GTA/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:GTA/presentation/detail_view.dart';
import 'package:GTA/presentation/home_view.dart';
import 'package:GTA/presentation/login_view.dart';
import 'package:GTA/presentation/stars_view.dart';

void main() => runApp(ReduxApp());

class ReduxApp extends StatelessWidget {
  final Store store = Store<AppState>(appReducer,
      initialState: AppState.loading(),
      middleware: AppMiddleware());
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
            Routes.home: (context) => HomeView(onInit: () {
                  StoreProvider.of<AppState>(context)
                      .dispatch(LoadReposAction());
                  // StoreProvider.of<AppState>(context)
                  //     .dispatch(LoadLanguagesAction());    
                }),
            Routes.detail: (context) => DetailView(onInit: (){
              StoreProvider.of<AppState>(context).dispatch(LoadRepoAction('https://github.com/alibaba/fish-redux'));
            },),
            Routes.login: (context) => LoginView(),
            Routes.stars: (context) => StarsView(),
          }),
    );
  }
}
