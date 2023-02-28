// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:posts_app/data/posts/repository/posts_repository_impl.dart'
    as _i7;
import 'package:posts_app/data/posts/source/remote/post_data_remote.dart'
    as _i4;
import 'package:posts_app/data/posts/source/remote/post_data_remote_impl.dart'
    as _i5;
import 'package:posts_app/domain/posts/repositories/post_repository.dart'
    as _i6;
import 'package:posts_app/domain/posts/usecases/add_post_use_case.dart' as _i9;
import 'package:posts_app/domain/posts/usecases/get_all_post_use_case.dart'
    as _i10;
import 'package:posts_app/domain/posts/usecases/get_post_use_case.dart' as _i11;
import 'package:posts_app/domain/posts/usecases/update_post_use_case.dart'
    as _i8;
import 'package:posts_app/injectable_module.dart' as _i14;
import 'package:posts_app/presentation/blocs/add_edit_post_bloc/add_edit_post_bloc.dart'
    as _i13;
import 'package:posts_app/presentation/blocs/post_bloc/post_bloc.dart' as _i12;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectableModule = _$InjectableModule();
  gh.lazySingleton<_i3.Dio>(() => injectableModule.dioInstance);
  gh.lazySingleton<_i4.PostDataRemote>(
      () => _i5.PostDataRemoteImpl(gh<_i3.Dio>()));
  gh.lazySingleton<_i6.PostRepository>(
      () => _i7.PostRepositoryImp(gh<_i4.PostDataRemote>()));
  gh.lazySingleton<_i8.UpdatePostUseCase>(
      () => _i8.UpdatePostUseCase(gh<_i6.PostRepository>()));
  gh.lazySingleton<_i9.AddPostUseCase>(
      () => _i9.AddPostUseCase(gh<_i6.PostRepository>()));
  gh.lazySingleton<_i10.GetAllPostsUseCase>(
      () => _i10.GetAllPostsUseCase(gh<_i6.PostRepository>()));
  gh.lazySingleton<_i11.GetPostUseCase>(
      () => _i11.GetPostUseCase(gh<_i6.PostRepository>()));
  gh.lazySingleton<_i12.PostBloc>(
      () => _i12.PostBloc(gh<_i10.GetAllPostsUseCase>()));
  gh.factory<_i13.AddEditPostBloc>(() => _i13.AddEditPostBloc(
        gh<_i9.AddPostUseCase>(),
        gh<_i11.GetPostUseCase>(),
        gh<_i8.UpdatePostUseCase>(),
      ));
  return getIt;
}

class _$InjectableModule extends _i14.InjectableModule {}
