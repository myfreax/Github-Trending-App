import 'package:github_trend/github_trend.dart';

class ToggleRepoAction {
  Repo repo;
  ToggleRepoAction(this.repo);
}

class ToggleLanguageAction {
  String language;
  ToggleLanguageAction(this.language);
}

class LoadLanguagesAction {}

class LanguagesLoadedAction {
  List<String> languages;
  LanguagesLoadedAction(this.languages);
}

class LanguagesNotLoadedAction {
  String languagesErrMsg;
  LanguagesNotLoadedAction(this.languagesErrMsg);
}

class LoadDetailAction {
  String url;
  LoadDetailAction(this.url);
}

class DetailLoadedAction {
  String detail;
  DetailLoadedAction(this.detail);
}

class DetailNotLoadedAction {
  String errorMsg;
  DetailNotLoadedAction(this.errorMsg);
}

class LoadReposAction {
  final Since since;
  final String language;

  LoadReposAction({this.language = 'all', this.since = Since.daily});
}

class ReposLoadedAction {
  List<Repo> repos;

  ReposLoadedAction(this.repos);
}

class ReposNotLoadedAction {
  String reposErrMsg;
  ReposNotLoadedAction(this.reposErrMsg);
}
