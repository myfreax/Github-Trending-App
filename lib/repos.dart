import 'package:json_annotation/json_annotation.dart';
import 'repo.dart';
part 'repos.g.dart';

@JsonSerializable(nullable: true)
class Repos {
  @JsonKey(nullable: false)
  List<Repo> items;
  @JsonKey(name: 'total_count')
  int total;
  Repos(this.total,this.items);
  factory Repos.fromJson(Map<String, dynamic> json) => _$ReposFromJson(json);
  Map<String,dynamic> toJson() => _$ReposToJson(this);
}