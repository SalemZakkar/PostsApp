import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:posts_app/domain/posts/entities/post_entity.dart';
import 'package:posts_app/domain/posts/repositories/post_repository.dart';
import 'package:salem_package/models/failure.dart';

import '../source/remote/post_data_remote.dart';

@LazySingleton(as: PostRepository)
class PostRepositoryImp implements PostRepository {
  final PostDataRemote remote;
  PostRepositoryImp(this.remote);
  @override
  Future<Either<Failure, Unit>> addPost({required PostEntity entity}) {
    return remote.addPost(postModel: entity.toModel());
  }

  @override
  Future<Either<Failure, PostEntity>> getPost({required int id}) {
    return remote.getPost(id: id);
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getPosts() {
    return remote.getAllPosts();
  }

  @override
  Future<Either<Failure, Unit>> updatePost({required PostEntity entity}) {
    return remote.updatePost(postModel: entity.toModel());
  }
}
