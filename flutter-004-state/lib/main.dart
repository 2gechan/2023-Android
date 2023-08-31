import 'package:flutter/material.dart';
import 'package:state/main_app_bar.dart';
import 'package:state/main_app_bar.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "Flutter State",
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomePage(),
    );
  }
}

/// => StartPage()
/// StartPage class의 생성자를 호출하여 StartPage의 객체를 생성하여
/// return 해라 라는 의미
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => StartPage();
}

/// State Widget 에서는 StatefulWidget과 관계를 명확하기 위하여
/// Generic(<HomePage>)을 연결하여 준다
class StartPage extends State<HomePage> {
  /// State 클래스 위젯에서 titles 배열 변수를 생성
  /// 이 순간 titles는 state가 된다
  /// state는 화면 rendering, 또는 동적인 활동을 감시할 수 있는 동적 변수
  var titles = [
    "Hello Korea",
    "Hi",
    "안녕",
    "또 만나요",
  ];
  ListView appBarBody() => ListView.builder(
        itemBuilder: (context, index) {
          return const ListTile();
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      body: const Center(
        child: Text(
          "안녕",
          style: TextStyle(fontSize: 50, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
