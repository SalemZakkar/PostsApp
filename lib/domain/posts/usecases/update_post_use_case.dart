import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:posts_app/domain/posts/entities/post_entity.dart';

import '../../core/entities/failure.dart';
import '../repositories/post_repository.dart';

@LazySingleton()
class UpdatePostUseCase {
  final PostRepository repository;
  UpdatePostUseCase(this.repository);
  Future<Either<Failure, Unit>> call(PostEntity entity) async {
    return await repository.updatePost(entity: entity);
  }
}
