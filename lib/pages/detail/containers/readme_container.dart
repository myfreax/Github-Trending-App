import 'package:GTA/app/app_actions.dart';
import 'package:GTA/app/app_state.dart';
import 'package:GTA/pages/detail/detail_state.dart';
import 'package:GTA/pages/detail/widgets/readme.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';

class ReadmeContainer
    extends StoreConnector<AppState, AppActions, DetailState> {
  @override
  Widget build(BuildContext context, DetailState state, AppActions actions) {
    return Readme(html: state.html, loading: state.isLoading);
  }

  @override
  DetailState connect(AppState state) {
    return state.detailState;
  }
}