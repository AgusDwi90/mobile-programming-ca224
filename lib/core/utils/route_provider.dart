import 'package:flutter/material.dart';
import 'package:myapp/views/comment/pages/comment_entry_page.dart';
import 'package:myapp/views/comment/pages/comment_page.dart';
import 'package:myapp/views/common/pages/main_page.dart';
import 'package:myapp/views/moment/pages/moment_entry_page.dart';
import 'package:myapp/views/moment/pages/moment_page.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainPage.routeName:
        return MaterialPageRoute(builder: (_) => const MainPage());

      case MomentPage.routeName:
        return MaterialPageRoute(builder: (_) => const MomentPage());

      case MomentEntryPage.routeName:
        final momentId = settings.arguments as String?;
        return MaterialPageRoute(
            builder: (_) => MomentEntryPage(momentId: momentId));

      case CommentPage.routeName:
        final momentId = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => CommentPage(momentId: momentId));

      case CommentEntryPage.routeName:
        final commentId = settings.arguments as String?;
        return MaterialPageRoute(
            builder: (_) => CommentEntryPage(commentId: commentId));

      default:
        return MaterialPageRoute(builder: (_) => const MainPage());
    }
  }
}
