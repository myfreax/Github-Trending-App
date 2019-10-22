import 'dart:convert';

import 'package:GTA/models/app_state.dart';
import 'package:GTA/models/models.dart';
import 'package:GTA/selectors/selectors.dart';
import 'package:redux/redux.dart';
import 'package:github_trend/github_trend.dart';
import 'package:GTA/actions/actions.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

GithubTrend githubTrend = GithubTrend();

List<Middleware<AppState>> AppMiddleware() {
  return [
    TypedMiddleware<AppState, LoadReposAction>(_loadRepos()),
    TypedMiddleware<AppState, LoadDetailAction>(_loadDetail()),
    TypedMiddleware<AppState, LoginAction>(_login())
  ];
}

Middleware<AppState> _loadRepos() {
  return (Store<AppState> store, action, NextDispatcher next) {
    githubTrend
        .fetchTrending(
            language: languageSelector(store), since: sinceSelector(store))
        .then((Document document) {
      try {
        store.dispatch(ReposLoadedAction(Repos(document).list));
      } catch (e) {
        store.dispatch(ReposNotLoadedAction(e.message));
      }

      if (languagesSelector(store).isEmpty) {
        try {
          store.dispatch(LanguagesLoadedAction(Languages(document).list));
        } catch (e) {
          store.dispatch(LanguagesNotLoadedAction(e.message));
        }
      }
    }).catchError((e) {
      store.dispatch(ReposNotLoadedAction(e.message));
    });
    next(action);
  };
}

Middleware<AppState> _loadDetail() {
  return (Store<AppState> store, action, NextDispatcher next) {
    http.get(action.url).then((http.Response res) {
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
            img.attributes['src'] =
                'https://github.com' + img.attributes['src'];
          }
        });
        store.dispatch(DetailLoadedAction(document.outerHtml));
      } else {
        store.dispatch(DetailNotLoadedAction('Parse DOM Fail'));
      }
    }).catchError(
        (error) => store.dispatch(DetailNotLoadedAction(error.message)));
    next(action);
  };
}

Middleware<AppState> _login() {
  return (Store<AppState> store, action, NextDispatcher next) {
    Map<String, String> headers = {};
    String userAndPass = base64Encode(
        utf8.encode('${action.user['username']}:${action.user['password']}'));
    headers.putIfAbsent("Authorization", () => "basic $userAndPass");
    http
        .get('https://api.github.com/user', headers: headers)
        .then((http.Response res) {
      if (res.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(res.body);
        map['password'] = action.user['password'];
        store.dispatch(LoginedAction(User.fromJson(map)));
      } else {
        store.dispatch(LoginFailAction(res.statusCode.toString()));
      }
    }).catchError((e) {
      store.dispatch(LoginFailAction(e.message));
    });
    next(action);
  };
}
