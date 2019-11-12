import 'package:GTA/pages/detail/detail_state.dart';
import 'package:GTA/pages/home/home_state.dart';
import 'package:GTA/pages/login/login_state.dart';
import 'package:built_value/built_value.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder>{
  
  int get appCount;
  HomeState get homeState;
  DetailState get detailState;
  LoginState get loginState;

  AppState._();
  factory AppState() => _$AppState._(homeState: HomeState(), detailState: DetailState(), loginState: LoginState(),appCount: 0);
}