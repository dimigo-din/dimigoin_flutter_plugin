part of dimigoin_flutter_plugin;

/// 디미고인 시간표 클래스
class DimigoinTimetable {

  /// 디미고인 서버에서 반별 주간 시간표 정보를 불러오는 함수입니다.
  ///
  /// @returns 주간 시간표를 List 형태로 반환합니다.
  getWeeklyTimeTable(int gradeNum, int classNum) async {
    try {
      Response response = await _dio.get('$apiUrl/timetable/weekly/grade/$gradeNum/class/$classNum');

      List originalData = response.data['timetable'];

      List<List<String>> resultData = [];
      for (Map data in originalData) {
        resultData.add((data['sequence'] as List).cast<String>());
      }

      return resultData;
    } on DioError catch (e) {
      return {
        "success": false,
        "content": e.response?.data["message"]
      };
    }
  }
}
