// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repos _$ReposFromJson(Map<String, dynamic> json) {
  return Repos(
      json['total_count'] as int,
      (json['items'] as List)
          .map((e) => Repo.fromJson(e as Map<String, dynamic>))
          .toList());
}

Map<String, dynamic> _$ReposToJson(Repos instance) =>
    <String, dynamic>{'items': instance.items, 'total_count': instance.total};
