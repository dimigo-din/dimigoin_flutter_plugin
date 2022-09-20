part of dimigoin_flutter_plugin;


/// 달그락 선/후밥 모델 클래스
class DalgeurakMealException {
  String? _id;
  bool? _isGroup;
  DimigoinUser? _applierUser;
  List<DimigoinUser>? _groupApplierUserList;
  MealType? _mealType;
  DateTime? _date;
  String? _reason;
  MealExceptionType? _exceptionType;
  String? _rejectReason;
  bool? _isEnter;
  MealExceptionStatusType? _statusType;


  String? get id => _id;
  bool? get isGroup => _isGroup;
  DimigoinUser? get applierUser => _applierUser;
  List<DimigoinUser>? get groupApplierUserList => _groupApplierUserList;
  MealType? get mealType => _mealType;
  DateTime? get date => _date;
  String? get reason => _reason;
  MealExceptionType? get exceptionType => _exceptionType;
  String? get rejectReason => _rejectReason;
  bool? get isEnter => _isEnter;
  MealExceptionStatusType? get statusType => _statusType;


  DalgeurakMealException({
    required String? id,
    required bool? isGroup,
    required DimigoinUser? applierUser,
    required List<DimigoinUser>? groupApplierUserList,
    required MealType? mealType,
    required DateTime? date,
    required String? reason,
    required MealExceptionType? exceptionType,
    required String? rejectReason,
    required bool? isEnter,
    required MealExceptionStatusType? statusType}){
    _id = id;
    _isGroup = isGroup;
    _applierUser = applierUser;
    _groupApplierUserList = groupApplierUserList;
    _mealType = mealType;
    _date = date;
    _reason = reason;
    _exceptionType = exceptionType;
    _rejectReason = rejectReason;
    _isEnter = isEnter;
    _statusType = statusType;
}

  DalgeurakMealException.fromJson(dynamic json) {
    _id = json['_id'];
    _isGroup = json['group'];
    _applierUser = DimigoinUser.fromJson(json['applier']);
    _groupApplierUserList = (json['appliers'] as List).cast<DimigoinUser>();
    _mealType = (json['time'] as String).convertMealType;
    _date = DateTime.parse(json['date']);
    _reason = json['reason'];
    _exceptionType = (json['exceptionType'] as String).convertMealExceptionType;
    _rejectReason = json['rejectReason'];
    _isEnter = json['entered'];
    _statusType = (json['applicationStatus'] as String).convertMealExceptionStatusType;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['group'] = _isGroup;
    map['applier'] = _applierUser?.toJson();
    map['appliers'] = _groupApplierUserList?.map((e) => e.toJson()).cast<Map>().toList();
    map['time'] = _mealType?.convertEngStr;
    map['date'] = DateFormat('yyyy-MM-dd').format(_date!);
    map['reason'] = _reason;
    map['exceptionType'] = _exceptionType?.convertStr;
    map['rejectReason'] = _rejectReason;
    map['entered'] = _isEnter;
    map['applicationStatus'] = (_statusType as MealExceptionStatusType).convertStr;
    return map;
  }

}