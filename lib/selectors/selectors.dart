import 'package:github_trend/github_trend.dart';
import 'package:GTA/models/models.dart';

List<Repo> reposSelector(AppState state) => state.repos;

bool isLoadingSelector(AppState state) => state.isLoading;

String languageSelector(AppState state) => state.language;

List<String> languagesSelector(AppState state) => state.languages;

Since sinceSelector(AppState state) => state.since;