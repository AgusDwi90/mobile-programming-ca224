
import 'package:flutter/material.dart';

import 'post_action.dart';

class PostActionList extends StatelessWidget {
  const PostActionList({
    super.key,
    this.likeCount = 0,
    this.commentCount = 0,
    this.bookmarkCount = 0,
  });
  final int likeCount;
  final int commentCount;
  final int bookmarkCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PostAction(
          asset: 'assets/icons/fi-br-heart.svg',
          label: likeCount.toString(),
        ),
        PostAction(
          asset: 'assets/icons/fi-br-comment.svg',
          label: commentCount.toString(),
        ),
        PostAction(
          asset: 'assets/icons/fi-br-bookmark.svg',
          label: bookmarkCount.toString(),
        ),
      ],
    );
  }
}
