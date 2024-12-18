import 'package:myapp/models/comment.dart';
import 'package:myapp/repositories/contracts/abs_comment_repository.dart';
import 'package:myapp/repositories/databases/db_comment_repository.dart';

class CommentRepository implements AbsCommentRepository {
  final AbsCommentRepository _dbCommentRepository;

  // Constructor yang memungkinkan penggunaan database atau mock repository
  CommentRepository({AbsCommentRepository? dbCommentRepository})
      : _dbCommentRepository = dbCommentRepository ?? DbCommentRepository();

  @override
  Future<void> addComment(Comment newComment) async {
    // Delegasi panggilan ke DbCommentRepository
    await _dbCommentRepository.addComment(newComment);
  }

  @override
  Future<void> updateComment(Comment updateComment) async {
    // Delegasi panggilan ke DbCommentRepository
    await _dbCommentRepository.updateComment(updateComment);
  }

  @override
  Future<void> deleteComment(String commentId) async {
    // Delegasi panggilan ke DbCommentRepository
    await _dbCommentRepository.deleteComment(commentId);
  }

  @override
  Future<Comment?> getCommentById(String commentId) async {
    // Delegasi panggilan ke DbCommentRepository
    return await _dbCommentRepository.getCommentById(commentId);
  }

  @override
  Future<List<Comment>> getAllComments(String momentId) async {
    // Delegasi panggilan ke DbCommentRepository
    return await _dbCommentRepository.getAllComments(momentId);
  }
}
