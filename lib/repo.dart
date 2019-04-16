import 'package:json_annotation/json_annotation.dart';
part 'repo.g.dart';

@JsonSerializable(nullable: true)
class Repo {
  @JsonKey(nullable: true, defaultValue: '')
  String name;
  @JsonKey(nullable: true, defaultValue: '')
  String star;
  @JsonKey(nullable: true, defaultValue: '')
  String fork;
  @JsonKey(nullable: true, defaultValue: '')
  String description;
  @JsonKey(nullable: true, defaultValue: 'Unknown')
  String language;
  @JsonKey(nullable: true, defaultValue: '')
  String todayStar;
  Repo(this.name, this.star, this.description, this.fork, this.language,
      this.todayStar);
  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
