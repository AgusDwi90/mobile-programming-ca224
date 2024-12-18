part of 'comment_bloc.dart';

abstract class CommentEvent {}

class LoadComments extends CommentEvent {
  final String momentId;
  LoadComments(this.momentId);
}

class AddComment extends CommentEvent {
  final Comment comment;
  AddComment(this.comment);
}

class UpdateComment extends CommentEvent {
  final Comment comment;
  UpdateComment(this.comment);
}

class DeleteComment extends CommentEvent {
  final String commentId;
  DeleteComment(this.commentId);
}
