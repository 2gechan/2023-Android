import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "나의 앱",
          ),
        ),
        body: ListView(
          children: [
            Image.asset(
              "images/title_image.jpg",
              height: 700,
              fit: BoxFit.cover,
            ),
            titleSection,
            textSection(),
            textSection(),
            textSection(),
            textSection(),
            textSection(),
          ],
        ),
      ),
    );
  }

  /// 컨테이너 위젯
  /// Container : padding, margin 을 부여하는 box
  /// Expanded : 부모 box를 가득 채우는 구조의 box
  /// Padding : padding을 기본 값으로 갖는 box

  // Widget 변수 선언하기
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Text(
                  "안녕하세요",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Text(
                "우리나라 자랑",
                style: TextStyle(color: Colors.green),
              )
            ],
          ),
        ),
        const Icon(
          Icons.delete,
          color: Colors.red,
        ),
        const Text("삭제")
      ],
    ),
  );

  // Widget 함수 선언하기
  Widget textSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      // margin: const EdgeInsets.all(32),
      child: const Text(
        "갈비찜덮밥"
        "갈비찜덮밥"
        "갈비찜덮밥"
        "갈비찜덮밥"
        "갈비찜덮밥"
        "갈비찜덮밥"
        "갈비찜덮밥",
        softWrap: true,
      ),
    );
  }

  Widget colMethod() {
    return const Column(
      children: [
        Text(
          "대한민국",
          style: TextStyle(
              // size는 단위가 없다.
              // 이 크기는 Pixel Ratio 값을 곱하여 Pixcel로 표현한다.
              fontSize: 30,
              // color를 지정하면 MaterialApp에 Theme를 설정했을 경우
              // 실제 color와 다르게 보일 수 있다.
              color: Colors.blue),
        ),
        Text(
          "우리나라",
          style: TextStyle(
              // size는 단위가 없다.
              // 이 크기는 Pixel Ratio 값을 곱하여 Pixcel로 표현한다.
              fontSize: 20,
              // color를 지정하면 MaterialApp에 Theme를 설정했을 경우
              // 실제 color와 다르게 보일 수 있다.
              color: Colors.black),
        ),
        Text(
          "만세",
          style: TextStyle(
              // size는 단위가 없다.
              // 이 크기는 Pixel Ratio 값을 곱하여 Pixcel로 표현한다.
              fontSize: 10,
              // color를 지정하면 MaterialApp에 Theme를 설정했을 경우
              // 실제 color와 다르게 보일 수 있다.
              color: Colors.red),
        ),
      ],
    );
  }
}

class FootPage extends StatefulWidget {
  const FootPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return CopyRight();
  }
}

class CopyRight extends State<FootPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("CopyRight github.2gechan"),
    );
  }
}
