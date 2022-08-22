part of dimigoin_flutter_plugin;

/// 급식 타입 열거형
enum MealType {
  /// 급식 아침시간
  breakfast,
  /// 급식 점심시간
  lunch,
  /// 급식 저녁시간
  dinner
}

/// 급식 선/후밥 열거형
enum MealExceptionType {
  /// 선밥
  first,
  /// 후밥
  last,
  /// 선/후밥이 아닌 기존 급식 순서
  normal
}

/// 급식 선/후밥 상태 열거형
enum MealExceptionStatusType {
  permitted,
  rejected,
}

/// 현재 학생의 급식 상태 열거형
enum MealStatusType {
  /// 입장 가능 / 정상 체크인 완료
  onTime,
  /// 지각 상태
  tardy,
  /// 비어있음
  empty,
  /// 입장 불가능
  early,
  /// 점심 요리 중
  beforeLunch,
  /// 저녁 요리 중
  beforeDinner,
  /// 저녁 급식 배식 완료
  afterDinner,
  /// 인증됨 - 선/후밥
  certified,
  /// 선/후밥 신청 대기중
  waiting,
  /// 선/후밥 신청 거부됨
  rejected
}

/// 학생의 경고 유형 열거형
enum StudentWarningType {
  /// 지각
  tardy,
  /// 욕설
  abuse,
  /// 통로 사용
  useHallway,
  /// 순서 무시
  ignoreSequence,
  // 기타 사유
  etc
}

/// 간편식 종류 열거형
enum ConvenienceFoodType {
  sandwich,
  salad,
  misu,
  none
}

/// 간편식 종류 열거형을 위한 Extension
extension ConvenienceFoodTypeExtension on ConvenienceFoodType {
  String get convertKor {
    switch (this) {
      case ConvenienceFoodType.sandwich: return "샌드위치";
      case ConvenienceFoodType.salad: return "샐러드";
      case ConvenienceFoodType.misu: return "선식";
      default: return "";
    }
  }

  String get convertEng {
    switch (this) {
      case ConvenienceFoodType.sandwich: return "sandwich";
      case ConvenienceFoodType.salad: return "salad";
      case ConvenienceFoodType.misu: return "misu";
      default: return "";
    }
  }

  String get convertDescription {
    switch (this) {
      case ConvenienceFoodType.sandwich: return "다양한 종류의 샌드위치가\n매일매일을 즐겁게 만들거에요";
      case ConvenienceFoodType.salad: return "신선한 채소와 함께 취향에 맞는\n드레싱을 뿌려 먹어보세요";
      case ConvenienceFoodType.misu: return "초콜릿, 말차, 견과류, 코코넛 등\n다양한 맛이 준비되어 있어요";
      default: return "";
    }
  }
}

/// 급식 선/후밥 열거형을 위한 Extension
extension MealExceptionTypeExtension on MealExceptionType {
  String get convertStr {
    switch (this) {
      case MealExceptionType.first: return "first";
      case MealExceptionType.last: return "last";
      case MealExceptionType.normal: return "normal";
      default: return "";
    }
  }
}

/// 급식 선/후밥 상태 열거형을 위한 Extension
extension MealExceptionStatusTypeExtension on MealExceptionStatusType {
  String get convertStr {
    switch (this) {
      case MealExceptionStatusType.permitted: return "permitted";
      case MealExceptionStatusType.rejected: return "rejected";
      default: return "";
    }
  }
}

/// 급식 타입 열거형을 위한 Extension
extension MealTypeExtension on MealType {
  String get convertEngStr {
    switch (this) {
      case MealType.breakfast: return "breakfast";
      case MealType.lunch: return "lunch";
      case MealType.dinner: return "dinner";
      default:
        return "";
    }
  }

  String get convertKorStr {
    switch (this) {
      case MealType.breakfast: return "아침";
      case MealType.lunch: return "점심";
      case MealType.dinner: return "저녁";
      default:
        return "";
    }
  }
}

/// 학생의 경고 유형 열거형을 위한 Extension
extension StudentWarningTypeExtension on StudentWarningType {
  String get convertEngStr {
    switch (this) {
      case StudentWarningType.tardy: return "tardy";
      case StudentWarningType.abuse: return "abuse";
      case StudentWarningType.useHallway: return "useHallway";
      case StudentWarningType.ignoreSequence: return "ignoreSequence";
      case StudentWarningType.etc: return "etc";
      default: return "";
    }
  }

  String get convertKorStr {
    switch (this) {
      case StudentWarningType.tardy: return "지각";
      case StudentWarningType.abuse: return "욕설";
      case StudentWarningType.useHallway: return "통로 사용";
      case StudentWarningType.ignoreSequence: return "순서 무시";
      case StudentWarningType.etc: return "기타";
      default: return "";
    }
  }
}

/// 달그락 서비스의 급식과 관련된 열거형을 위한 Extension
extension DalgeurakMealTypeExtension on String {
  MealStatusType get convertMealStatusType {
    switch (this) {
      case "onTime": return MealStatusType.onTime;
      case "tardy": return MealStatusType.tardy;
      case "empty": return MealStatusType.empty;
      case "early": return MealStatusType.early;
      case "beforeLunch": return MealStatusType.beforeLunch;
      case "beforeDinner": return MealStatusType.beforeDinner;
      case "certified": return MealStatusType.certified;
      case "waiting": return MealStatusType.waiting;
      case "rejected": return MealStatusType.rejected;
      default: return MealStatusType.empty;
    }
  }

  MealExceptionType get convertMealExceptionType {
    switch (this) {
      case "first": return MealExceptionType.first;
      case "last": return MealExceptionType.last;
      case "normal": return MealExceptionType.normal;
      default: return MealExceptionType.normal;
    }
  }

  StudentWarningType get convertStudentWarningType {
    switch (this) {
      case "tardy": return StudentWarningType.tardy;
      case "abuse": return StudentWarningType.abuse;
      case "useHallway": return StudentWarningType.useHallway;
      case "ignoreSequence": return StudentWarningType.ignoreSequence;
      case "etc": return StudentWarningType.etc;
      default: return StudentWarningType.etc;
    }
  }
}


/// 달그락 서비스 API 클래스
class DalgeurakService {

  Stream<dynamic>? get studentMealStatusStream => _studentMealStatusStreamSocket.getResponse;

  /// 학생 본인이 직접 체크인을 진행하는 함수입니다.
  mealCheckInWithJWT(String jwtToken) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"key": jwtToken},
      );

      return {
        "success": true,
        "content": response.data["mealStatus"].toString().convertMealStatusType
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 디넌이 수동으로 학생의 체크인을 진행하는 함수입니다.
  mealCheckInByManager(String studentObjId) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/entrance",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"sid": studentObjId},
      );

      return {
        "success": true,
        "content": response.data['mealStatus'].toString().convertMealStatusType
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 디넌이 학생에게 경고를 부여하는 함수입니다.
  giveWarningToStudent(String studentObjId, List warningType, String reason) async {
    try {
      warningType.forEach((element) => warningType[warningType.indexOf(element)] = (element as StudentWarningType).convertEngStr);

      Response response = await _dio.post(
        "$apiUrl/dalgeurak/warning",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"sid": studentObjId, "type": warningType, "reason": reason},
      );

      return {
        "success": true,
        "content": response.data['warning']
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  getMyWarningList() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/warning",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
      );

      List originalData = response.data['warning'];
      List formattingData = [];
      originalData.forEach((element) => formattingData.add(DalgeurakWarning.fromJson(element)));

      return {
        "success": true,
        "content": formattingData,
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  getStudentWarningList(String studentObjId) async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/warning/$studentObjId",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
      );

      List originalData = response.data['warning'];
      List formattingData = [];
      originalData.forEach((element) => formattingData.add(DalgeurakWarning.fromJson(element)));

      return {
        "success": true,
        "content": formattingData,
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 학생의 현재 입장 여부, 선/후밥 여부를 확인하는 함수입니다.
  getUserMealInfo() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/me",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
      );

      Map result = response.data;
      result['mealStatus'] = result['mealStatus'].toString().convertMealStatusType;
      result['exception'] = result['exception'].toString().convertMealExceptionType;

      return {
        "success": true,
        "content": result
      };
    } on DioError catch (e) {
      return {
        "success": false
      };
    }
  }

  /// 학생이 직접 선/후밥을 신청하는 함수입니다.
  setUserMealException(MealExceptionType type, String reason) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/exception/${type.convertStr}",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"reason": reason},
      );

      return {
        "success": true,
        "content": response.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 선생님이 학생에게 선/후밥을 부여하는 함수입니다.
  setTeacherMealException(MealType mealType, MealExceptionType type, String reason, String studentObjId, DateTime selectDate) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/exception/give",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {
          "type": type.convertStr,
          "sid": studentObjId,
          "reason": reason,
          "date": DateFormat('yyyy-MM-dd').format(selectDate),
          "time": mealType.convertEngStr
        },
      );

      return {
        "success": true,
        "content": response.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 학생이 직접 선/후밥을 취소하는 함수입니다.
  removeUserMealException() async {
    try {
      Response response = await _dio.delete(
        "$apiUrl/dalgeurak/exception",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
      );

      return {
        "success": true,
        "content": response.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 선/후밥을 신청한 모든 학생들의 리스트를 가져오는 함수입니다.
  getAllUserMealException(MealExceptionType type) async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/exception/${type.convertStr}",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
      );

      return {
        "success": true,
        "content": response.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 신청 되어있는 선/후밥을 선생님이 허가/거부할 수 있는 함수입니다.
  changeMealExceptionStatus(MealExceptionStatusType statusType, String studentObjId) async {
    try {
      Response response = await _dio.patch(
        "$apiUrl/dalgeurak/exception/application",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {
          "permission": statusType.convertStr,
          "sid": studentObjId
        },
      );

      return {
        "success": true,
        "content": response.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 학생이 선밥권을 사용하는 함수입니다.
  useMealExceptionTicket(MealType mealType) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/exception/ticket",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"time": mealType.convertEngStr},
      );

      return {
        "success": true,
        "content": response.data['ticket']
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 모든 학년의 급식 반 순서를 가져오는 함수입니다.
  getMealSequence() async {
    try {
      Response response = await _dio.get("$apiUrl/dalgeurak/sequence");

      return {
        "success": true,
        "content": response.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 각 학년의 급식 반 순서를 지정하는 함수입니다.
  setMealSequence(int grade, MealType mealType, List<int> sequence) async {
    try {
      if (sequence.length != 6 || sequence[0].toString().length != 1) { return {"success": false, "content": "데이터가 정상적이지 않습니다. 다시 시도해주세요."}; }

      Response response = await _dio.patch(
        "$apiUrl/dalgeurak/sequence/$grade",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"time": mealType.convertEngStr, "sequences": sequence},
      );

      return {
        "success": true,
        "content": response.data["sequences"]
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 모든 학년의 급식 시간을 가져오는 함수입니다.
  getMealTime() async {
    try {
      Response response = await _dio.get("$apiUrl/dalgeurak/time");

      return {
        "success": true,
        "content": response.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 각 학년의 급식 반 시간를 지정하는 함수입니다.
  setMealTime(int grade, MealType mealType, List<int> time) async {
    try {
      if (time.length != 6 || time[0].toString().length != 4) { return {"success": false, "content": "데이터가 정상적이지 않습니다. 다시 시도해주세요."}; }

      Response response = await _dio.patch(
        "$apiUrl/dalgeurak/time/$grade",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"time": mealType.convertEngStr, "classTimes": time},
      );

      return {
        "success": true,
        "content": response.data["classTimes"]
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 급식 줄이 밀렸을 경우 설정되는 지연 시간을 받아오는 함수입니다.
  getMealExtraTime() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/extraTime",
      );

      return {
        "success": true,
        "content": response.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 급식 줄이 밀렸을 경우 반의 급식 시간들을 미루는 함수입니다.
  setMealExtraTime(int time) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/extra",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"extraMinute": time},
      );

      return {
        "success": true,
        "content": response.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 간편식의 정보를 가져오는 함수입니다.
  getConvenienceFoodInfo() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/convenience",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
      );

      return {
        "success": true,
        "content": response.data['convenience']
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 학생이 간편식을 신청하는 함수입니다.
  applicationConvenienceFood(MealType mealType, ConvenienceFoodType foodType) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/convenience",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"time": mealType.convertEngStr, "food": foodType.convertEng},
      );

      return {
        "success": true,
        "content": response.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 학생이 간편식을 먹을 때 체크인을 진행하는 함수입니다.
  checkInConvenienceFood() async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/convenience/checkin",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
      );

      return {
        "success": true,
        "content": response.data
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 학생에게 디넌 권한을 부여하는 함수입니다.
  authorizeDienenPermission(String studentObjId) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak-management/permission",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"sid": studentObjId},
      );

      return {
        "success": true,
        "content": response.data['student']
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 학생에게 디넌 권한을 제거하는 함수입니다.
  removeDienenPermission(String studentObjId) async {
    try {
      Response response = await _dio.delete(
        "$apiUrl/dalgeurak-management/permission",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"sid": studentObjId},
      );

      return {
        "success": true,
        "content": response.data['student']
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 학생에게 디넌장 권한을 위임하는 함수입니다.
  mandateDienenLeaderPermission(String studentObjId) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak-management/mandate",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"sid": studentObjId},
      );

      return {
        "success": true,
        "content": response.data['student']
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 현재 급식 순서인 반을 반환해주는 함수입니다.
  getNowSequenceClass() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/nowSequence",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
      );

      return {
        "success": true,
        "content": response.data['nowSequence']
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 현재 기기의 FCM Token을 서버에 등록하는 함수입니다.
  registerFCMToken(String token) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/token",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"deviceToken": token},
      );

      return {
        "success": true,
        "content": response.data['registeredTokens']
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 유저의 FCM Token 중 원하는 Token을 서버에서 제거하는 함수입니다.
  removeFCMToken(String token) async {
    try {
      Response response = await _dio.delete(
        "$apiUrl/dalgeurak/token",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"deviceToken": token},
      );

      return {
        "success": true,
        "content": response.data['registeredTokens']
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 현재 디미고인에 등록되어있는 모든 학생들의 정보를 리스트 형태로 반환하는 함수입니다.
  getAllStudentList() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/student",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
      );

      List originalData = response.data['students'];
      List formattingData = [];
      originalData.forEach((element) => formattingData.add(DimigoinUser.fromJson(element)));

      return {
        "success": true,
        "content": formattingData
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 현재 디미고인에 등록되어있는 모든 1, 2학년 학생들의 급식 상태를 리스트 형태로 반환하는 함수입니다.
  getAllStudentMealStatus() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/mealStatus",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
      );

      Map originalData = response.data['mealStatuses'];
      Map formattingData = {};
      originalData.forEach((key, value) => formattingData.addAll({key: value.toString().convertMealStatusType}));

      return {
        "success": true,
        "content": formattingData
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 전교생의 급식 상태 변경시 자동으로 받아오는 WebSocket의 Stream을 반환해주는 함수입니다.
  connectStudentMealStatusWebSocket() {
    SocketIo.Socket socket = SocketIo.io('$socketApiUrl/dalgeurak', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.onConnect((_) => socket.emit('mealStatusJoinRoom'));

    socket.onConnectError((data) => print("ConnectError: $data"));

    socket.on('mealStatus', (data) => _studentMealStatusStreamSocket.registerNewData(data) );

    socket.connect();
  }

  /// 현재 시간에 어느 종류의 급식을 먹는지 반환해주는 함수입니다.
  MealType getMealKind(bool includeBreakfast) {
    String nowMinute = DateTime.now().minute.toString(); if (int.parse(nowMinute) < 10) { nowMinute = "0$nowMinute"; }
    int nowTime = int.parse("${DateTime.now().hour}$nowMinute");

    MealType mealKind;
    if ((nowTime < 0830 || nowTime >= 2000) && includeBreakfast) {
      mealKind = MealType.breakfast;
    } else if (nowTime < 1400 || nowTime >= 2000) {
      mealKind = MealType.lunch;
    } else {
      mealKind = MealType.dinner;
    }

    return mealKind;
  }
}