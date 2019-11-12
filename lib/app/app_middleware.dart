import 'package:GTA/app/app_actions.dart';
import 'package:GTA/app/app_state.dart';
import 'package:GTA/pages/detail/deetail_middleware.dart';
import 'package:GTA/pages/detail/detail_actions.dart';
import 'package:GTA/pages/detail/detail_state.dart';
import 'package:GTA/pages/home/home_state.dart';
import 'package:GTA/pages/login/login_actions.dart';
import 'package:GTA/pages/login/login_state.dart';
import 'package:built_redux/built_redux.dart';
import 'package:GTA/pages/home/home_middleware.dart';
import 'package:GTA/pages/home/home_actions.dart';
import 'package:GTA/pages/login/login_middleware.dart';

MiddlewareBuilder<AppState, AppStateBuilder, AppActions> appMiddleware =
    MiddlewareBuilder()
      ..combineNested<HomeState, HomeStateBuilder, HomeActions>(homeMiddleware)
      ..combineNested<DetailState, DetailStateBuilder, DetailActions>(
          detailMiddleware)
      ..combineNested<LoginState, LoginStateBuilder, LoginActions>(
          loginMiddleware);
