part of dimigoin_flutter_plugin;



/// 달그락 간편식 모델 클래스
class DalgeurakConvenienceFood {
  ConvenienceFoodType? _foodType;
  DimigoinUser? _student;
  bool? _isCheckin;
  DateTime? _dateTime;
  MealType? _mealType;


  ConvenienceFoodType? get foodType => _foodType;
  DimigoinUser? get student => _student;
  bool? get isCheckin => _isCheckin;
  DateTime? get dateTime => _dateTime;
  MealType? get mealType => _mealType;


  DalgeurakConvenienceFood({
    ConvenienceFoodType? foodType,
    required DimigoinUser? student,
    bool? isCheckin,
    DateTime? dateTime,
    MealType? mealType,
  }){
    _foodType = foodType;
    _student = student;
    _isCheckin = isCheckin;
    _dateTime = dateTime;
    _mealType = mealType;
}

  DalgeurakConvenienceFood.fromJson(dynamic json) {
    _foodType = json['foodType'];
    _student = json['student'];
    _isCheckin = json['checkin'];
    _dateTime = json['date'];
    _mealType = json['time'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['foodType'] = _foodType;
    map['student'] = _student;
    map['checkin'] = _isCheckin;
    map['date'] = _dateTime;
    map['time'] = _mealType;
    return map;
  }

}