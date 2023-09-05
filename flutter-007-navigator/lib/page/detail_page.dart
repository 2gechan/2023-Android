import 'package:flutter/material.dart';
import '/models/user.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.name,
    required this.email,
    required this.userDto,
  });
  final String name;
  final String email;
  final User userDto;

  @override
  State<StatefulWidget> createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("자세히 보기"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("여기는 자세히 보기 페이지"),
            Text("이름 : ${widget.name}"),
            Text("Email : ${widget.email}"),
            Text("유저이름 : ${widget.userDto.username}"),
            Text("패스워드 : ${widget.userDto.password}"),
            Text("별명 : ${widget.userDto.nickname}"),
            Text("전화번호 : ${widget.userDto.tel}"),
          ],
        ),
      ),
    );
  }
}
