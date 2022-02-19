library dimigoin_flutter_plugin;

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// 디미고인 로그인 클래스
class DimigoinLogin {
  final _dio = Dio();
  final _storage = const FlutterSecureStorage();

  /// 디미고인 계정에 로그인을 진행하는 함수입니다.
  /// OAuth 방식을 사용하여, 로그인에 성공할 경우 반환되는 AccessToken과 RefreshToken을 Secure Storage에 저장합니다.
  /// 또한 디미고인 계정 정보를 불러와 Secure Storage에 저장합니다.
  ///
  /// @param username 사용자의 디미고인 계정 아이디 string형 변수입니다.
  /// @param password 사용자의 디미고인 계정 비밀번호 string형 변수입니다.
  /// @returns 로그인에 성공할 경우 true, 실패할 경우 false를 반환합니다.
  login(String userName, String password) async {
    try {
      Response authResponse = await _dio.post(
        'https://api.dimigo.in/auth',
        options: Options(contentType: "application/json"),
        data: {"username": userName, "password": password},
      );

      Response infoResponse = await _dio.get(
        "https://api.dimigo.in/user/me",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer ${authResponse.data['accessToken']}'}),
      );

      await _storage.write(key: "dimigoinAccount_accessToken", value: authResponse.data['accessToken']);
      await _storage.write(key: "dimigoinAccount_refreshToken", value: authResponse.data['refreshToken']);
      await _storage.write(key: "dimigoinAccount_userInfo", value: json.encode(infoResponse.data['identity']));
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 현재 서비스에 로그인되어 있는 경우, 로그아웃을 진행하는 함수입니다.
  /// Secure Storage에 저장되어있는 계정 정보를 삭제합니다.
  ///
  /// @returns 로그아웃에 성공할 경우 true, 실패할 경우 false를 반환합니다.
  logout() async {
    try {
      await _storage.delete(key: "dimigoinAccount_accessToken");
      await _storage.delete(key: "dimigoinAccount_refreshToken");
      await _storage.delete(key: "dimigoinAccount_userInfo");
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 현재 서비스에 로그인되어 있는 경우, refreshToken을 활용해 AccessToken을 갱신하는 함수입니다.
  ///
  /// @returns 갱신에 성공할 경우 true, 실패할 경우 false를 반환합니다.
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

  /// 현재 서비스에 로그인되어 있는 경우, 저장되어있는 AccessToken을 불러오는 함수입니다.
  ///
  /// @returns 저장되어있는 AccessToken을 반환합니다.
  loadSavedToken() async => await _storage.read(key: "dimigoinAccount_accessToken");

  /// 현재 서비스에 로그인되어 있는 경우, 저장되어있는 사용자 정보를 불러오는 함수입니다.
  ///
  /// @returns 저장되어있는 사용자 정보를 반환합니다.
  loadUserInfo() async => json.decode((await _storage.read(key: "dimigoinAccount_userInfo"))!);
}
