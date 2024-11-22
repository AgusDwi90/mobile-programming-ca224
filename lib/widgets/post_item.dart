import 'package:flutter/material.dart';
import 'package:mobile_programming_ca224/models/moment.dart';
import 'package:mobile_programming_ca224/resources/dimensions.dart';
import 'package:mobile_programming_ca224/widgets/post_action_list.dart';
import 'package:mobile_programming_ca224/widgets/post_header.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    super.key, 
    required this.moment,
    required this.onUpdate,
    required this.onDelete,
    });

  final Moment moment;
  final Function(Moment) onUpdate;
  final Function(Moment) onDelete;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 3,
      child: Container(
        margin: const EdgeInsets.fromLTRB(
          largeSize,
          0,
          largeSize,
          largeSize,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(xLargeSize),
          image: DecorationImage(
            image: NetworkImage(moment.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PostHeader(
              momentItem: moment,
              onUpdate: onUpdate,
              onDelete: onDelete,
              creator: moment.creator,
              location: moment.location,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostActionList(
                  likeCount: moment.likesCount,
                  commentCount: moment.commentsCount,
                  bookmarkCount: moment.bookmarksCount,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    largeSize,
                    0,
                    largeSize,
                    mediumSize,
                  ),
                  child: Text(
                    moment.caption,
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
