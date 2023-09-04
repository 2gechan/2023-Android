# TodoList 프로젝트

- 날짜 시간 등을 처리할 Dependency를 add 하기
- `intl`은 날짜 시간 `locale`, 화폐 단위 등을 처리할 때 사용하는 여러가지 함수를 지원하는 도구

```bash
flutter pub get intl
```

## persistance 설정

- 영속적 Data 관리
- DBMS나 파일에 데이터를 저장하여 app이 종료되어도 그 값을 유지하도록 하는 것
- phone에 기본적으로 내장된 DBMS를 사용하기 : `SQLite`를 사용하여 data를 저장하기

```bash
flutter pub add sqflite
flutter pub add path
```
