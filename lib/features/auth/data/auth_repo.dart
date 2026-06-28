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
        Keys.email: email,
        Keys.pass: passowrd,
      });

      if (response[Keys.code] != 200 && response[Keys.code] != 201) {
        throw ApiError(message: response[Keys.message] ?? 'Login Failed');
      }

      log(response[Keys.message] ?? '');

      final user = UserModel.fromJson(response[Keys.data]);

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
      throw ApiError(message: 'Something went wrong, Please try again later');
    }
  }

  // sign up
  Future<UserModel> signup(String name, String email, String password) async {
    try {
      final response = await apiService.post(EndPoints.signup, {
        Keys.name: name,
        Keys.email: email,
        Keys.pass: password,
      });

      final dynamic rawCode = response[Keys.code];
      final int? code = rawCode is int
          ? rawCode
          : (rawCode != null ? int.tryParse(rawCode.toString()) : null);

      if (code != null && code != 200 && code != 201) {
        throw ApiError(message: response[Keys.message] ?? 'Sign Up Failed');
      }

      log(response[Keys.message] ?? '');

      final user = UserModel.fromJson(response[Keys.data]);

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
      throw ApiError(message: 'Something went wrong, Please try again later');
    }
  }

  // get profile data
  Future<UserModel?> getProfileData() async {
    try {
      Map<String, dynamic> response = await apiService.get(EndPoints.profile);

      if (response[Keys.code] != 200 && response[Keys.code] != 201) {
        throw ApiError(
          message:
              response[Keys.message] ??
              'Something went wrong, Please try again',
        );
      }

      return UserModel.fromJson(response[Keys.data]);
    } on ApiError {
      rethrow;
    } on DioException catch (e) {
      log(e.message ?? '');
      throw ApiExceptions.handleError(e);
    } catch (e) {
      log(e.toString());
      throw ApiError(message: 'Something went wrong, Please try again later');
    }
  }

  // update profile data

  // logout
}

class Keys {
  static const email = 'email';
  static const pass = 'password';
  static const name = 'name';
  static const message = 'message';
  static const code = 'code';
  static const data = 'data';
}

class EndPoints {
  static const login = '/login';
  static const signup = '/register';
  static const logout = '/logout';
  static const profile = '/profile';
}
