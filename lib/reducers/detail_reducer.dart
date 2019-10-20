import 'package:GTA/actions/actions.dart';
import 'package:redux/redux.dart';

final detailReducer = combineReducers<String>([
  TypedReducer<String, DetailLoadedAction>(_setDetail),
  TypedReducer<String, DetailNotLoadedAction>(_setNoDetail),
]);

String _setDetail(String detail, DetailLoadedAction action) {
  return action.detail;
}

String _setNoDetail(String detail, DetailNotLoadedAction action) {
  return action.errorMsg;
}
