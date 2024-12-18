import 'package:flutter/material.dart';
import 'package:myapp/models/comment.dart';
import 'package:nanoid2/nanoid2.dart';
import 'comment_entry_page.dart';

class CommentPage extends StatefulWidget {
  static const routeName = '/comments';

  const CommentPage({super.key, required this.momentId});

  final String momentId;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<Comment> _comments = [];

  @override
  void initState() {
    super.initState();
    _comments = List.generate(
      3,
      (index) => Comment(
        id: nanoid(),
        momentId: widget.momentId,
        creator: 'User $index',
        content: 'This is comment number $index',
        createdAt: DateTime.now(),
      ),
    );
  }

  Future<void> _navigateToAddOrEditComment({Comment? comment}) async {
    final result = await Navigator.of(context).pushNamed(
      CommentEntryPage.routeName,
      arguments: comment?.id,
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        if (comment == null) {
          // Tambah komentar baru
          _comments.add(Comment(
            id: nanoid(),
            momentId: widget.momentId,
            creator: result['creator']!,
            content: result['content']!,
            createdAt: DateTime.now(),
          ));
        } else {
          // Update komentar yang sudah ada
          final index = _comments.indexWhere((c) => c.id == comment.id);
          _comments[index] = comment.copyWith(
            creator: result['creator'],
            content: result['content'],
          );
        }
      });
    }
  }

  void _deleteComment(String id) {
    setState(() {
      _comments.removeWhere((comment) => comment.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: ListView.builder(
        itemCount: _comments.length,
        itemBuilder: (context, index) {
          final comment = _comments[index];
          return ListTile(
            title: Text(comment.creator),
            subtitle: Text(comment.content),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () =>
                      _navigateToAddOrEditComment(comment: comment),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteComment(comment.id),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddOrEditComment(),
        child: const Icon(Icons.add_comment),
      ),
    );
  }
}
