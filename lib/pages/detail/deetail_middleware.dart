import 'package:GTA/app/app_actions.dart';
import 'package:GTA/app/app_state.dart';
import 'package:GTA/pages/detail/detail_actions.dart';
import 'package:GTA/pages/detail/detail_state.dart';
import 'package:built_redux/built_redux.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

NestedMiddlewareBuilder<AppState, AppStateBuilder, AppActions, DetailState,
        DetailStateBuilder, DetailActions>
    detailMiddleware = NestedMiddlewareBuilder(
        (AppState state) => state.detailState,
        (AppActions actions) => actions.detailActions)
      ..add(DetailActionsNames.loadDetail, _loadDetail);

void _loadDetail(
    MiddlewareApi<DetailState, DetailStateBuilder, DetailActions> api,
    ActionHandler next,
    Action action) {
  http.get(action.payload).then((http.Response res) {
    Document document = parse(res.body);
    if (document.querySelector('#readme') != null) {
      document.body.classes
          .forEach((classname) => document.body.classes.remove(classname));
      document.body.innerHtml =
          document.querySelector('#readme article').outerHtml;
      RegExp exp = new RegExp(r"^http|^//");
      document.querySelectorAll('body img').forEach((img) {
        String src = img.attributes['src'];
        if (src != null && !exp.hasMatch(src)) {
          img.attributes['src'] = 'https://github.com' + img.attributes['src'];
        }
      });
      api.actions.detailLoadedAction(document.outerHtml);
    } else {
      api.actions.detailLoadedAction('Parse DOM Fail');
    }
  }).catchError((error) => api.actions.detailLoadedAction(error.message));
  next(action);
}
