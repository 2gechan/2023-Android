# Flutter firebase 연동 프로젝트

- `auth(인증)`, `fireStore(DBMS)`, `real Database(DBMS)` 등을 연동하여 프로젝트를 구현할 수 있다.
- 다른 프로젝트(react)에서는 Hosting 등도 사용할 수 있다.

## firebase-auth

- `firebase`를 통하여 `Email 방식의 회원가입`, `Email 방식의 로그인`을 구현할 수 있다.
- `google login` 등 `oAuth2(인증 Token)` 방식의 인증을 구현할 수 있다.

## DBMS 연동 : fireStore, real Database

- `NoSQL` 방식으로 Data CRUD를 구현할 수 있고,
- `1:1` 방식의 채팅 구현
- `Message` 전달 등도 구현

## Flutter와 firebase를 연동하기 위하여 사전 도구 설치

- Cli 도구 설치 : `npm install -g firebase-tools@latest`
- 설치 확인 : `firebase --version`

## firebase 프로젝트 생성하기

- `firebase.goole.com` 사이트에서 새로운 프로젝트 생성하기
- 생성된 프로젝트에 앱 추가하기
  ![Alt text](image.png)
