import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:github_trend/github_trend.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  int get homeCount;
  String get languageLoadError;
  String get reposLoadError;
  String get language;
  Since get since;
  bool get isLoadRepos;
  BuiltList<Repo> get repos;
  BuiltList<String> get languages;
  HomeState._();
  factory HomeState() => _$HomeState._(
      reposLoadError: '',
      languageLoadError:'',
      isLoadRepos: true,
      homeCount: 0,
      language: 'all',
      since: Since.daily,
      repos: BuiltList<Repo>(),
      languages: BuiltList<String>());
}
