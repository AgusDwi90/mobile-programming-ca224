import 'package:flutter/material.dart';

import 'post_action.dart';

class PostActionList extends StatelessWidget {
  const PostActionList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        PostAction(
          asset: 'assets/icons/fi-br-heart.svg',
          label: '1.4k',
        ),
        PostAction(
          asset: 'assets/icons/fi-br-comment.svg',
          label: '233',
        ),
        PostAction(
          asset: 'assets/icons/fi-br-bookmark.svg',
          label: '122',
        ),
      ],
    );
  }
}
