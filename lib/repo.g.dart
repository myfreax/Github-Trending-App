// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) {
  return Repo(
      json['name'] as String ?? '',
      json['star'] as String ?? '',
      json['description'] as String ?? '',
      json['fork'] as String ?? '',
      json['language'] as String ?? 'Unknown',
      json['todayStar'] as String ?? '');
}

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
      'name': instance.name,
      'star': instance.star,
      'fork': instance.fork,
      'description': instance.description,
      'language': instance.language,
      'todayStar': instance.todayStar
    };
