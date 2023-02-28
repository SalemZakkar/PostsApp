import 'package:posts_app/domain/posts/entities/post_entity.dart';

/// id : 1
/// title : "..."
/// body : "..."
/// userId : 1

class PostModel extends PostEntity {
  PostModel(
      {required super.id,
      required super.title,
      required super.body,
      required super.userId});
  factory PostModel.fromJson(var json) {
    return PostModel(
        id: json['id'],
        title: json['title'],
        body: json['body'],
        userId: json['userId']);
  }
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
      };
}
