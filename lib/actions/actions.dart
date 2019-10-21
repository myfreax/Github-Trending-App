import 'package:github_trend/github_trend.dart';

class LoginAction {
  final Map<String, String> user;
  LoginAction(this.user);
}

class LoginedAction {
  final Map<String, String> user;
  LoginedAction(this.user);
}

class LoginFailAction {
  final String loginErrMsg;
  LoginFailAction(this.loginErrMsg);
}

class ToggleLanguageAction {
  final String language;
  ToggleLanguageAction(this.language);
}

class LoadLanguagesAction {}

class LanguagesLoadedAction {
  final List<String> languages;
  LanguagesLoadedAction(this.languages);
}

class LanguagesNotLoadedAction {
  final String languagesErrMsg;
  LanguagesNotLoadedAction(this.languagesErrMsg);
}

class LoadDetailAction {
  final String url;
  LoadDetailAction(this.url);
}

class DetailLoadedAction {
  final String detail;
  DetailLoadedAction(this.detail);
}

class DetailNotLoadedAction {
  final String errorMsg;
  DetailNotLoadedAction(this.errorMsg);
}

class LoadReposAction {
  final Since since;
  final String language;

  LoadReposAction({this.language = 'all', this.since = Since.daily});
}

class ReposLoadedAction {
  final List<Repo> repos;

  ReposLoadedAction(this.repos);
}

class ReposNotLoadedAction {
  final String reposErrMsg;
  ReposNotLoadedAction(this.reposErrMsg);
}
