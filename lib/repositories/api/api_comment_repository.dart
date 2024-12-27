import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:myapp/core/resources/constants.dart';
import 'package:myapp/models/comment.dart';

import '../../core/helpers/dio_interceptor.dart';
import '../contracts/abs_api_comment_repository.dart';

class ApiCommentRepository extends AbsApiCommentRepository {
  final _baseUri = '$baseUrl/api/comments';
  late final Dio _dio;
  late final BaseOptions _options;

  ApiCommentRepository() {
    _options = BaseOptions(
      baseUrl: _baseUri,
    );
    _dio = Dio(_options)
      ..options.validateStatus = (status) {
        return status != null &&
            (status >= 200 && status < 300 || status == 404);
      };
    _dio.interceptors.add(DioInterceptor(_dio));
  }

  @override
  Future<Comment?> create(String momentId, Comment newData) async {
    try {
      final response = await _dio.post(
        '/$momentId',
        data: newData.toDto(),
      );
      if (response.statusCode == 201) {
        return Comment.fromMap(response.data);
      }
    } catch (e) {
      log(e.toString(), name: 'ApiCommentRepository:create');
    }
    return null;
  }

  @override
  Future<bool> delete(String momentId, String id) async {
    try {
      final response = await _dio.delete('/$momentId/$id');
      if (response.statusCode == 204) {
        return true;
      }
    } catch (e) {
      log(e.toString(), name: 'ApiCommentRepository:delete');
    }
    return false;
  }

  @override
  Future<List<Comment>> getAll(String momentId, [String keyword = '']) async {
    try {
      final response = await _dio.get(
        '/$momentId/all',
        queryParameters: {'keyword': keyword},
      );
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((comment) => Comment.fromMap(comment))
            .toList();
      }
    } catch (e) {
      log(e.toString(), name: 'ApiCommentRepository:getAll');
    }
    return [];
  }

  @override
  Future<Comment?> getById(String momentId, String id) async {
    try {
      final response = await _dio.get('/$momentId/$id');
      if (response.statusCode == 200) {
        return Comment.fromMap(response.data);
      }
    } catch (e) {
      log(e.toString(), name: 'ApiCommentRepository:getById');
    }
    return null;
  }

  @override
  Future<List<Comment>> getWithPagination(String momentId,
      [int page = 1, int size = 10, String keyword = '']) async {
    try {
      final response = await _dio.get(
        '/$momentId',
        queryParameters: {
          'PageNumber': page,
          'PageSize': size,
          'Keyword': keyword,
        },
      );
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((comment) => Comment.fromMap(comment))
            .toList();
      }
    } catch (e) {
      log(e.toString(), name: 'ApiCommentRepository:getWithPagination');
    }
    return [];
  }

  @override
  Future<bool> update(String momentId, Comment updatedData) async {
    try {
      final response = await _dio.put(
        '/$momentId/${updatedData.id}',
        data: updatedData.toDto(),
      );
      if (response.statusCode == 204) {
        return true;
      }
    } catch (e) {
      log(e.toString(), name: 'ApiCommentRepository:update');
    }
    return false;
  }
}
