import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import 'package:equatable/equatable.dart';
import 'package:myapp/models/comment.dart';
import 'package:myapp/repositories/contracts/abs_comment_repository.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final AbsCommentRepository repository;

  CommentBloc(this.repository) : super(CommentInitial()) {
    on<LoadComments>((event, emit) async {
      emit(CommentLoading());
      try {
        final comments = await repository.getAllComments(event.momentId);
        emit(CommentLoaded(comments));
      } catch (e) {
        emit(CommentError('Failed to load comments'));
      }
    });

    on<AddComment>((event, emit) async {
      await repository.addComment(event.comment);
      add(LoadComments(event.comment.momentId));
    });

    on<UpdateComment>((event, emit) async {
      await repository.updateComment(event.comment);
      add(LoadComments(event.comment.momentId));
    });

    on<DeleteComment>((event, emit) async {
      await repository.deleteComment(event.commentId);
      add(LoadComments('')); // Reload comments
    });
  }
}
