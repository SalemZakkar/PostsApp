import 'package:auto_route/annotations.dart';
import 'package:posts_app/presentation/posts/pages/add_posts.dart';
import 'package:posts_app/presentation/posts/pages/edit_posts_page.dart';
import 'package:posts_app/presentation/posts/pages/posts.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(path: "/posts", initial: true, page: PostsPage),
  AutoRoute(path: "/edit_post", page: EditPostsPage),
  AutoRoute(path: "/add_post", page: AddPostPage),
], replaceInRouteName: 'Page,Route')
class $AppRouter {}
