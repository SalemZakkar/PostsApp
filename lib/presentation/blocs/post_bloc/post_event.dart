part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class GetPostsEvent extends PostEvent {
  @override
  List<Object?> get props => [];
}
