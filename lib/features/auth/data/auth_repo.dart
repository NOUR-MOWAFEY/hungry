import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/core/network/api_exceptions.dart';
import 'package:hungry/core/network/api_service.dart';
import 'package:hungry/core/utils/pref_helper.dart';
import 'package:hungry/features/auth/data/user_model.dart';

class AuthRepo {
  ApiService apiService = ApiService();
  // login
  Future<UserModel?> login(String email, String passowrd) async {
    try {
      final response = await apiService.post(EndPoints.login, {
        BodyKeys.email: email,
        BodyKeys.password: passowrd,
      });

      if (response['code'] != 200 && response['code'] != 201) {
        throw ApiError(message: response['message'] ?? 'Login Failed');
      }

      log(response['message'] ?? '');

      final user = UserModel.fromJson(response['data']);

      if (user.token != null) {
        PrefHelper.saveToken(user.token!);
      }

      return user;
    } on ApiError {
      rethrow;
    } on DioException catch (e) {
      log(e.message ?? '');
      throw ApiExceptions.handleError(e);
    } catch (e) {
      log(e.toString());
      throw ApiError(message: e.toString());
    }
  }

  // register

  // get profile data

  // update profile data

  // logout
}

class BodyKeys {
  static const email = 'email';
  static const password = 'password';
}

class EndPoints {
  static const login = '/login';
  static const register = '/register';
  static const logout = '/logout';
} 


//! handle errors and exception