import 'package:flutter/material.dart';

void main(List<String> args) {
  const app = MyApp();
  runApp(app);
}

/// 스마트폰 어플을 만들기 위해서 가장 바깥쪽의 box를 설정하는데
/// MaterialApp() 이라는 Widget을 사용한다.
/// MaterialApp()은 home 이라는 Named Parameter를 가지고 있고
/// 이 home 매개변수에 어떤 Widget을 부착하여 화면을 그리도록 한다.
/// MaterialApp()은 스마트 기기에서 어플이 시작되도록 context를 구현하는
/// Widget 도구이다. 실제로 이 Widget이  하늘일은 화면에 무엇인가 나타내는 것이 아니다.
class MyApp extends StatelessWidget {
  // StatelessWidget은 기본 틀을 만들기 위해 사용
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

// 여기서 부터 화면에 무엇인가 나타내는 코드가 시작된다.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => StartPage();
}

class StartPage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("여기는 실제 페이지"),
    );
  }
}
