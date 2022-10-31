part of dimigoin_flutter_plugin;



/// 달그락 간편식 모델 클래스
class DalgeurakConvenienceFood {
  ConvenienceFoodType? _foodType;
  DimigoinUser? _student;
  bool? _isCheckin;


  ConvenienceFoodType? get foodType => _foodType;
  DimigoinUser? get student => _student;
  bool? get isCheckin => _isCheckin;


  DalgeurakConvenienceFood({
    required ConvenienceFoodType? foodType,
    required DimigoinUser? student,
    required bool? isCheckin,
  }){
    _foodType = foodType;
    _student = student;
    _isCheckin = isCheckin;
}

  DalgeurakConvenienceFood.fromJson(dynamic json) {
    _foodType = json['foodType'];
    _student = json['student'];
    _isCheckin = json['checkin'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['foodType'] = _foodType;
    map['student'] = _student;
    map['checkin'] = _isCheckin;
    return map;
  }

}