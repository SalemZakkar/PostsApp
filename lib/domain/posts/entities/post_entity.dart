import 'package:posts_app/data/posts/models/post_model.dart';

class PostEntity {
  final int? id;
  final String? title;
  final String? body;
  final int? userId;

  PostEntity({this.id, this.title, this.body, this.userId});
}

extension ToModel on PostEntity {
  PostModel toModel() {
    return PostModel(id: id, title: title, body: body, userId: userId);
  }
}
