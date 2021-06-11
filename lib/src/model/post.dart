import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

/// Post model
@JsonSerializable()
class Post {
  Post({this.id, this.text, this.creationDate});
  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  final int? id;
  final String? text;
  @JsonKey(name: 'creation-date')
  String? creationDate;

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
