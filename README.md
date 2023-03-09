# dimigoin_flutter_plugin
[![pub package](https://img.shields.io/pub/v/dimigoin_flutter_plugin.svg)](https://pub.dev/packages/dimigoin_flutter_plugin)  

디미고 관련 어플리케이션 개발을 위한 디미고인 플러터 플러그인입니다.

## Getting Started

### 의존성

먼저 첫 번째로, `pubspec.yaml`파일에 아래 코드를 작성하여 프로젝트에 본 플러그인을 추가합니다.
```yaml
dependencies:
  dimigoin_flutter_plugin: ^1.0.3
```

본 플러그인에서는 아래 리스트와 같은 패키지를 사용합니다. 개발을 진행할 떄 참고해주세요.
1. [dio](https://pub.dev/packages/dio) (4.0.4)
1. [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) (5.0.2)
1. [socket_io_client](https://pub.dev/packages/socket_io_client) (^2.0.0-beta.4-nullsafety.0) - Socket.io 서버 버전과의 호환을 위해 플러그인은 Prerelease 버전을 사용합니다.


### 프로젝트 사전 작업
본 플러그인은 flutter_secure_storage 패키지를 사용하며, 그로 인해 실행하기 위해선 최저 안드로이드 버전을 설정해주어야 합니다.
`android/app/build.gradle` 파일의 `minSdkVersion`을 18 이상으로 바꾸어주세요.
```gradle
android {
    ..
    defaultConfig {
        ..
        minSdkVersion 18
        ..
    }
}
```

### 구현 가이드

먼저 플러그인을 사용하기 위하여, 어플리케이션을 시작함과 동시에 본 플러그인을 초기화 시켜주어야 합니다.
`main.dart` 파일에 아래 코드를 추가해주세요.
```dart
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DimigoinFlutterPlugin().initializeApp();

  runApp(MyApp());
}
```

디미고인 계정 로그인을 구현하는 코드는 다음과 같습니다.
```dart
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

// 디미고인 로그인 Object 생성
DimigoinAccount _dimigoinAccount = DimigoinAccount();

// 현재 로그인 되어 있을 경우, 저장되어 있는 계정 정보 불러오기
DimigoinUser currentUser = _dimigoinAccount.currentUser;

// 계정 정보 변동시 자동으로 계정 정보를 DimigoinUser 형태로 보내주는 Stream
Stream<DimigoinUser?> userChangeStream = _dimigoinAccount.userChangeStream;

// 현재 로그인 되어 있을 경우, 서버에 저장되어있는 계정 정보 받아오기
await _dimigoinAccount.fetchAccountData();

// 계정 로그인
bool isLoginSuccess = await _dimigoinAccount.login(userId, userPassword);

// 계정 로그아웃
bool isLogoutSuccess = await _dimigoinAccount.logout();

// RefreshToken을 이용한 AccessToken Refresh
bool isTokenRefreshSuccess = await _dimigoinAccount.refreshAccessToken();

// 로컬 Storage에 저장된 AccessToken 불러오기
await _dimigoinAccount.loadSavedToken();

// 현재 로컬 Storage에 저장되어 있는 AccessToken의 유효기간이 만료되지 않았는지 확인
bool isValidateAccessToken = await _dimigoinAccount.validateAccessToken();

// 현재 디미고인 계정에 로그인 되어있는지 확인
bool isNowLogin = await _dimigoinAccount.checkNowLogin();
```

디미고인에서 제공하는 급식 정보를 불러오는 코드는 다음과 같습니다.
```dart
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

// 디미고인 급식 Object 생성
DimigoinMeal _dimigoinMeal = DimigoinMeal();

// 주간 급식 정보 불러오기
List weeklyMeal = await _dimigoinMeal.getWeeklyMeal();

// 일간 급식 정보 불러오기
Map dailyMeal = await _dimigoinMeal.getDailyMeal(getTodayInfo, date); //getTodayInfo가 true일 경우, date는 작성하지 않습니다.
```

달그락 서비스와 관련된 API를 사용하는 코드는 다음과 같습니다. 서비스에 자주 사용하는 함수만 작성하였으니, 모든 함수를 확인하시고 싶으시다면 [API Reference](https://pub.dev/documentation/dimigoin_flutter_plugin/latest/)를 확인해주세요.
```dart
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

// 달그락 서비스 Object 생성
DalgeurakService _dalgeurakService = DalgeurakService();

// 학생 본인이 체크인 진행 - getUserMealInfo 함수를 통해 받은 토큰을 매개변수 값으로 입력함
Map result = await _dalgeurakService.mealCheckInWithJWT(jwtToken);

// 관리자가 체크인 진행
Map result = await _dalgeurakService.mealCheckInByManager(studentId, studentName);

// 학생이 직접 선/후밥을 신청
Map result = await _dalgeurakService.setUserMealException(exceptionType, reason);

// 학생의 현재 입장 여부, 선/후밥 여부를 확인
Map result = await _dalgeurakService.getUserMealInfo();

// 모든 학년의 급식 반 순서 불러오기
Map result = await _dalgeurakService.getMealSequence();

// 각 학년의 급식 반 순서 지정하기
Map result = await _dalgeurakService.setMealSequence(grade, mealType, sequence);

// 모든 학년의 급식 시간 불러오기
Map result = await _dalgeurakService.getMealTime();

// 각 학년의 급식 시간 지정하기
Map result = await _dalgeurakService.setMealTime(grade, mealType, time);

// 급식 줄이 밀렸을 경우 반의 급식 시간들을 미루기
Map result = await _dalgeurakService.setMealExtraTime();
```

## Author

[@doch13_](https://github.com/doch2)
