part of dimigoin_flutter_plugin;

/// 디미고인 유저 타입 열거형
enum DimigoinUserType {
  /// 학생
  student,
  /// 선생님
  teacher,
  /// 현재 디미고에 있지 않은 유저
  outdate,
  /// 학부모
  parent,
  /// 기숙사 사감 선생님
  dormitoryTeacher,
  /// 이외의 유저 타입
  none
}

/// 디미고인 권한 열거형
enum DimigoinPermissionType {
  /// 방과후 권한
  afterschool,
  /// 방과후 신청 권한
  afterschoolApplication,
  /// 인원관리 시스템 관리 권한
  attendance,
  /// 계정 인증 권한
  auth,
  /// 동아리 권한
  circle,
  /// 동아리 신청 권한
  circleApplication,
  /// 동아리 신청 관리 권한
  circleApplicationManagement,
  /// 설정 권한
  config,
  /// 뎃츠 권한
  dets,
  /// 뎃츠 신청 권한
  detsApplication,
  /// 그 외 권한
  etc,
  /// FCM 권한
  fcm,
  /// 파일 권한
  file,
  /// 인강실 신청 권한
  ingangApplication,
  /// 급식 권한
  meal,
  /// 멘토링 권한
  mentoring,
  /// 멘토링 신청 권한
  mentoringApplication,
  /// 공지 권한
  notice,
  /// 외출 관리 권한
  outgoManagement,
  /// 외출 요청 권한
  outgoRequest,
  /// 장소 권한
  place,
  /// 시간표 권한
  timetable,
  /// 유저 권한
  user,
  /// 달그락 관리자 권한
  dalgeurak,
  /// 달그락 디넌장 권한
  dalgeurakManagement,
  /// 이외의 권한 타입
  none
}

/// 디미고인 유저 열거형을 위한 Extension
extension DimigoinUserTypeExtension on DimigoinUserType {
  String get convertStr {
    switch (this) {
      case DimigoinUserType.student: return "S";
      case DimigoinUserType.teacher: return "T";
      case DimigoinUserType.outdate: return "O";
      case DimigoinUserType.parent: return "P";
      case DimigoinUserType.dormitoryTeacher: return "D";
      default: return "";
    }
  }
}

/// 디미고인 권한 열거형을 위한 Extension
extension DimigoinPermissionTypeExtension on DimigoinPermissionType {
  String get convertStr {
    switch (this) {
      case DimigoinPermissionType.afterschool: return "afterschool";
      case DimigoinPermissionType.afterschoolApplication: return "afterschool-application";
      case DimigoinPermissionType.attendance: return "attendance";
      case DimigoinPermissionType.auth: return "auth";
      case DimigoinPermissionType.circle: return "circle";
      case DimigoinPermissionType.circleApplication: return "circle-application";
      case DimigoinPermissionType.circleApplicationManagement: return "circle-application-management";
      case DimigoinPermissionType.config: return "config";
      case DimigoinPermissionType.dets: return "dets";
      case DimigoinPermissionType.detsApplication: return "dets-application";
      case DimigoinPermissionType.etc: return "etc";
      case DimigoinPermissionType.fcm: return "fcm";
      case DimigoinPermissionType.file: return "file";
      case DimigoinPermissionType.ingangApplication: return "ingang-application";
      case DimigoinPermissionType.meal: return "meal";
      case DimigoinPermissionType.mentoring: return "mentoring";
      case DimigoinPermissionType.mentoringApplication: return "mentoring-application";
      case DimigoinPermissionType.notice: return "notice";
      case DimigoinPermissionType.outgoManagement: return "outgo-management";
      case DimigoinPermissionType.outgoRequest: return "outgo-request";
      case DimigoinPermissionType.place: return "place";
      case DimigoinPermissionType.timetable: return "timetable";
      case DimigoinPermissionType.user: return "user";
      case DimigoinPermissionType.dalgeurak: return "dalgeurak";
      case DimigoinPermissionType.dalgeurakManagement: return "dalgeurak-management";
      default: return "";
    }
  }
}

/// 디미고인 유저와 관련된 열거형을 위한 Extension
extension DimigoinAccountTypeExtension on String {
  DimigoinUserType get convertDimigoinUserType {
    switch (this) {
      case "S": return DimigoinUserType.student;
      case "T": return DimigoinUserType.teacher;
      case "O": return DimigoinUserType.outdate;
      case "P": return DimigoinUserType.parent;
      case "D": return DimigoinUserType.dormitoryTeacher;
      default: return DimigoinUserType.none;
    }
  }

  DimigoinPermissionType get convertDimigoinPermissionType {
    switch (this) {
      case "afterschool": return DimigoinPermissionType.afterschool;
      case "afterschool-application": return DimigoinPermissionType.afterschoolApplication;
      case "attendance": return DimigoinPermissionType.attendance;
      case "auth": return DimigoinPermissionType.auth;
      case "circle": return DimigoinPermissionType.circle;
      case "circle-application": return DimigoinPermissionType.circleApplication;
      case "circle-applcation-management": return DimigoinPermissionType.circleApplicationManagement;
      case "config": return DimigoinPermissionType.config;
      case "dets": return DimigoinPermissionType.dets;
      case "dets-application": return DimigoinPermissionType.detsApplication;
      case "etc": return DimigoinPermissionType.etc;
      case "fcm": return DimigoinPermissionType.fcm;
      case "file": return DimigoinPermissionType.file;
      case "ingang-application": return DimigoinPermissionType.ingangApplication;
      case "meal": return DimigoinPermissionType.meal;
      case "mentoring": return DimigoinPermissionType.mentoring;
      case "mentoring-application": return DimigoinPermissionType.mentoringApplication;
      case "notice": return DimigoinPermissionType.notice;
      case "outgo-management": return DimigoinPermissionType.outgoManagement;
      case "outgo-request": return DimigoinPermissionType.outgoRequest;
      case "place": return DimigoinPermissionType.place;
      case "timetable": return DimigoinPermissionType.timetable;
      case "user": return DimigoinPermissionType.user;
      case "dalgeurak": return DimigoinPermissionType.dalgeurak;
      case "dalgeurak-management": return DimigoinPermissionType.dalgeurakManagement;
      default: return DimigoinPermissionType.none;
    }
  }
}


/// 디미고인 유저 정보 클래스
class DimigoinUser {
  int? _id;
  String? _userId;
  String? _name;
  DimigoinUserType? _userType;
  String? _gender;
  String? _createdAt;
  String? _updatedAt;
  String? _mealStatus;
  String? _teacherRole;
  int? _classNum;
  int? _gradeNum;
  int? _studentNum;
  int? _studentId;
  List<dynamic>? _photos;
  List<DimigoinPermissionType>? _permissions;
  String? _birthdate;
  String? _libraryId;
  bool? _isExceptionEnter;
  bool? _isConvenienceBlack;
  bool? _isExceptionBlack;

  int? get id => _id;
  String? get userId => _userId;
  String? get name => _name;
  DimigoinUserType? get userType => _userType;
  String? get gender => _gender;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get mealStatus => _mealStatus;
  String? get teacherRole => _teacherRole;
  int? get classNum => _classNum;
  int? get gradeNum => _gradeNum;
  int? get studentNum => _studentNum;
  int? get studentId => _studentId;
  List<dynamic>? get photos => _photos;
  List<DimigoinPermissionType>? get permissions => _permissions;
  String? get birthdate => _birthdate;
  String? get libraryId => _libraryId;
  bool? get isExceptionEnter => _isExceptionEnter;
  bool? get isConvenienceBlack => _isConvenienceBlack;
  bool? get isExceptionBlack => _isExceptionBlack;


  DimigoinUser({
    required int id,
    required String userId,
    required String name,
    required DimigoinUserType userType,
    required String gender,
    required String createdAt,
    required String updatedAt,
    required String mealStatus,
    required String teacherRole,
    required int classNum,
    required int gradeNum,
    required int studentNum,
    required int studentId,
    required List<dynamic> photos,
    required List<DimigoinPermissionType> permissions,
    required String birthdate,
    required String libraryId,
    required bool isExceptionEnter,
    required bool isConvenienceBlack,
    required bool isExceptionBlack,}){
    _id = id;
    _userId = userId;
    _name = name;
    _userType = userType;
    _gender = gender;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _mealStatus = mealStatus;
    _teacherRole = teacherRole;
    _classNum = classNum;
    _gradeNum = gradeNum;
    _studentNum = studentNum;
    _studentId = studentId;
    _photos = photos;
    _permissions = permissions;
    _birthdate = birthdate;
    _libraryId = libraryId;
    _isExceptionEnter = isExceptionEnter;
    _isConvenienceBlack = isConvenienceBlack;
    _isExceptionBlack = isExceptionBlack;
}

  DimigoinUser.fromJson(dynamic json) {
    _id = json['user_id'];
    _userId = json['username'];
    _name = json['name'];
    _userType = json['userType'].toString().convertDimigoinUserType;
    _gender = json['gender'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _mealStatus = json['mealStatus'];
    _teacherRole = json['role'];
    _classNum = json['class'];
    _gradeNum = json['grade'];
    _studentNum = json['number'];
    _studentId = (json['serial'].runtimeType == int) ? json['serial'] : (json['serial'] != null ? int.parse(json['serial']) : null);
    if (json['photos'] != null) {
      _photos = [];
      json['photos'].forEach((v) {
        _photos?.add(v.toString());
      });
    }
    if (json['permissions'] != null) {
      _permissions = [];
      json['permissions'].forEach((v) {
        _permissions?.add(v.toString().convertDimigoinPermissionType);
      });
    }
    _birthdate = json['birthdate'];
    _libraryId = json['libraryId'];
    _isExceptionEnter = json['entered'];
    _isConvenienceBlack = json['convenienceBlack'];
    _isExceptionBlack = json['exceptionBlack'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _id;
    map['username'] = _userId;
    map['name'] = _name;
    map['userType'] = _userType?.convertStr;
    map['gender'] = _gender;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['mealStatus'] = _mealStatus;
    map['role'] = _teacherRole;
    map['class'] = _classNum;
    map['grade'] = _gradeNum;
    map['number'] = _studentNum;
    map['serial'] = _studentId.toString();
    if (_photos != null) {
      map['photos'] = _photos?.toList();
    }
    if (_permissions != null) {
      map['permissions'] = _permissions?.map((v) => v.convertStr).toList();
    }
    map['birthdate'] = _birthdate;
    map['libraryId'] = _libraryId;
    map['entered'] = _isExceptionEnter;
    map['convenienceBlack'] = _isConvenienceBlack;
    map['exceptionBlack'] = _isExceptionBlack;
    return map;
  }

}