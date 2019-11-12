import 'package:built_redux/built_redux.dart';

part 'detail_actions.g.dart';

abstract class DetailActions implements ReduxActions{
  DetailActions._();
  factory DetailActions() => _$DetailActions();
  ActionDispatcher<String> loadDetail; 
  ActionDispatcher<String> detailLoadedAction;
}