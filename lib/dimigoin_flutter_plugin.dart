library dimigoin_flutter_plugin;

import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:socket_io_client/socket_io_client.dart' as SocketIo;

part 'services/dimigoin_account.dart';
part 'services/dimigoin_meal.dart';
part 'services/dimigoin_timetable.dart';
part 'services/dalgeurak_service.dart';
part 'models/dimigoin_user.dart';
part 'models/dalgeurak_warning.dart';
part 'models/dalgeurak_mealcancel.dart';
part 'models/dalgeurak_mealexception.dart';
part 'models/dalgeurak_conveniencefood.dart';
part 'models/stream_socket.dart';


final _dio = Dio();
final _storage = const FlutterSecureStorage();

String apiUrl = "https://api.dimigo.in";
const socketApiUrl = "http://oci.dimigo.in:4999";
const dimigoStudentApiUrl = "https://api.dimigo.hs.kr/v1";


DimigoinAccount _dimigoinLogin = DimigoinAccount();
DalgeurakService _dalgeurakService = DalgeurakService();

String _accessToken = "";
late String? _dimigoStudentAPIAuthToken;
late DimigoinUser _currentUser;
bool _isLogin = false;
StreamController<DimigoinUser?> _userChangeController = StreamController<DimigoinUser?>();

StreamSocket _studentMealStatusStreamSocket = StreamSocket();

class DimigoinFlutterPlugin {
  initializeApp({String? dimigoStudentAPIAuthToken, String? customApiUrl}) async {
    _dimigoStudentAPIAuthToken = dimigoStudentAPIAuthToken;
    if (customApiUrl != null) { apiUrl = customApiUrl; }

    _dio.interceptors.clear();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
        if (options.path == '/auth/refresh') {
          return handler.next(options);
        }

        if (options.uri.toString().contains('/auth/refresh')) {
          String? refreshToken = await _storage.read(key: "dimigoinAccount_refreshToken");
          options.headers['Authorization'] = 'Bearer $refreshToken';
        } else {
          options.headers['Authorization'] = 'Bearer $_accessToken';
        }

        return handler.next(options);
      },
      onError: (DioError err, ErrorInterceptorHandler handler) async {
        if ((err.response?.requestOptions.path.contains('/auth/refresh'))!) {
          return handler.next(err);
        }


        if (err.response?.statusCode == 401 && _accessToken.isNotEmpty && JwtDecoder.isExpired(_accessToken)) { //AccessToken이 만료되었을 시
          bool isTokenRefreshSuccess = await _dimigoinLogin.refreshAccessToken();

          if (isTokenRefreshSuccess) {
            Response response = await _dio.fetch(err.requestOptions);
            return handler.resolve(response);
          } else {
            return handler.next(err);
          }
        } else if (err.response?.statusCode == 403 && (err.response?.data.toString().contains("MISMATCH_TOKEN_VERSION"))!) { //토큰의 버전이 변경되었을 시
          await _dimigoinLogin.logout();
          return handler.next(err);
        }
        return handler.next(err);
      },
    ));

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