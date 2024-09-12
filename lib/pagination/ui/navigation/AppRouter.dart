import 'package:flutter/material.dart';
import 'package:ready_pagination/pagination/ui/view/page_screen.dart';
import 'package:ready_pagination/pagination/ui/view/post_detail_screen.dart';

import '../../data/model/post.dart';
import '../view/post_new_menu.dart';

class AppRouter {
  static const String postsOverview = '/';
  static const String postDetail = '/postDetail';
  static const String postNewMenu = '/postNewMenu';

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case postsOverview:
        return MaterialPageRoute(builder: (_) => const PostsOverviewScreen());
      case postDetail:
        final post = settings.arguments as Post;
        return MaterialPageRoute(
          builder: (_) => PostDetailScreen(post: post),
        );
      case postNewMenu:
        return MaterialPageRoute(builder: (_) => const PostNewMenuScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }
}
