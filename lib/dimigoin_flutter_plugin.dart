library dimigoin_flutter_plugin;

import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as SocketIo;

part 'services/dimigoin_account.dart';
part 'services/dimigoin_meal.dart';
part 'services/dalgeurak_service.dart';
part 'models/dimigoin_user.dart';
part 'models/dalgeurak_warning.dart';
part 'models/dalgeurak_mealcancel.dart';
part 'models/dalgeurak_mealexception.dart';
part 'models/dalgeurak_conveniencefood.dart';
part 'models/stream_socket.dart';


final _dio = Dio();
final _storage = const FlutterSecureStorage();

const apiUrl = "https://api.dimigo.in";
const socketApiUrl = "http://oci.dimigo.in:4999";
const dimigoStudentApiUrl = "https://api.dimigo.hs.kr/v1";


DimigoinAccount _dimigoinLogin = DimigoinAccount();
DalgeurakService _dalgeurakService = DalgeurakService();

late String _accessToken;
late DimigoinUser _currentUser;
bool _isLogin = false;
StreamController<DimigoinUser?> _userChangeController = StreamController<DimigoinUser?>();

StreamSocket _studentMealStatusStreamSocket = StreamSocket();

class DimigoinFlutterPlugin {
  initializeApp() async {
    if (await _dimigoinLogin.checkNowLogin()) {
      _accessToken = await _dimigoinLogin.loadSavedToken();

      await _dimigoinLogin.fetchAccountData();

      _isLogin = true;
    } else {
      _userChangeController.add(null);
    }

    _dalgeurakService.connectStudentMealStatusWebSocket();
  }
}