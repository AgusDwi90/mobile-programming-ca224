import 'package:myapp/models/comment.dart';
import 'package:myapp/repositories/contracts/abs_comment_repository.dart';

// Simulasi database untuk contoh
class DbCommentRepository implements AbsCommentRepository {
  // Simulasi data komentar dalam bentuk Map (id => Comment)
  final Map<String, Comment> _commentsDatabase = {};

  @override
  Future<void> addComment(Comment newComment) async {
    // Simulasi menambahkan komentar ke database
    await Future.delayed(
        const Duration(seconds: 1)); // Simulasi proses database
    _commentsDatabase[newComment.id] = newComment;
  }

  @override
  Future<void> updateComment(Comment updateComment) async {
    // Simulasi pembaruan komentar di database
    await Future.delayed(
        const Duration(seconds: 1)); // Simulasi proses database
    if (_commentsDatabase.containsKey(updateComment.id)) {
      _commentsDatabase[updateComment.id] = updateComment;
    } else {
      throw Exception("Comment not found");
    }
  }

  @override
  Future<void> deleteComment(String commentId) async {
    // Simulasi penghapusan komentar dari database
    await Future.delayed(
        const Duration(seconds: 1)); // Simulasi proses database
    _commentsDatabase.remove(commentId);
  }

  @override
  Future<Comment?> getCommentById(String commentId) async {
    // Simulasi pengambilan komentar berdasarkan ID
    await Future.delayed(
        const Duration(seconds: 1)); // Simulasi proses database
    return _commentsDatabase[commentId];
  }

  @override
  Future<List<Comment>> getAllComments(String momentId) async {
    // Simulasi pengambilan semua komentar untuk satu moment
    await Future.delayed(
        const Duration(seconds: 1)); // Simulasi proses database
    return _commentsDatabase.values
        .where((comment) => comment.momentId == momentId)
        .toList();
  }
}
