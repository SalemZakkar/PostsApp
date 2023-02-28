import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:posts_app/domain/posts/entities/post_entity.dart';

import '../../core/entities/failure.dart';
import '../repositories/post_repository.dart';

@LazySingleton()
class GetAllPostsUseCase {
  final PostRepository repository;
  GetAllPostsUseCase(this.repository);
  Future<Either<Failure, List<PostEntity>>> call() async {
    return await repository.getPosts();
  }
}
