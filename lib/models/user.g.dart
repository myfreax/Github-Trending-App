// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['name'] as String,
      json['email'] as String,
      json['avatar_url'] as String,
      json['id'] as int,
      json['nodeId'] as String,
      json['starred_url'] as String,
      json['url'] as String,
      json['password'] as String);
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'id': instance.id,
      'nodeId': instance.nodeId,
      'avatar_url': instance.avatar_url,
      'url': instance.url,
      'starred_url': instance.starred_url,
      'password': instance.password
    };
