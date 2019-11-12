import 'package:GTA/app/app_state.dart';
import 'package:GTA/pages/detail/detail_reducer.dart';
import 'package:GTA/pages/detail/detail_state.dart';
import 'package:GTA/pages/home/Home_reducer.dart';
import 'package:GTA/pages/home/home_state.dart';
import 'package:GTA/pages/login/login_state.dart';
import 'package:built_redux/built_redux.dart';
import 'package:GTA/app/app_actions.dart';
import 'package:GTA/pages/login/login_reducer.dart';

ReducerBuilder<AppState, AppStateBuilder> appReducer =
    ReducerBuilder<AppState, AppStateBuilder>()
      ..add(AppActionsNames.appIncrease, _appCount)
      ..combineNested<HomeState, HomeStateBuilder>(homeReducer)
      ..combineNested<DetailState, DetailStateBuilder>(detailReducer)
      ..combineNested<LoginState, LoginStateBuilder>(loginReducer);

void _appCount(AppState state, Action<int> action, AppStateBuilder builder) {
  builder.appCount = builder.appCount + action.payload;
}
