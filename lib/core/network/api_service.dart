import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_exceptions.dart';
import 'package:hungry/core/network/dio_client.dart';

class ApiService {
  final DioClient _dioClient = DioClient();

  // get
  Future<dynamic> get(String endPoint) async {
    try {
      final response = await _dioClient.dio.get(endPoint);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  // post
  Future<dynamic> post(String endPoint, Map<String, dynamic>? data) async {
    try {
      final response = await _dioClient.dio.post(endPoint, data: data);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  // put
  Future<dynamic> put(String endPoint, Map<String, dynamic>? data) async {
    try {
      final response = await _dioClient.dio.put(endPoint, data: data);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }

  // delete
  Future<dynamic> delete(String endPoint, Map<String, dynamic>? data) async {
    try {
      final response = await _dioClient.dio.delete(endPoint, data: data);
      return response.data;
    } on DioException catch (e) {
      return ApiExceptions.handleError(e);
    }
  }
}
