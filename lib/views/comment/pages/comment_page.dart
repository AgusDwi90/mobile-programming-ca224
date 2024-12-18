import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nanoid2/nanoid2.dart';
import 'comment_entry_page.dart';
import 'package:myapp/models/comment.dart';

class CommentPage extends StatefulWidget {
  static const routeName = '/comments';

  const CommentPage({super.key, this.momentId});
  final String? momentId;

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  List<Comment> _comments = [];
  final _dateFormat = DateFormat('dd MMM yyyy');

  @override
  void initState() {
    super.initState();
    // Inisialisasi komentar jika momentId tidak null.
    if (widget.momentId != null) {
      _comments = List.generate(
        5,
        (index) => Comment(
          id: nanoid(),
          creator: 'User $index',
          content: 'This is comment $index',
          createdAt: DateTime.now().subtract(Duration(days: index)),
          momentId: widget.momentId!,
        ),
      );
    }
  }

  // Fungsi untuk menambahkan komentar
  void _addComment(String creator, String content) {
    setState(() {
      _comments.add(Comment(
        id: nanoid(),
        momentId: widget.momentId ?? '',
        creator: creator,
        content: content,
        createdAt: DateTime.now(),
      ));
    });
  }

  // Fungsi untuk memperbarui komentar
  void _updateComment(String id, String creator, String content) {
    setState(() {
      final index = _comments.indexWhere((comment) => comment.id == id);
      if (index != -1) {
        _comments[index] = _comments[index].copyWith(
          creator: creator,
          content: content,
        );
      }
    });
  }

  // Fungsi untuk menghapus komentar
  void _deleteComment(String id) {
    setState(() {
      _comments.removeWhere((comment) => comment.id == id);
    });
  }

  // Navigasi ke halaman tambah/edit komentar
  Future<void> _navigateToEntryPage({Comment? comment}) async {
    final result = await Navigator.of(context).pushNamed(
      CommentEntryPage.routeName,
      arguments: {
        'creator': comment?.creator ?? '',
        'content': comment?.content ?? '',
      },
    );

    if (result != null && result is Map<String, String>) {
      if (comment == null) {
        // Tambah komentar baru
        _addComment(result['creator']!, result['content']!);
      } else {
        // Update komentar yang ada
        _updateComment(comment.id, result['creator']!, result['content']!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: ListView.builder(
        itemCount: _comments.length,
        itemBuilder: (ctx, index) {
          final comment = _comments[index];
          return ListTile(
            title: Text(comment.creator),
            subtitle: Text(comment.content),
            leading: const CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(_dateFormat.format(comment.createdAt)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _navigateToEntryPage(comment: comment),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _deleteComment(comment.id),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToEntryPage(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
