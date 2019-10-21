import 'package:GTA/actions/actions.dart';
import 'package:GTA/middleware/app_middleware.dart';
import 'package:GTA/models/app_state.dart';
import 'package:GTA/reducers/app_state_reducer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

main() {
  group('Save State Middleware', () {
    test('should load the repos in response to a LoadReposAction', () {
      final Store<AppState> store = Store<AppState>(
        appReducer,
        initialState: AppState.loading(),
        middleware: AppMiddleware(),
      );
      store.dispatch(LoadReposAction());
      print(store.state.repos);
    });
  });
}
