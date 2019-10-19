import 'package:GTA/models/app_state.dart';
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
    TypedMiddleware<AppState, LoadRepoAction>(_loadRepo()),
    TypedMiddleware<AppState, LoadLanguagesAction>(_loadLanguages())
  ];
}

Middleware<AppState> _loadLanguages() {
  return (Store<AppState> store, action, NextDispatcher next) {
    githubTrend.fetchTrending().then((document) {
      try {
        store.dispatch(LanguagesLoadedAction(Languages(document).list));
      } catch (e) {
        store.dispatch(LanguagesNotLoadedAction(e.message));
      }
    }).catchError((e) {
      store.dispatch(LanguagesNotLoadedAction(e.message));
    });
    next(action);
  };
}

Middleware<AppState> _loadRepos() {
  return (Store<AppState> store, action, NextDispatcher next) {
    githubTrend.fetchTrending().then((document) {

      try {
        store.dispatch(ReposLoadedAction(Repos(document).list));
      } catch (e) {
        store.dispatch(ReposNotLoadedAction(e.message));
      }
      
      try {
        store.dispatch(LanguagesLoadedAction(Languages(document).list));
      } catch (e) {
        store.dispatch(LanguagesNotLoadedAction(e.message));
      }
    }).catchError((e) {
      store.dispatch(ReposNotLoadedAction(e.message));
    });
    next(action);
  };
}

Middleware<AppState> _loadRepo() {
  return (Store<AppState> store, action, NextDispatcher next) {
    http.get(action.url).then((res) {
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
        store.dispatch(RepoLoadedAction(document.outerHtml));
      } else {
        store.dispatch(RepoNotLoadedAction('Parse DOM Fail'));
      }
    }).catchError(
        (error) => store.dispatch(RepoNotLoadedAction(error.message)));
    next(action);
  };
}
