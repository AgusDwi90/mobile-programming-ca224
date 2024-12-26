import 'package:flutter/material.dart';
import 'package:myapp/models/comment.dart';
import 'package:nanoid2/nanoid2.dart';

import '../../../core/resources/dimensions.dart';
import '../../../core/resources/colors.dart';

class CommentEntryPage extends StatefulWidget {
  static const routeName = '/comment/entry';
  const CommentEntryPage({super.key, this.momentId, String? commentId});
  final String? momentId;

  @override
  State<CommentEntryPage> createState() => _CommentEntryPageState();
}

class _CommentEntryPageState extends State<CommentEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final _commentData = <String, String>{};

  void _saveComment() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Create a new Comment object
      final newComment = Comment(
        id: nanoid(),
        creatorUsername: _commentData['creatorUsername'],
        content: _commentData['content']!,
        createdAt: DateTime.now(),
        momentId: widget.momentId!,
      );

      // Pass the new comment back to the previous page
      Navigator.of(context).pop(newComment);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Comment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(largeSize),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Creator'),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    hintText: 'Enter your username',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _commentData['creatorUsername'] = newValue;
                    }
                  },
                ),
                const SizedBox(height: mediumSize),
                const Text('Comment'),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    hintText: 'Enter your comment',
                    prefixIcon: const Icon(Icons.note),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a comment';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _commentData['content'] = newValue;
                    }
                  },
                ),
                const SizedBox(height: largeSize),
                SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    onPressed: _saveComment,
                    child: const Text('Save'),
                  ),
                ),
                const SizedBox(height: mediumSize),
                SizedBox(
                  height: 50.0,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
