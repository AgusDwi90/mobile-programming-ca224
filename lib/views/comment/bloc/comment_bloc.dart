import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/models/comment.dart';
import 'package:myapp/repositories/api/api_comment_repository.dart';

import 'comment_event.dart';
import 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final ApiCommentRepository commentRepository;
  final String currentUser;

  CommentBloc(this.commentRepository, this.currentUser)
      : assert(commentRepository != null, 'commentRepository cannot be null'),
        assert(currentUser.isNotEmpty, 'currentUser cannot be empty'),
        super(CommentInitial()) {
    on<FetchComments>(_onFetchComments);
    on<FetchCommentsWithPagination>(_onFetchCommentsWithPagination);
    on<CreateComment>(_onCreateComment);
    on<UpdateComment>(_onUpdateComment);
    on<DeleteComment>(_onDeleteComment);
  }

  Future<void> _onFetchComments(
    FetchComments event,
    Emitter<CommentState> emit,
  ) async {
    emit(CommentLoading());
    try {
      final comments = await commentRepository.getAll(event.momentId, event.keyword);
      emit(CommentLoaded(comments));
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }

  Future<void> _onFetchCommentsWithPagination(
    FetchCommentsWithPagination event,
    Emitter<CommentState> emit,
  ) async {
    emit(CommentLoading());
    try {
      final comments = await commentRepository.getWithPagination(
        event.momentId,
        event.page,
        event.size,
        event.keyword,
      );
      emit(CommentPaginationLoaded(comments, comments.length < event.size));
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }

  Future<void> _onCreateComment(
    CreateComment event,
    Emitter<CommentState> emit,
  ) async {
    try {
      final newComment = event.newComment.copyWith(creatorUsername: currentUser);
      final createdComment = await commentRepository.create(event.momentId, newComment);

      if (createdComment != null) {
        final currentState = state;
        if (currentState is CommentLoaded) {
          final updatedComments = List<Comment>.from(currentState.comments)..insert(0, createdComment);
          emit(CommentLoaded(updatedComments));
        } else {
          emit(CommentLoaded([createdComment]));
        }
      } else {
        emit(const CommentError('Failed to create comment.'));
      }
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }

  Future<void> _onUpdateComment(
    UpdateComment event,
    Emitter<CommentState> emit,
  ) async {
    try {
      final success = await commentRepository.update(event.momentId, event.updatedComment);
      if (success) {
        final currentState = state;
        if (currentState is CommentLoaded) {
          final updatedComments = currentState.comments.map((comment) {
            return comment.id == event.updatedComment.id ? event.updatedComment : comment;
          }).toList();
          emit(CommentLoaded(updatedComments));
        }
      } else {
        emit(const CommentError('Failed to update comment.'));
      }
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }

  Future<void> _onDeleteComment(
    DeleteComment event,
    Emitter<CommentState> emit,
  ) async {
    try {
      final success = await commentRepository.delete(event.momentId, event.commentId);
      if (success) {
        final currentState = state;
        if (currentState is CommentLoaded) {
          final updatedComments = currentState.comments
              .where((comment) => comment.id != event.commentId)
              .toList();
          emit(CommentLoaded(updatedComments));
        }
      } else {
        emit(const CommentError('Failed to delete comment.'));
      }
    } catch (e) {
      emit(CommentError(e.toString()));
    }
  }
}
