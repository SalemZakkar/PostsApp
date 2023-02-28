import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../core/entities/failure.dart';
import '../entities/post_entity.dart';
import '../repositories/post_repository.dart';

@LazySingleton()
class GetPostUseCase {
  final PostRepository repository;
  GetPostUseCase(this.repository);
  Future<Either<Failure, PostEntity>> call(int id) async {
    return await repository.getPost(id: id);
  }
}
