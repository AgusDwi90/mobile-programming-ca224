import 'package:flutter/material.dart';
import '../../../core/resources/dimensions.dart';
import '../../../core/resources/colors.dart';

class CommentEntryPage extends StatefulWidget {
  static const routeName = '/comment/entry';

  const CommentEntryPage({super.key, this.commentId});
  final String? commentId;

  @override
  // ignore: library_private_types_in_public_api
  _CommentEntryPageState createState() => _CommentEntryPageState();
}

class _CommentEntryPageState extends State<CommentEntryPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _dataComment = {};

  void _saveComment() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Simpan data ke server/database atau state management.
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.commentId == null ? 'Create Comment' : 'Edit Comment'),
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
                    hintText: 'Moment creator',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter creator name';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataComment['creator'] = newValue;
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
                    hintText: 'Enter comment',
                    prefixIcon: const Icon(Icons.comment),
                  ),
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your comment';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataComment['content'] = newValue;
                    }
                  },
                ),
                const SizedBox(height: largeSize),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _saveComment,
                  child: const Text('Save'),
                ),
                const SizedBox(height: mediumSize),
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
