part of dimigoin_flutter_plugin;

/// 급식 타입 열거형
enum MealType {
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

/// 급식 타입 열거형을 위한 Extension
extension MealTypeExtension on MealType {
  String get convertStr {
    switch (this) {
      case MealType.lunch: return "lunch";
      case MealType.dinner: return "dinner";
      default:
        return "";
    }
  }
}

/// 달그락 서비스와 관련된 모든 열거형을 위한 Extension
extension DalgeurakTypeExtension on String {
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
}


/// 달그락 서비스 API 클래스
class DalgeurakService {
  /// 학생 본인이 직접 체크인을 진행하는 함수입니다.
  mealCheckInByMyself() async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
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
  mealCheckInByManager(int studentId, String studentName) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/entrance",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"serial": studentId, "name": studentName},
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
        data: {"time": mealType.convertStr, "sequences": sequence},
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
        data: {"time": mealType.convertStr, "classTimes": time},
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

  /// 학생에게 디넌 권한을 부여하는 함수입니다.
  authorizeDienenPermission(int studentId, String studentName) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak-management/permission",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"serial": studentId, "name": studentName},
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
  removeDienenPermission(int studentId, String studentName) async {
    try {
      Response response = await _dio.delete(
        "$apiUrl/dalgeurak-management/permission",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"serial": studentId, "name": studentName},
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
  mandateDienenLeaderPermission(int studentId, String studentName) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak-management/mandate",
        options: Options(contentType: "application/json", headers: {'Authorization': 'Bearer $_accessToken'}),
        data: {"serial": studentId, "name": studentName},
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
}