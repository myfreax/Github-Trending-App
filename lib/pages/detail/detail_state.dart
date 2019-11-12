import 'package:built_value/built_value.dart';

part 'detail_state.g.dart';

abstract class DetailState implements Built<DetailState, DetailStateBuilder>{
  @nullable
  String get html;
  bool get isLoading;

  DetailState._();
  factory DetailState() => _$DetailState._(isLoading: true);
}