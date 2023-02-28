import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/domain/posts/entities/post_entity.dart';
import 'package:posts_app/presentation/blocs/post_bloc/post_bloc.dart';
import 'package:posts_app/presentation/core/routes/app_router.gr.dart';
import 'package:posts_app/presentation/core/utils/base_state.dart';
import 'package:posts_app/presentation/core/widgets/error/error.dart';
import 'package:posts_app/presentation/core/widgets/loading.dart';
import 'package:posts_app/presentation/posts/widgets/post_card.dart';

import '../../../injection.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  PostBloc postBloc = getIt<PostBloc>()..add(GetPostsEvent());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
      ),
      body: BlocBuilder<PostBloc, BaseState<List<PostEntity>>>(
        builder: (context, state) {
          if (state.progress) {
            return const LoadingWidget();
          } else if (state.fail) {
            return DisplayErrorWidget(
              failure: state.failure!,
              retry: () {
                postBloc.add(GetPostsEvent());
              },
            );
          } else {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: state.item?.length ?? 0,
                itemBuilder: (context, index) {
                  return PostCard(
                    entity: state.item![index],
                  );
                },
              ),
            );
          }
        },
        bloc: postBloc,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const AddPostRoute());
        },
        backgroundColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.add),
      ),
    );
  }
}
