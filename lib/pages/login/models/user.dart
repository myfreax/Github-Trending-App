import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'user.g.dart';

abstract class UserBuilder implements Builder<User, UserBuilder> {
  String name = '';
  String email = '';
  int id = 0;
  String nodeId = '';
  String avatarUrl = '';
  String url = '';
  String starredUrl = '';
  String password = '';

  UserBuilder._();

  factory UserBuilder() = _$UserBuilder;
}

abstract class User implements Built<User, UserBuilder> {
  static Serializer<User> get serializer => _$userSerializer;

  String get name;

  @nullable
  String get email;

  @nullable
  int get id;

  @nullable
  @BuiltValueField(wireName: 'node_id')
  String get nodeId;

  @nullable
  @BuiltValueField(wireName: 'avatar_url')
  String get avatarUrl;

  @nullable
  String get url;

  @nullable
  @BuiltValueField(wireName: 'starred_url')
  String get starredUrl;

  @nullable
  String get password;

  User._();

  factory User([void Function(UserBuilder) updates]) = _$User;
}
