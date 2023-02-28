import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:posts_app/data/core/contants/endpoints.dart';
import 'package:posts_app/data/core/models/base_repository.dart';
import 'package:posts_app/data/posts/models/post_model.dart';
import 'package:posts_app/data/posts/source/remote/post_data_remote.dart';
import 'package:posts_app/domain/core/entities/failure.dart';

@LazySingleton(as: PostDataRemote)
class PostDataRemoteImpl extends BaseRepository implements PostDataRemote {
  final Dio dio;
  PostDataRemoteImpl(this.dio);
  @override
  Future<Either<Failure, Unit>> addPost({required PostModel postModel}) async {
    Either<Failure, Unit> res = await request<Unit>(() async {
      await dio.post(EndPoints.posts, data: postModel.toJson());
      return unit;
    });
    return res;
  }

  @override
  Future<Either<Failure, List<PostModel>>> getAllPosts() async {
    return request(() async {
      Response response = await dio.get(EndPoints.posts);
      if (response.statusCode == 200) {
        List data = response.data;

        List<PostModel> res = [];
        for (var i in data) {
          res.add(PostModel.fromJson(i));
        }
        return res;
      }
    });
  }

  @override
  Future<Either<Failure, PostModel>> getPost({required int id}) async {
    Either<Failure, PostModel> res = await request<PostModel>(() async {
      Response response = await dio.get("${EndPoints.posts}/$id");
      PostModel data = PostModel.fromJson(response.data);
      return data;
    });
    return res;
  }

  @override
  Future<Either<Failure, Unit>> updatePost(
      {required PostModel postModel}) async {
    return await request(() async {
      await dio.put("${EndPoints.posts}/${postModel.id}",
          data: postModel.toJson());
      return unit;
    });
  }
}
