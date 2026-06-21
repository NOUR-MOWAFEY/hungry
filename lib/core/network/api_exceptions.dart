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
        final responseData = error.response?.data;

        String? apiMessage;

        if (responseData is Map<String, dynamic>) {
          apiMessage = responseData['message'];
        } else if (responseData is String) {
          apiMessage = responseData;
        }

        final displayMessage =
            apiMessage ??
            apiMessage ??
            error.response?.statusMessage ??
            'Server error ($statusCode)';

        return ApiError(message: displayMessage, statusCode: statusCode);

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
