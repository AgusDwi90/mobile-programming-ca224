import 'package:equatable/equatable.dart';
import 'package:myapp/models/comment.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();

  @override
  List<Object?> get props => [];
}

class FetchComments extends CommentEvent {
  final String momentId;
  final String keyword;

  const FetchComments({required this.momentId, this.keyword = ''});

  @override
  List<Object?> get props => [momentId, keyword];
}

class FetchCommentsWithPagination extends CommentEvent {
  final String momentId;
  final int page;
  final int size;
  final String keyword;

  const FetchCommentsWithPagination({
    required this.momentId,
    this.page = 1,
    this.size = 10,
    this.keyword = '',
  });

  @override
  List<Object?> get props => [momentId, page, size, keyword];
}

class CreateComment extends CommentEvent {
  final String momentId;
  final Comment newComment;

  const CreateComment({required this.momentId, required this.newComment});

  @override
  List<Object?> get props => [momentId, newComment];
}

class UpdateComment extends CommentEvent {
  final String momentId;
  final Comment updatedComment;

  const UpdateComment({required this.momentId, required this.updatedComment});

  @override
  List<Object?> get props => [momentId, updatedComment];
}

class DeleteComment extends CommentEvent {
  final String momentId;
  final String commentId;

  const DeleteComment({required this.momentId, required this.commentId});

  @override
  List<Object?> get props => [momentId, commentId];
}
