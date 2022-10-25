part of dimigoin_flutter_plugin;



/// 달그락 간편식 모델 클래스
class DalgeurakConvenienceFood {
  ConvenienceFoodType? _foodType;
  DimigoinUser? _student;


  ConvenienceFoodType? get foodType => _foodType;
  DimigoinUser? get student => _student;


  DalgeurakConvenienceFood({
    required ConvenienceFoodType? foodType,
    required DimigoinUser? student
  }){
    _foodType = foodType;
    _student = student;
}

  DalgeurakConvenienceFood.fromJson(dynamic json) {
    _foodType = json['foodType'];
    _student = json['student'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['foodType'] = _foodType;
    map['student'] = _student;
    return map;
  }

}