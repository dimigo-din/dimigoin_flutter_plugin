part of dimigoin_flutter_plugin;



/// 달그락 간편식 모델 클래스
class DalgeurakConvenienceFood {
  ConvenienceFoodType? _foodType;
  DimigoinUser? _student;
  bool? _isCheckin;
  DateTime? _dateTime;


  ConvenienceFoodType? get foodType => _foodType;
  DimigoinUser? get student => _student;
  bool? get isCheckin => _isCheckin;
  DateTime? get dateTime => _dateTime;


  DalgeurakConvenienceFood({
    ConvenienceFoodType? foodType,
    required DimigoinUser? student,
    bool? isCheckin,
    DateTime? dateTime,
  }){
    _foodType = foodType;
    _student = student;
    _isCheckin = isCheckin;
    _dateTime = dateTime;
}

  DalgeurakConvenienceFood.fromJson(dynamic json) {
    _foodType = json['foodType'];
    _student = json['student'];
    _isCheckin = json['checkin'];
    _dateTime = json['date'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['foodType'] = _foodType;
    map['student'] = _student;
    map['checkin'] = _isCheckin;
    map['date'] = _dateTime;
    return map;
  }

}