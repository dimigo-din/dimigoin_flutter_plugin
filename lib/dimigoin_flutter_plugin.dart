library dimigoin_flutter_plugin;

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'services/dimigoin_login.dart';
part 'services/dimigoin_meal.dart';


final _dio = Dio();
final _storage = const FlutterSecureStorage();

DimigoinLogin _dimigoinLogin = DimigoinLogin();

late String _accessToken;

class DimigoinFlutterPlugin {
  initializeApp() async {
    if (await _dimigoinLogin.checkNowLogin()) {
      _accessToken = await _dimigoinLogin.loadSavedToken();
    }
  }
}