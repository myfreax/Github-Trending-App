import 'package:GTA/pages/detail/detail_actions.dart';
import 'package:GTA/pages/home/home_actions.dart';
import 'package:GTA/pages/login/login_actions.dart';
import 'package:built_redux/built_redux.dart';

part 'app_actions.g.dart';

abstract class AppActions extends ReduxActions{
  DetailActions get detailActions;
  HomeActions get homeActions;
  LoginActions get loginActions;
  ActionDispatcher<Null> get appActions;
  ActionDispatcher<int> get appIncrease;
  AppActions._();
  factory AppActions() => _$AppActions();
}
