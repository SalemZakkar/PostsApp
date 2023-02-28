part of 'add_edit_post_bloc.dart';

abstract class AddEditPostEvent extends Equatable {
  const AddEditPostEvent();
}

class AddPostEvent extends AddEditPostEvent {
  final PostEntity entity;
  const AddPostEvent({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class GetPostEvent extends AddEditPostEvent {
  final int id;
  const GetPostEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

class UpdatePostEvent extends AddEditPostEvent {
  final PostEntity entity;
  const UpdatePostEvent({required this.entity});

  @override
  // TODO: implement props
  List<Object?> get props => [entity];
}
