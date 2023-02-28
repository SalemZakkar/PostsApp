import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:posts_app/domain/posts/entities/post_entity.dart';
import 'package:posts_app/domain/posts/usecases/get_post_use_case.dart';
import 'package:posts_app/presentation/core/utils/base_state.dart';
import 'package:posts_app/domain/posts/usecases/update_post_use_case.dart';

import '../../../domain/posts/usecases/add_post_use_case.dart';
import '../../../injection.dart';
import '../post_bloc/post_bloc.dart';
part 'add_edit_post_event.dart';

@Injectable()
class AddEditPostBloc extends Bloc<AddEditPostEvent, BaseState> {
  AddPostUseCase addPostUseCase;
  GetPostUseCase getPostUseCase;
  UpdatePostUseCase updatePostUseCase;
  AddEditPostBloc(
      this.addPostUseCase, this.getPostUseCase, this.updatePostUseCase)
      : super(const BaseState()) {
    on<AddEditPostEvent>((event, emit) {});
    on<AddPostEvent>((event, emit) async {
      emit(state.setProgress());
      var res = await addPostUseCase.call(event.entity);

      emit(res.fold((l) => state.setFailure(l), (r) => state.setSuccess(r)));
      if (state.success) {
        getIt<PostBloc>().add(GetPostsEvent());
      }
    });
    on<GetPostEvent>((event, emit) async {
      emit(state.setProgress());
      var res = await getPostUseCase.call(event.id);
      emit(res.fold((l) => state.setFailure(l), (r) => state.setSuccess(r)));
    });
    on<UpdatePostEvent>((event, emit) async {
      emit(state.setProgress());
      var res = await updatePostUseCase.call(event.entity);
      emit(res.fold((l) => state.setFailure(l), (r) => state.setSuccess(r)));
      if (state.success) {
        getIt<PostBloc>().add(GetPostsEvent());
      }
    });
  }
}
