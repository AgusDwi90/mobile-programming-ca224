import 'package:equatable/equatable.dart';
import 'package:myapp/models/comment.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object?> get props => [];
}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final List<Comment> comments;

  const CommentLoaded(this.comments);

  @override
  List<Object?> get props => [comments];
}

class CommentEmpty extends CommentState {
  @override
  List<Object> get props => [];
}

class CommentPaginationLoaded extends CommentState {
  final List<Comment> comments;
  final bool hasReachedMax;

  const CommentPaginationLoaded(this.comments, this.hasReachedMax);

  @override
  List<Object?> get props => [comments, hasReachedMax];
}

class CommentSuccess extends CommentState {}

class CommentError extends CommentState {
  final String message;

  const CommentError(this.message);

  @override
  List<Object?> get props => [message];
}
