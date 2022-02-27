library dimigoin_flutter_plugin;

import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'services/dimigoin_account.dart';
part 'models/dimigoin_user.dart';
part 'services/dimigoin_meal.dart';
part 'services/dalgeurak_service.dart';


final _dio = Dio();
final _storage = const FlutterSecureStorage();

const apiUrl = "https://api.dimigo.in";


DimigoinAccount _dimigoinLogin = DimigoinAccount();

late String _accessToken;
late DimigoinUser _currentUser;
StreamController<DimigoinUser?> _userChangeController = StreamController<DimigoinUser?>();

class DimigoinFlutterPlugin {
  initializeApp() async {
    if (await _dimigoinLogin.checkNowLogin()) {
      _accessToken = await _dimigoinLogin.loadSavedToken();

      await _dimigoinLogin.fetchAccountData();
    } else {
      _userChangeController.add(null);
    }
  }
}