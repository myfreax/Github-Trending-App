import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()

class User {
  final String name;
  final String email;
  final int id;
  final String nodeId;
  final String avatar_url;
  final String url;
  final String starred_url;
  final String password;

  User(this.name, this.email, this.avatar_url, this.id, this.nodeId,
      this.starred_url, this.url, this.password);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);


}
