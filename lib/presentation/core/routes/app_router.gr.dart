// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../posts/pages/add_posts.dart' as _i3;
import '../../posts/pages/edit_posts_page.dart' as _i2;
import '../../posts/pages/posts.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    PostsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.PostsPage(),
      );
    },
    EditPostsRoute.name: (routeData) {
      final args = routeData.argsAs<EditPostsRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.EditPostsPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    AddPostRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AddPostPage(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/posts',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          PostsRoute.name,
          path: '/posts',
        ),
        _i4.RouteConfig(
          EditPostsRoute.name,
          path: '/edit_post',
        ),
        _i4.RouteConfig(
          AddPostRoute.name,
          path: '/add_post',
        ),
      ];
}

/// generated route for
/// [_i1.PostsPage]
class PostsRoute extends _i4.PageRouteInfo<void> {
  const PostsRoute()
      : super(
          PostsRoute.name,
          path: '/posts',
        );

  static const String name = 'PostsRoute';
}

/// generated route for
/// [_i2.EditPostsPage]
class EditPostsRoute extends _i4.PageRouteInfo<EditPostsRouteArgs> {
  EditPostsRoute({
    _i5.Key? key,
    required int id,
  }) : super(
          EditPostsRoute.name,
          path: '/edit_post',
          args: EditPostsRouteArgs(
            key: key,
            id: id,
          ),
        );

  static const String name = 'EditPostsRoute';
}

class EditPostsRouteArgs {
  const EditPostsRouteArgs({
    this.key,
    required this.id,
  });

  final _i5.Key? key;

  final int id;

  @override
  String toString() {
    return 'EditPostsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.AddPostPage]
class AddPostRoute extends _i4.PageRouteInfo<void> {
  const AddPostRoute()
      : super(
          AddPostRoute.name,
          path: '/add_post',
        );

  static const String name = 'AddPostRoute';
}
