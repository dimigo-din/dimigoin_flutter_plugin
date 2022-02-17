# dimigoin_flutter_plugin
[![pub package](https://img.shields.io/pub/v/dimigoin_flutter_plugin.svg)](https://pub.dev/packages/dimigoin_flutter_plugin)  

디미고 관련 어플리케이션 개발을 위한 디미고인 플러터 플러그인입니다.

## Getting Started

### 의존성

먼저 첫 번째로, `pubspec.yaml`파일에 아래 코드를 작성하여 프로젝트에 본 플러그인을 추가합니다.
```yaml
dependencies:
  dimigoin_flutter_plugin: ^0.1.0
```

본 플러그인에서는 아래 리스트와 같은 패키지를 사용합니다. 개발을 진행할 떄 참고해주세요.
1. [dio](https://pub.dev/packages/dio) (4.0.4)
1. [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) (5.0.2)


### 프로젝트 사전 작업
본 플러그인은 flutter_secure_storage 패키지를 사용하며, 그로 인해 실행하기 위해선 최저 안드로이드 버전을 설정해주어야 합니다.
`android/app/build.gradle`파일의 `minSdkVersion`을 18 이상으로 바꾸어주세요.
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

디미고인 계정 로그인을 구현하는 코드는 다음과 같습니다.
```dart
import 'package:dimigoin_flutter_plugin/dimigoin_flutter_plugin.dart';

// 디미고인 로그인 Object 생성
DimigoinLogin _dimigoinLogin = DimigoinLogin();

// 계정 로그인
bool isLoginSuccess = await _dimigoinLogin.login(userId, userPassword);

// 계정 로그아웃
bool isLogoutSuccess = await _dimigoinLogin.logout();

// RefreshToken을 이용한 AccessToken Refresh
bool isTokenRefreshSuccess = await _dimigoinLogin.refreshAccessToken();

// 로컬 Storage에 저장된 AccessToken 불러오기
await _dimigoinLogin.loadSavedToken();

// 로컬 Storage에 저장된 유저 정보 불러오기
await _dimigoinLogin.loadUserInfo();
```

## Author

[@doch13_](https://github.com/doch2)
