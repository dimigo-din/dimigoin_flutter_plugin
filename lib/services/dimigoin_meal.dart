part of dimigoin_flutter_plugin;

/// 디미고인 급식 클래스
class DimigoinMeal {

  /// 디미고인 서버에서 주간 급식 정보를 불러오는 함수입니다.
  ///
  /// @returns 급식정보를 List 형태로 반환합니다.
  getWeeklyMeal() async {
    try {
      Response response = await _dio.get('$apiUrl/meal/weekly');

      return response.data['meals'];
    } catch (e) {
      return [];
    }
  }

  /// 디미고인 서버에서 일간 급식 정보를 불러오는 함수입니다.
  ///
  /// @param [getTodayInfo] 당일날의 급식 정보를 불러올건지 확인하기 위한 bool형 변수입니다.
  /// @param [date] 급식 정보를 불러올 날짜를 지정하는 bool형 비필수 변수입니다. 형식은 YYYY-MM-DD입니다.
  /// @returns 급식 정보를 Map 형태로 반환합니다.
  getDailyMeal(bool getTodayInfo, {String? date}) async {
    try {
      String mealApiUrl = getTodayInfo ? "$apiUrl/meal/today" : "$apiUrl/meal/date/$date";

      Response response = await _dio.get(mealApiUrl);

      return response.data['meal'];
    } catch (e) {
      return {};
    }
  }
}
