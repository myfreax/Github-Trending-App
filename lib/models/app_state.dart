import 'package:meta/meta.dart';
import 'package:github_trend/github_trend.dart';

/// Define and collect the status of the app
///
/// This is the first step in writing a Redux App.
/// Must be decorated with immutable decorator App state
@immutable
class AppState {
  /// Load the status of the repositories list
  final bool isLoading;

  /// epositories list
  final List<Repo> repos;

  final List<String> languages;

  final Since since;

  final String language;

  final String detail;

  final Repo repo;

  final String reposErrMsg;

  final String languagesErrMsg;

  AppState(
      {this.isLoading = false,
      this.repos = const [],
      this.detail = '',
      this.language = 'all',
      this.languages = const [],
      this.since = Since.daily,
      this.reposErrMsg = '',
      this.languagesErrMsg = '',
      this.repo = null});

  factory AppState.loading() => AppState(isLoading: true);

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, repos: $repos}';
  }
}