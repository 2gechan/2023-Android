# firebase_auth를 이용하여 인증하기

- firebase console 에서 `빌드/authentication` 선택

## 기본인증 선택하기

- 기본 인증은 `이메일/비밀번호` 선택하기

## firebase fireStore 사용하기

- dependency 설치

```bash
flutter pub add cloud_firestore
flutter clean
flutter pub get
```

## 배포시 Dex 오류 발생하는 경우

- `project / android / app / build.gradle` 파일을 찾는다
- 파일에서 `defaultConfig` 항목을 찾는다. `multiDexEnabled true` 추가

```kt
 defaultConfig {
    versionName flutterVersionName
    multiDexEnabled true
 }
```
