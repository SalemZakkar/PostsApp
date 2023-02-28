import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:posts_app/domain/posts/entities/post_entity.dart';
import 'package:posts_app/presentation/core/routes/app_router.gr.dart';

class PostCard extends StatefulWidget {
  final PostEntity entity;
  const PostCard({Key? key, required this.entity}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            context.router.push(EditPostsRoute(id: widget.entity.id!));
          },
          title: Text(widget.entity.title!),
          subtitle: Text(widget.entity.body!),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 0.3,
          color: Theme.of(context).dividerColor,
        )
      ],
    );
  }
}
