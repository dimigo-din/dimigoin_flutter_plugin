part of dimigoin_flutter_plugin;


/// 달그락 경고 모델 클래스
class DalgeurakWarning {
  String? _id;
  List<StudentWarningType>? _warningTypeList;
  String? _reason;
  int? _studentUid;
  DateTime? _date;


  String? get id => _id;
  List<StudentWarningType>? get warningTypeList => _warningTypeList;
  String? get reason => _reason;
  int? get studentUid => _studentUid;
  DateTime? get date => _date;


  DalgeurakWarning({
    required String? id,
    required List<StudentWarningType>? warningTypeList,
    required String? reason,
    required int? studentUid,
    required DateTime? date,}){
    _id = id;
    _warningTypeList = warningTypeList;
    _reason = reason;
    _studentUid = studentUid;
    _date = date;
}

  DalgeurakWarning.fromJson(dynamic json) {
    _id = json['_id'];
    _warningTypeList = (json['type'] as List).cast<String>().map((v) => v.convertStudentWarningType).cast<StudentWarningType>().toList();
    _reason = json['reason'];
    _studentUid = json['student'];
    _date = DateTime.parse(json['date']);
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['type'] = _warningTypeList?.map((v) => v.convertEngStr).cast<String>().toList();
    map['reason'] = _reason;
    map['student'] = _studentUid;
    map['date'] = date.toString();
    return map;
  }

}