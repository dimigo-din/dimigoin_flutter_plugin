part of dimigoin_flutter_plugin;

/// 급식 타입 열거형
enum MealType {
  /// 급식 아침시간
  breakfast,
  /// 급식 점심시간
  lunch,
  /// 급식 저녁시간
  dinner,
  /// 그 외 시간 타입
  none,
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
  approve,
  reject,
  waiting,
  etc
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
  /// 샌드위치
  sandwich,
  /// 샐러드
  salad,
  /// 선식
  misu,
  /// 그 외 간편식 종류
  none
}

/// 급식 대기 장소 종류 열거형
enum MealWaitingPlaceType {
  /// 1학년 복도
  corridor,
  /// 외부 통로
  outside,
}

/// 급식 취소 신청 상태 열거형
enum MealCancelStatusType {
  /// 1차 승인(담임선생님) 대기 중
  teacherWaiting,
  /// 2차 승인(급식실) 대기 중
  aramarkWaiting,
  /// 최종 승인됨
  approve,
  /// 신청 거부됨
  reject,
  /// 기타
  etc
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

  String get convertKorStr {
    switch (this) {
      case MealExceptionType.first: return "선밥";
      case MealExceptionType.last: return "후밥";
      case MealExceptionType.normal: return "일반";
      default: return "";
    }
  }
}

/// 급식 선/후밥 상태 열거형을 위한 Extension
extension MealExceptionStatusTypeExtension on MealExceptionStatusType {
  String get convertStr {
    switch (this) {
      case MealExceptionStatusType.approve: return "approve";
      case MealExceptionStatusType.reject: return "reject";
      case MealExceptionStatusType.waiting: return "waiting";
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

  String get convertKor2Str {
    switch (this) {
      case MealType.breakfast: return "조식";
      case MealType.lunch: return "중식";
      case MealType.dinner: return "석식";
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

/// 급식 대기 장소 종류 열거형을 위한 Extension
extension MealWaitingPlaceTypeExtension on MealWaitingPlaceType {
  String get convertKor {
    switch (this) {
      case MealWaitingPlaceType.corridor: return "1학년 복도";
      case MealWaitingPlaceType.outside: return "외부 통로";
      default: return "";
    }
  }

  String get convertEng {
    switch (this) {
      case MealWaitingPlaceType.corridor: return "corridor";
      case MealWaitingPlaceType.outside: return "outside";
      default: return "";
    }
  }
}

/// 급식 대기 장소 종류 열거형을 위한 Extension
extension MealCancelStatusTypeExtension on MealCancelStatusType {
  String get convertEng {
    switch (this) {
      case MealCancelStatusType.teacherWaiting: return "teacherWaiting";
      case MealCancelStatusType.aramarkWaiting: return "aramarkWaiting";
      case MealCancelStatusType.approve: return "approve";
      case MealCancelStatusType.reject: return "reject";
      default: return "";
    }
  }
}

/// 달그락 서비스의 급식과 관련된 열거형을 위한 Extension
extension DalgeurakMealTypeExtension on String {
  MealType get convertMealType {
    switch (this) {
      case "breakfast": return MealType.breakfast;
      case "lunch": return MealType.lunch;
      case "dinner": return MealType.dinner;
      default: return MealType.none;
    }
  }

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

  MealCancelStatusType get convertMealCancelStatusType {
    switch (this) {
      case "teacherWaiting": return MealCancelStatusType.teacherWaiting;
      case "aramarkWaiting": return MealCancelStatusType.aramarkWaiting;
      case "approve": return MealCancelStatusType.approve;
      case "reject": return MealCancelStatusType.reject;
      default: return MealCancelStatusType.etc;
    }
  }

  MealExceptionStatusType get convertMealExceptionStatusType {
    switch (this) {
      case "approve": return MealExceptionStatusType.approve;
      case "reject": return MealExceptionStatusType.reject;
      case "waiting": return MealExceptionStatusType.waiting;
      default: return MealExceptionStatusType.etc;
    }
  }

  ConvenienceFoodType get convertConvenienceFoodType {
    switch (this) {
      case "sandwich": return ConvenienceFoodType.sandwich;
      case "salad": return ConvenienceFoodType.salad;
      case "misu": return ConvenienceFoodType.misu;
      default: return ConvenienceFoodType.none;
    }
  }
}


/// 달그락 서비스 API 클래스
class DalgeurakService {
  DateTime nowTime = DateTime.now();

  Stream<dynamic>? get studentMealStatusStream => _studentMealStatusStreamSocket.getResponse;

  /// 학생 본인이 직접 체크인을 진행하는 함수입니다.
  mealCheckInWithJWT(String jwtToken) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/",
        options: Options(contentType: "application/json"),
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
  mealCheckInByManager(int studentUid) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/entrance",
        options: Options(contentType: "application/json"),
        data: {"sid": studentUid},
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
  giveWarningToStudent(int studentUid, List warningType, String reason) async {
    try {
      warningType.forEach((element) => warningType[warningType.indexOf(element)] = (element as StudentWarningType).convertEngStr);

      Response response = await _dio.post(
        "$apiUrl/dalgeurak/warning",
        options: Options(contentType: "application/json"),
        data: {"sid": studentUid, "type": warningType, "reason": reason},
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
        options: Options(contentType: "application/json"),
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

  getStudentWarningList(int studentUid) async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/warning/$studentUid",
        options: Options(contentType: "application/json"),
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
        options: Options(contentType: "application/json"),
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
  setUserMealException(List<MealType> mealTypeList, List<String> dateList, List<MealExceptionType> exceptionTypeList, String reason, List<int> studentUidList) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/exception",
        options: Options(contentType: "application/json"),
        data: {
          "reason": reason,
          "group": studentUidList.isNotEmpty,
          "appliers": studentUidList,
          "time": mealTypeList.map((e) => e.convertEngStr).toList(),
          "date": dateList,
          "type": exceptionTypeList.map((e) => e.convertStr).toList(),
        },
      );

      return {
        "success": true,
        "content": response.data['date']
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 선생님이 학생에게 선/후밥을 부여하는 함수입니다.
  setTeacherMealException(List<MealType> mealTypeList, List<String> dateList, List<MealExceptionType> exceptionTypeList, String reason, List<int> studentUidList) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/exception/instead",
        options: Options(contentType: "application/json"),
        data: {
          "applier": studentUidList[0],
          "reason": reason,
          "group": studentUidList.length > 1,
          "appliers": studentUidList,
          "time": mealTypeList.map((e) => e.convertEngStr).toList(),
          "date": dateList,
          "type": exceptionTypeList.map((e) => e.convertStr).toList(),
        },
      );

      return {
        "success": true,
        "content": response.data['date']
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 선생님이 선/후밥을 취소하는 함수입니다.
  removeUserMealException(String studentUid, MealType mealType, MealExceptionType excepetionType, String date) async {
    try {
      Response response = await _dio.delete(
        "$apiUrl/dalgeurak/exception",
        options: Options(contentType: "application/json"),
        data: {
          "student": studentUid,
          "time": mealType.convertEngStr,
          "date": date,
          "type": excepetionType.convertStr
        }
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
  getAllUserMealException(bool isGetGroupAppliersStudentInfo) async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/exception/",
        options: Options(contentType: "application/json"),
      );

      List originalData = response.data['users'];
      List formattingDataList = [];
      for (var element in originalData) {
        Map preprocessingData = json.decode(json.encode(element));
        List originalAppliersList = (element['appliers'] as List);
        List<DimigoinUser> preprocessingStudentList = [].cast<DimigoinUser>();

        for (var element2 in (originalAppliersList)) {
          Map studentData = {...element2['student'], 'entered': element2['entered']};
          preprocessingStudentList.add(DimigoinUser.fromJson(studentData));
        }

        preprocessingData['appliers'] = preprocessingStudentList;

        formattingDataList.add(DalgeurakMealException.fromJson(preprocessingData));
      }


      return {
        "success": true,
        "content": formattingDataList,
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 신청 되어있는 선/후밥을 선생님이 허가/거부할 수 있는 함수입니다.
  changeMealExceptionStatus(MealExceptionStatusType statusType, String exceptionModelId, String reason) async {
    try {
      Response response = await _dio.patch(
        "$apiUrl/dalgeurak/exception/application",
        options: Options(contentType: "application/json"),
        data: {
          "permission": statusType.convertStr,
          "id": exceptionModelId,
          "reason": reason,
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

  /// 급식실에 선밥 학생이 들어올 경우 선생님/디넌이 입장 처리를 진행하는 함수입니다.
  enterStudentMealException(int studentUid) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/exception/enter",
        options: Options(contentType: "application/json"),
        data: {
          "sid": studentUid,
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

  /// 현재 선/후밥 신청이 가능한 학생 수를 반환하는 함수입니다.
  getRemainMealExceptionStudentAmount() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/exception/remain",
        options: Options(contentType: "application/json"),
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
        options: Options(contentType: "application/json"),
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

  /// 학생을 선/후밥 블랙리스트에 추가하는 함수입니다.
  addStudentInBlackListMealException(int studentUid) async {
    try {
      Response response = await _dio.post(
          "$apiUrl/dalgeurak/exception/blacklist",
          options: Options(contentType: "application/json"),
          data: {"sid": studentUid}
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

  /// 학생을 선/후밥 블랙리스트에서 제거하는 함수입니다.
  removeStudentInBlackListMealException(int studentUid) async {
    try {
      Response response = await _dio.delete(
          "$apiUrl/dalgeurak/exception/blacklist",
          options: Options(contentType: "application/json"),
          data: {"sid": studentUid}
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

  /// 달그락 선생님 화면에 사용할 수 있는 간단한 학생의 정보를 불러올 수 있는 함수입니다.
  getSimpleStudentInfo(int studentUid, {bool? isExceptionEnter}) async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/user",
        options: Options(contentType: "application/json"),
        queryParameters: {
          "student": studentUid
        }
      );

      Map rawData = response.data['user'];
      if (isExceptionEnter != null) { rawData['entered'] = isExceptionEnter; }

      return {
        "success": true,
        "content": DimigoinUser.fromJson(rawData),
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
        options: Options(contentType: "application/json"),
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
        options: Options(contentType: "application/json"),
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
        options: Options(contentType: "application/json"),
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

  /// 급식 대기 장소를 설정하는 함수입니다.
  setMealWaitingPlace(MealWaitingPlaceType placeType) async {
    try {
      Response response = await _dio.put(
        "$apiUrl/dalgeurak/waitingLine",
        options: Options(contentType: "application/json"),
        data: {"position": placeType.convertEng},
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
        options: Options(contentType: "application/json"),
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

  /// 자신의 간편식 신청 현황 정보를 가져오는 함수입니다.
  getMyConvenienceFoodApplicationInfo() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/convenience/me",
        options: Options(contentType: "application/json"),
      );

      return {
        "success": true,
        "content": response.data['conveniences']
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
        options: Options(contentType: "application/json"),
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

  /// 선생님이 간편식을 대신 신청하는 함수입니다.
  applicationTeacherConvenienceFood(int studentUid, MealType mealType, ConvenienceFoodType foodType) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/convenience/instead",
        options: Options(contentType: "application/json"),
        data: {"sid": studentUid, "time": mealType.convertEngStr, "food": foodType.convertEng},
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

  /// 달그락 간편식 체크인에서 금요귀가임을 등록할 수 있는 함수입니다.
  registerFridayHomecomingInConvenienceFood(int studentUid) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/convenience/fri",
        options: Options(contentType: "application/json"),
        data: {"sid": studentUid},
      );

      return {
        "success": true,
        "content": response.data['date']
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 학생이 간편식을 먹을 때 체크인을 진행하는 함수입니다.
  checkInConvenienceFood(int studentUid) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/convenience/checkin",
        options: Options(contentType: "application/json"),
        data: {
          "sid": studentUid
        }
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

  /// 간편식 체크인을 취소하는 함수입니다.
  cancelCheckInConvenienceFood(int studentUid) async {
    try {
      Response response = await _dio.delete(
        "$apiUrl/dalgeurak/convenience/checkin",
        options: Options(contentType: "application/json"),
        data: {"sid": studentUid}
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

  /// 간편식을 신청한 학생들의 리스트를 불러오는 함수입니다.
  getConvenienceFoodStudentList() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/convenience/users",
        options: Options(contentType: "application/json"),
      );

      Map originalData = response.data;
      Map formattingData = {
        ConvenienceFoodType.sandwich: [],
        ConvenienceFoodType.salad: [],
        ConvenienceFoodType.misu: []
      };

      for (ConvenienceFoodType foodType in formattingData.keys) {
        if ((originalData[foodType.convertEng] as List).isNotEmpty) {
          originalData[foodType.convertEng].forEach(
            (element) => formattingData[foodType].add(
              DalgeurakConvenienceFood(
                foodType: foodType,
                student: DimigoinUser.fromJson(element),
                isCheckin: element['checkin'],
                mealType: element['time'].toString().convertMealType
              )
            )
          );
        }
      }

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

  /// 학생을 간편식 블랙리스트에 추가하는 함수입니다.
  addStudentInBlackListConvenienceFood(int studentUid) async {
    try {
      Response response = await _dio.post(
          "$apiUrl/dalgeurak/convenience/blacklist",
          options: Options(contentType: "application/json"),
          data: {"sid": studentUid}
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

  /// 학생을 간편식 블랙리스트에서 제거하는 함수입니다.
  removeStudentInBlackListConvenienceFood(int studentUid) async {
    try {
      Response response = await _dio.delete(
          "$apiUrl/dalgeurak/convenience/blacklist",
          options: Options(contentType: "application/json"),
          data: {"sid": studentUid}
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

  /// 특정한 간편식 체크인 정보를 불러오는 함수입니다.
  getSpecificConvenienceFoodCheckInInfo(DateTime firstDate, DateTime lastDate) async {
    try {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd");

      Response response = await _dio.get(
          "$apiUrl/dalgeurak/convenience/${dateFormat.format(firstDate)}/${dateFormat.format(lastDate)}",
          options: Options(contentType: "application/json"),
      );

      List originalData = response.data['checkin'];
      List formattingData = [];
      for (var element in originalData) {
        int index = originalData.indexOf(element);

        formattingData.add({});

        (formattingData[index] as Map).addAll({
          "duration": {
            "start": DateTime.tryParse(element['duration']['start']),
            "end": DateTime.tryParse(element['duration']['end']),
          }
        });


        for (MealType mealType in [MealType.breakfast, MealType.lunch, MealType.dinner]) {
          formattingData[index][mealType.convertEngStr] = [];

          if (element[mealType.convertEngStr] == null) { continue; }

          for (var element2 in (element[mealType.convertEngStr] as List)) {
            (formattingData[index][mealType.convertEngStr] as List).add(
                DalgeurakConvenienceFood(
                  dateTime: DateTime.tryParse(element2['date']),
                  student: DimigoinUser.fromJson(element2['student']),
                  mealType: element2['time']
                )
            );
          }
        }
      }

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

  /// 간편식에 관한 모든 정보들을 불러오는 함수입니다.
  getAllConvenienceFoodInfo() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/convenience/data",
        options: Options(contentType: "application/json"),
      );

      List originalData = response.data['convenience'];
      List formattingData = [...originalData];

      for (var element in originalData) {
        int index = originalData.indexOf(element);
        

        (formattingData[index] as Map).update(
          "duration", (value) => {
            "start": DateTime.parse(element['duration']['start']),
            "end": DateTime.parse(element['duration']['end']),
            "applicationend": DateTime.parse(element['duration']['applicationend']),
          }
        );

        List<DalgeurakConvenienceFood> formattingApplicationList = [];

        (element['applications'] as List).forEach(
            (e) => formattingApplicationList.add(
                DalgeurakConvenienceFood(
                  dateTime: DateTime.tryParse(e['date']),
                  student: DimigoinUser.fromJson(e['student']),
                )
            )
        );

        formattingData[index]['applications'] = formattingApplicationList;
      }

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

  /// 학생들이 간편식 체크인을 진행한 정보를 불러오는 함수입니다.
  getConvenienceCheckInInfo() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/convenience/checkeat",
        options: Options(contentType: "application/json"),
      );

      List originalData = response.data['data'];
      List formattingData = [];

      originalData.forEach((element) {
        int index = originalData.indexOf(element);


        formattingData.add({});

        (formattingData[index] as Map).addAll({"student": element['student'], "time": (element['time'] as String).convertMealType});

        List formattingDateList = [];
        (element['date'] as List).forEach((element2) => formattingDateList.add(DateTime.parse(element2)));
        formattingData[index]['date'] = formattingDateList;
      });


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

  /// 급식실에서 잔류 급식비 단가를 변경하는 함수입니다.
  setStayMealPrice(int price) async {
    try {
      Response response = await _dio.patch(
        "$apiUrl/dalgeurak/stayMealPrice",
        options: Options(contentType: "application/json"),
        data: {"price": price}
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

  /// 지정된 잔류 급식비 단가를 가져오는 함수입니다.
  getStayMealPrice() async {
    try {
      Response response = await _dio.get(
          "$apiUrl/dalgeurak/stayMealPrice",
          options: Options(contentType: "application/json"),
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

  /// 달그락의 공지사항을 불러오는 함수입니다.
  getNotice() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/notice",
        options: Options(contentType: "application/json"),
      );

      return {
        "success": true,
        "content": response.data['notice']['message']
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 달그락의 공지사항을 등록하는 함수입니다.
  setNotice(String noticeText) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/notice",
        options: Options(contentType: "application/json"),
        data: {"message": noticeText}
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

  /// 학생이 직접 급식 취소를 신청하는 함수입니다.
  applicationUserMealCancel(String reason, DateTime startDate, DateTime endDate, List<MealType> mealTypeList) async {
    try {
      List<String> mealTypeStrList = [];
      mealTypeList.forEach((element) => mealTypeStrList.add(element.convertEngStr));

      Response response = await _dio.post(
        "$apiUrl/dalgeurak/cancel",
        options: Options(contentType: "application/json"),
        data: {
          "reason": reason,
          "startDate": DateFormat('yyyy-MM-dd').format(startDate),
          "endDate": DateFormat('yyyy-MM-dd').format(endDate),
          "time": mealTypeStrList,
        }
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

  /// 선생님이 학생들의 급식 취소를 신청하는 함수입니다.
  applicationTeacherMealCancel(List<DimigoinUser> studentList, String reason, DateTime startDate, DateTime endDate, List<MealType> mealTypeList) async {
    try {
      List<String> mealTypeStrList = [];
      mealTypeList.forEach((element) => mealTypeStrList.add(element.convertEngStr));

      List<int> studentUidList = [];
      studentList.forEach((element) => studentUidList.add(element.id!));

      Response response = await _dio.post(
          "$apiUrl/dalgeurak/cancel/students",
          options: Options(contentType: "application/json"),
          data: {
            "id": studentUidList,
            "reason": reason,
            "startDate": DateFormat('yyyy-MM-dd').format(startDate),
            "endDate": DateFormat('yyyy-MM-dd').format(endDate),
            "time": mealTypeStrList,
          }
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

  /// 급식 취소 신청을 승인/거절하는 함수입니다.
  changeMealCancelStatus(String mealCancelObjId, bool isApprove) async {
    try {
      Response response = await _dio.patch(
          "$apiUrl/dalgeurak/cancel",
          options: Options(contentType: "application/json"),
          data: {
            "id": mealCancelObjId,
            "approve": isApprove,
          }
      );

      return {
        "success": true,
        "content": response.data["data"]
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }

  /// 급식 취소 신청 목록을 불러오는 함수입니다. 선생님은 자신 반 학생들 내역만, 급식실은 1차 승인이 진행된 내역만 보여줍니다.
  getMealCancelApplicationList() async {
    try {
      Response response = await _dio.get(
          "$apiUrl/dalgeurak/cancel",
          options: Options(contentType: "application/json"),
      );

      List originalData = response.data['students'];
      List formattingData = [];
      originalData.forEach((element) => formattingData.add(DalgeurakMealCancel.fromJson(element)));

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

  /// 학생에게 디넌 권한을 부여하는 함수입니다.
  authorizeDienenPermission(int studentUid) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak-management/permission",
        options: Options(contentType: "application/json"),
        data: {"sid": studentUid},
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
  removeDienenPermission(int studentUid) async {
    try {
      Response response = await _dio.delete(
        "$apiUrl/dalgeurak-management/permission",
        options: Options(contentType: "application/json"),
        data: {"sid": studentUid},
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
  mandateDienenLeaderPermission(int studentUid) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak-management/mandate",
        options: Options(contentType: "application/json"),
        data: {"sid": studentUid},
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
        options: Options(contentType: "application/json"),
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

  /// 현재 기기의 FCM Token을 서버에 등록하는 함수입니다.
  registerFCMToken(String token) async {
    try {
      Response response = await _dio.post(
        "$apiUrl/dalgeurak/token",
        options: Options(contentType: "application/json"),
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
        options: Options(contentType: "application/json"),
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

  /// 현재 디미고 Student API에 등록되어있는 모든 학생들의 정보를 리스트 형태로 반환하는 함수입니다.
  getAllStudentListInDimigoStudentAPI() async {
    try {
      List formattingData = [];

      for (int i=1; i<=3; i++) {
        Response response = await _dio.get(
          "$dimigoStudentApiUrl/user-students/search",
          options: Options(contentType: "application/json", headers: {'Authorization': 'Basic $_dimigoStudentAPIAuthToken'}),
          queryParameters: {"grade": i}
        );

        List originalData = response.data;
        originalData.forEach((element) => formattingData.add(DimigoinUser.fromJson(element)));
      }

      return {
        "success": true,
        "content": formattingData
      };
    } on DioError catch (e) {
      String errorContent;
      if (e.response != null && e.response?.statusCode != null && e.response?.statusCode == 401) {
        errorContent = "디미고 Student API의 Auth Token이 플러그인 초기화 시 등록되지 않았거나 정확하지 않습니다. 서비스 개발자에게 문의해주세요.";
      } else {
        errorContent = "서버와의 통신에 오류가 발생하였습니다. 오류가 계속될 경우 서비스 개발자에게 문의해주세요.";
      }
      return {
        "success": false,
        "content": errorContent
      };
    }
  }

  /// 현재 디미고인에 등록되어있는 모든 학생들의 정보를 리스트 형태로 반환하는 함수입니다.
  getAllStudentListInDimigoin() async {
    try {
      List formattingData = [];

      Response response = await _dio.get(
        "$apiUrl/dalgeurak/student",
        options: Options(contentType: "application/json"),
      );

      List originalData = response.data['students'];
      originalData.forEach((element) => formattingData.add(DimigoinUser.fromJson(element)));

      return {
        "success": true,
        "content": formattingData
      };
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data['message']
      };
    }
  }

  /// 현재 디미고인에 등록되어있는 모든 1, 2학년 학생들의 급식 상태를 리스트 형태로 반환하는 함수입니다.
  getAllStudentMealStatus() async {
    try {
      Response response = await _dio.get(
        "$apiUrl/dalgeurak/mealStatus",
        options: Options(contentType: "application/json"),
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

  /// 정보를 불러오기 위해 날짜를 계산하는 과정에서 날짜 숫자 전처리를 진행해주는 함수입니다.
  Map getCorrectDate(int nowDay) {
    Map result = {};

    if (nowDay < 1) {
      result["day"] = DateTime(nowTime.year, nowTime.month, 0).day - nowDay.abs();
      result["month"] = (nowTime.month-1 < 1) ? 12 : nowTime.month-1;
    } else if (nowDay > DateTime(nowTime.year, nowTime.month+1, 0).day) {
      result["day"] = nowDay - DateTime(nowTime.year, nowTime.month+1, 0).day;
      result["month"] = (nowTime.month+1 > 12) ? 1 : nowTime.month+1;
    } else {
      result["day"] = nowDay;
      result["month"] = nowTime.month;
    }

    return result;
  }
}