import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:github_trend/github_trend.dart';

part 'query_params_payload.g.dart';

abstract class QueryParamsPayload
    implements Built<QueryParamsPayload, QueryParamsPayloadBuilder> {
  static Serializer<QueryParamsPayload> get serializer =>
      _$queryParamsPayloadSerializer;

  Since get since;
  String get language;
  QueryParamsPayload._();

  factory QueryParamsPayload(Since since, String language) =>
      _$QueryParamsPayload._(since: since, language: language);
}
