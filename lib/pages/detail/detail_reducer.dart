import 'package:GTA/app/app_state.dart';
import 'package:GTA/pages/detail/detail_actions.dart';
import 'package:GTA/pages/detail/detail_state.dart';
import 'package:built_redux/built_redux.dart';

NestedReducerBuilder<AppState, AppStateBuilder, DetailState, DetailStateBuilder>
    detailReducer = NestedReducerBuilder<AppState, AppStateBuilder, DetailState,
            DetailStateBuilder>((AppState state) => state.detailState,
        (AppStateBuilder builder) => builder.detailState)
      ..add(DetailActionsNames.detailLoadedAction, _detailLoadedAction)
      ..add(DetailActionsNames.loadDetail, _loadDetail);

void _detailLoadedAction(
    DetailState state, Action<String> action, DetailStateBuilder builder) {
  builder.html = action.payload;
  builder.isLoading = false;
}

void _loadDetail(DetailState state, Action<String> action, DetailStateBuilder builder){
  builder.isLoading = true;
}