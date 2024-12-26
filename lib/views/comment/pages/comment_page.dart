import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/views/comment/bloc/comment_bloc.dart';
import 'package:myapp/views/comment/bloc/comment_event.dart';
import 'package:myapp/views/comment/bloc/comment_state.dart';

class CommentPage extends StatelessWidget {
  static const routeName = '/comment-page';

  final String momentId;

  const CommentPage({super.key, required this.momentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: BlocProvider(
        create: (context) => CommentBloc(
          RepositoryProvider.of(context), 
          "currentUser", // Ganti sesuai kebutuhan Anda
        )..add(FetchComments(momentId: momentId)),
        child: BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            if (state is CommentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CommentLoaded) {
              return ListView.builder(
                itemCount: state.comments.length,
                itemBuilder: (context, index) {
                  final comment = state.comments[index];
                  return ListTile(
                    title: Text(comment.content),
                    subtitle: Text('By: ${comment.creatorUsername}'),
                  );
                },
              );
            } else if (state is CommentError) {
              return Center(child: Text('Error: ${state.message}'));
            } else {
              return const Center(child: Text('No comments available.'));
            }
          },
        ),
      ),
    );
  }
}
