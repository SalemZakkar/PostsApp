import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:posts_app/domain/posts/entities/post_entity.dart';
import 'package:posts_app/domain/posts/repositories/post_repository.dart';
import 'package:salem_package/models/failure.dart';

@LazySingleton()
class AddPostUseCase {
  final PostRepository repository;
  AddPostUseCase(this.repository);
  Future<Either<Failure, Unit>> call(PostEntity entity) async {
    return await repository.addPost(entity: entity);
  }
}
