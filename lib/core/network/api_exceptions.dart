import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ApiError(
          message: 'Connection timeout. Please check your internet.',
        );

      case DioExceptionType.sendTimeout:
        return ApiError(
          message: 'Send timeout. Failed to send request in time.',
        );

      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Receive timeout. Server is not responding.');

      case DioExceptionType.badCertificate:
        return ApiError(message: 'Bad certificate. Secure connection failed.');

      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;

        if (statusCode == 400) {
          return ApiError(message: 'Bad request.');
        } else if (statusCode == 401) {
          return ApiError(message: 'Unauthorized. Please login again.');
        } else if (statusCode == 403) {
          return ApiError(message: 'Forbidden request.');
        } else if (statusCode == 404) {
          return ApiError(message: 'Resource not found.');
        } else if (statusCode == 500) {
          return ApiError(message: 'Internal server error.');
        } else {
          return ApiError(message: 'Unexpected server error.');
        }

      case DioExceptionType.cancel:
        return ApiError(message: 'Request was cancelled.');

      case DioExceptionType.connectionError:
        return ApiError(message: 'No internet connection.');

      case DioExceptionType.unknown:
        return ApiError(
          message: 'Unexpected error occurred. Please try again.',
        );
    }
  }
}
