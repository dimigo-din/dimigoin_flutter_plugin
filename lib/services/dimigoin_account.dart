part of dimigoin_flutter_plugin;

/// 디미고인 로그인 클래스
class DimigoinAccount {

  DimigoinUser get currentUser => _currentUser;
  Stream<DimigoinUser?> get userChangeStream => _userChangeController.stream;
  bool get isLogin => _isLogin;

  /// 디미고인 계정에 로그인을 진행하는 함수입니다.
  /// OAuth 방식을 사용하여, 로그인에 성공할 경우 반환되는 AccessToken과 RefreshToken을 Secure Storage에 저장합니다.
  ///
  /// @param [username] 사용자의 디미고인 계정 아이디 string형 변수입니다.
  /// @param [password] 사용자의 디미고인 계정 비밀번호 string형 변수입니다.
  /// @returns 로그인에 성공할 경우 true, 실패할 경우 false를 반환합니다.
  login(String userName, String password) async {
    try {
      Response authResponse = await _dio.post(
        '$apiUrl/auth',
        options: Options(contentType: "application/json"),
        data: {"username": userName, "password": password},
      );


      _accessToken = authResponse.data['accessToken'];
      await _storage.write(key: "dimigoinAccount_accessToken", value: authResponse.data['accessToken']);
      await _storage.write(key: "dimigoinAccount_refreshToken", value: authResponse.data['refreshToken']);
      await storeUserData();

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
      _userChangeController.add(null);
      _isLogin = false;

      return true;
    } catch (e) {
      return false;
    }
  }

  /// 현재 저장되어있는 AccessToken이 유효기간이 남아있는지를 확인합니다.
  ///
  /// @returns 유효기간이 남아있을 경우 true, 기간이 만료되었을 경우 false를 반환합니다.
  validateAccessToken() async {
    String? accessToken = await _storage.read(key: "dimigoinAccount_accessToken");
    try {
      await _dio.get(
        "$apiUrl/user/me",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $accessToken'}),
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  /// 현재 계정이 로그인 되어있는지를 확인합니다.
  ///
  /// @returns 로그인 되어있을 경우 true, 되어있지 않은 경우 false를 반환합니다.
  checkNowLogin() async => (await loadSavedToken()) != null;

  /// 현재 서비스에 로그인되어 있는 경우, refreshToken을 활용해 AccessToken을 갱신하는 함수입니다.
  ///
  /// @returns 갱신에 성공할 경우 true, 실패할 경우 false를 반환합니다.
  refreshAccessToken() async {
    try {
      String? refreshToken = await _storage.read(key: "dimigoinAccount_refreshToken");

      Response response = await _dio.post(
        '$apiUrl/auth/refresh',
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $refreshToken'}),
        data: {"refreshtoken": refreshToken},
      );

      _accessToken = response.data['accessToken'];
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

  /// 디미고인 서버에 저장되어있는 계정의 정보를 불러와 로컬 Storage에 저장합니다.
  ///
  /// @returns 저장에 성공할 경우 true, 실패할 경우 false를 반환합니다.
  storeUserData() async {
    try {
      Response infoResponse = await _dio.get(
        "$apiUrl/user/me",
        options: Options(contentType: "application/json",
            headers: {'Authorization': 'Bearer $_accessToken'}),
      );

      await _storage.write(key: "dimigoinAccount_userInfo", value: json.encode(infoResponse.data['identity']));
      _currentUser = DimigoinUser.fromJson(infoResponse.data['identity']);
      _userChangeController.add(_currentUser);
      _isLogin = true;

      return true;
    } catch (e) {
      return false;
    }
  }

  /// 현재 서비스에 로그인되어 있는 경우, 디미고인 API에서 받아온 최신 데이터로 패치를 진행하는 함수입니다.
  fetchAccountData() async {
    if (!(await validateAccessToken())) { await refreshAccessToken(); }

    bool isSuccessStoreData = await storeUserData();
    if (!isSuccessStoreData) { _currentUser = DimigoinUser.fromJson(json.decode((await _storage.read(key: "dimigoinAccount_userInfo"))!)); _userChangeController.add(_currentUser); }
  }
}
