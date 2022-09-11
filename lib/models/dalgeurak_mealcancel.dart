part of dimigoin_flutter_plugin;


/// 달그락 경고 모델 클래스
class DalgeurakMealCancel {
  String? _id;
  DimigoinUser? _applierUser;
  String? _reason;
  MealCancelStatusType? _applicationStatus;
  Map<String, DateTime>? _durationList;
  List<MealType>? _mealTypeList;


  String? get id => _id;
  DimigoinUser? get applierUser => _applierUser;
  String? get reason => _reason;
  MealCancelStatusType? get applicationStatus => _applicationStatus;
  Map<String, DateTime>? get durationList => _durationList;
  List<MealType>? get mealTypeList => _mealTypeList;


  DalgeurakMealCancel({
    required String? id,
    required DimigoinUser? applierUser,
    required String? reason,
    required MealCancelStatusType? applicationStatus,
    required Map<String, DateTime>? durationList,
    required List<MealType>? mealTypeList,}){
    _id = id;
    _applierUser = applierUser;
    _reason = reason;
    _applicationStatus = applicationStatus;
    _durationList = durationList;
    _mealTypeList = mealTypeList;
}

  DalgeurakMealCancel.fromJson(dynamic json) {
    _id = json['_id'];
    _applierUser = DimigoinUser.fromJson(json['applier']);
    _reason = json['reason'];
    _applicationStatus = (json['applicationStatus'] as String).convertMealCancelStatusType;
    _durationList = (json['duration'] as Map).cast<String, String>().map((k, v) => MapEntry(k, DateTime.parse(v))).cast<String, DateTime>();
    _mealTypeList = (json['time'] as List).cast<String>().map((v) => v.convertMealType).cast<MealType>().toList();
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['applier'] = _applierUser?.toJson();
    map['reason'] = _reason;
    map['applicationStatus'] = _applicationStatus?.convertEng;
    map['duration'] = _durationList?.map((key, value) => MapEntry(key, DateFormat('yyyy-MM-dd').format(value))).cast<String, String>();
    map['time'] = _mealTypeList?.map((v) => v.convertEngStr).cast<String>().toList();
    return map;
  }

}