import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:posts_app/domain/core/entities/failure.dart';

class BaseRepository {
  Future<Either<Failure, T>> request<T>(var body) async {
    try {
      return right(await body());
    } on DioError catch (e) {
      if (e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.connectionTimeout ||
          e.type == DioErrorType.connectionError ||
          e.error is SocketException) {
        return left(ServerFailure(code: ServerErrorCode.noNetwork));
      } else if (e.response?.statusCode == 403) {
        return left(ServerFailure(code: ServerErrorCode.forbidden));
      } else if (e.response?.statusCode == 404) {
        return left(ServerFailure(code: ServerErrorCode.notFound));
      } else if (e.response?.statusCode == 400) {
        return left(ServerFailure(code: ServerErrorCode.invalidData));
      } else {
        return left(ServerFailure(code: ServerErrorCode.serverError));
      }
    } on SocketException {
      return left(ServerFailure(code: ServerErrorCode.noNetwork));
    }
  }
}
