import 'package:dartz/dartz.dart';
import 'package:posts_app/data/posts/models/post_model.dart';
import 'package:salem_package/models/failure.dart';

abstract class PostDataRemote {
  Future<Either<Failure, List<PostModel>>> getAllPosts();
  Future<Either<Failure, PostModel>> getPost({required int id});
  Future<Either<Failure, Unit>> addPost({required PostModel postModel});
  Future<Either<Failure, Unit>> updatePost({required PostModel postModel});
}
