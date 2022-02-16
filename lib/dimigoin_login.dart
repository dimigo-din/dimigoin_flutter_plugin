library dimigoin_flutter_plugin;

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// 디미고인 로그인 클래스
class DimigoinLogin {
  final _dio = Dio();
  final _storage = const FlutterSecureStorage();

  login(String userName, String password) async {
    try {
      Response response = await _dio.post(
        'https://api.dimigo.in/auth',
        options: Options(contentType: "application/json"),
        data: {"username": userName, "password": password},
      );

      await _storage.write(key: "dimigoinAccount_accessToken", value: response.data['accessToken']);
      await _storage.write(key: "dimigoinAccount_refreshToken", value: response.data['refreshToken']);
      return true;
    } catch (e) {
      return false;
    }
  }

  logout() async {
    try {
      await _storage.delete(key: "dimigoinAccount_accessToken");
      await _storage.delete(key: "dimigoinAccount_refreshToken");
      return true;
    } catch (e) {
      return false;
    }
  }

  refreshAccessToken() async {
    try {
      String? refreshToken = await _storage.read(key: "dimigoinAccount_refreshToken");

      Response response = await _dio.post(
        'https://api.dimigo.in/auth/refresh',
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $refreshToken'}),
        data: {"refreshtoken": refreshToken},
      );

      await _storage.write(key: "dimigoinAccount_accessToken", value: response.data['accessToken']);
      await _storage.write(key: "dimigoinAccount_refreshToken", value: response.data['refreshToken']);


      return true;
    } catch (e) {
      return false;
    }
  }

  loadSavedToken() async => await _storage.read(key: "dimigoinAccount_accessToken");
}
