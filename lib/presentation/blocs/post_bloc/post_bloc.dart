import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:posts_app/domain/posts/entities/post_entity.dart';
import 'package:posts_app/domain/posts/usecases/get_all_post_use_case.dart';
import 'package:salem_package/bloc/base_state.dart';
part 'post_event.dart';

@LazySingleton()
class PostBloc extends Bloc<PostEvent, BaseState<List<PostEntity>>> {
  GetAllPostsUseCase getAllPostsUseCase;
  PostBloc(this.getAllPostsUseCase) : super(const BaseState()) {
    on<PostEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetPostsEvent>((event, emit) async {
      emit(state.setProgress());
      final result = await getAllPostsUseCase.call();
      emit(result.fold((l) => state.setFailure(l), (r) => state.setSuccess(r)));
    });
  }
}
