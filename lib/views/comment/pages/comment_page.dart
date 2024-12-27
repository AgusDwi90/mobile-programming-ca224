import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/comment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/views/comment/bloc/comment_bloc.dart';
import 'package:myapp/views/comment/bloc/comment_event.dart';
import 'package:myapp/views/comment/bloc/comment_state.dart';

import 'comment_entry_page.dart';

class CommentPage extends StatefulWidget {
  static const routeName = '/comments';
  const CommentPage({super.key, this.momentId});
  final String? momentId;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  final _dateFormat = DateFormat('dd MMM yyyy');

  @override
  void initState() {
    super.initState();
    if (widget.momentId != null) {
      // Fetch initial comments for the moment
      context.read<CommentBloc>().add(FetchComments(momentId: widget.momentId!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: BlocBuilder<CommentBloc, CommentState>(
        builder: (context, state) {
          if (state is CommentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CommentLoaded) {
            return SingleChildScrollView(
              child: Column(
                children: state.comments
                    .map(
                      (comment) => ListTile(
                        title: Text(comment.creatorUsername ?? 'Anonymous'),
                        subtitle: Text(comment.content),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(comment.creatorImageUrl ??
                              'https://i.pravatar.cc/150'),
                        ),
                        trailing: Text(_dateFormat.format(comment.createdAt)),
                      ),
                    )
                    .toList(),
              ),
            );
          } else if (state is CommentError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No comments available.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Navigate to the Comment Entry Page and wait for the result
           final newComment = await Navigator.of(context).pushNamed<Comment>(
            CommentEntryPage.routeName,
              arguments: {
                'momentId': widget.momentId,
                'commentId': null, // Null for new comment
              },
            );

            // Dispatch an event to add the new comment
            if (newComment != null && widget.momentId != null) {
            // ignore: use_build_context_synchronously
              context.read<CommentBloc>().add(
                CreateComment(
                  momentId: widget.momentId!,
                  newComment: newComment,
                ),
              );
            }
          },
        child: const Icon(Icons.comment),
      ),
    );
  }
}
