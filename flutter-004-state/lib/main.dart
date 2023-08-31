import 'dart:math';

import 'package:flutter/material.dart';
import 'package:state/main_app_bar.dart';
import 'package:state/main_app_bar.dart';
import 'package:state/student.dart';

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
  final titles = [
    // final로 생성해도 값이 추가되는 이유는
    // 배열로 선언하여 그 내부의 요소들만
    // 변경 되는 것이기 때문에 값을 추가할 수 있다.
    "Hello Korea",
    "Hi",
    "안녕",
    "또 만나요",
  ];

  final studentList = [
    Student(stNum: "001", stName: "홍길동"),
    Student(stNum: "002", stName: "제임스"),
    Student(stNum: "003", stName: "이몽룡"),
    Student(stNum: "004", stName: "김진수"),
    Student(stNum: "005", stName: "장보고"),
  ];

  /// 동적으로 변화되는 배열(리스트) 요소들을 화면에 출력하기 위하여
  /// ListView.builder() 함수를 사용하여 각 요소를 디자인한다.
  ListView appBarBody() => ListView.builder(
        itemCount: studentList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Material(
              child: InkWell(
                onTap: () {
                  var snackBar = SnackBar(
                    content: Text(studentList[index].stName),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                highlightColor:
                    const Color.fromARGB(255, 189, 15, 15).withOpacity(0.7),
                splashColor:
                    const Color.fromARGB(255, 139, 241, 22).withOpacity(0.7),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text(studentList[index].stNum),
                      Text(studentList[index].stName),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("안녕하세요"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                var rnd = Random().nextDouble();

                ///
                setState(() {
                  titles.add(rnd.toString());
                });
              },
              icon: const Icon(Icons.add_alert_outlined))
        ],
      ),
      body: appBarBody(),
    );
  }
}
