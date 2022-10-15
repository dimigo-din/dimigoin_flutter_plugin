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
  /// 인원관리 시스템 관리 권한
  attendance,
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
      case DimigoinPermissionType.attendance: return "attendance";
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
      case "attendance": return DimigoinPermissionType.attendance;
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
  bool? get isExceptionEtner => _isExceptionEnter;


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
    required bool isExceptionEnter}){
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
    _studentId = int.parse(json['serial']);
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
    return map;
  }

}