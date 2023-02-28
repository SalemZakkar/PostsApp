import 'package:dartz/dartz.dart';
import 'package:posts_app/domain/core/entities/failure.dart';
import 'package:posts_app/domain/posts/entities/post_entity.dart';

abstract class PostRepository {
  Future<Either<Failure, List<PostEntity>>> getPosts();
  Future<Either<Failure, PostEntity>> getPost({required int id});
  Future<Either<Failure, Unit>> addPost({required PostEntity entity});
  Future<Either<Failure, Unit>> updatePost({required PostEntity entity});
}
