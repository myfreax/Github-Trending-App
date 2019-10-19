import 'package:github_trend/github_trend.dart';

class LoadLanguagesAction{}

class LanguagesLoadedAction{
  List<String> languages;
  LanguagesLoadedAction(this.languages);
}

class LanguagesNotLoadedAction{
  String errorMsg;
  LanguagesNotLoadedAction(this.errorMsg);
}

class LoadRepoAction{
  String url;
  LoadRepoAction(this.url);
}

class RepoLoadedAction{
  String repo;
  RepoLoadedAction(this.repo);
}

class RepoNotLoadedAction{
  String errorMessage;
  RepoNotLoadedAction(this.errorMessage);
}

class LoadReposAction {
  final Since since;
  final String language;
  
  LoadReposAction({this.language = 'all', this.since =Since.daily});
}

class ReposLoadedAction {
  List<Repo> repos;

  ReposLoadedAction(this.repos);

  @override
  String toString() {
    return 'ReposLoadedAction{todos: $repos}';
  }
}

class ReposNotLoadedAction {
  String error;
  ReposNotLoadedAction(this.error);

  @override
  String toString() {
    return 'ReposNotLoadedAction{error: $error}';
  }
}
