import 'package:json_annotation/json_annotation.dart';
part 'repo.g.dart';

@JsonSerializable(nullable: true)
class Repo {
  @JsonKey(nullable: true,defaultValue: '')
  String name;
  @JsonKey(name:'stargazers_count',nullable: true,defaultValue: 0)
  int stars;
  @JsonKey(nullable: true,defaultValue: 0)
  int forks;
  @JsonKey(nullable: true,defaultValue: '')
  String description;
  @JsonKey(nullable: true,defaultValue: 'Unknown')
  String language;
  @JsonKey(nullable: true,defaultValue: 0)
  int todayStars = 0;
  Repo(this.name, this.stars, this.description, this.forks, this.language,
      this.todayStars);
  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}
