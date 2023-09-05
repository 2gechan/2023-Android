import 'package:flutter/material.dart';
import 'package:navigator/models/user.dart';
import 'package:navigator/page/user_input.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("여기는 마이페이지"),
            ElevatedButton(
                onPressed: () async {
                  var userDto = User(
                    username: "user1",
                    password: "1234",
                    nickname: "유저1",
                    email: "qwe@qwe.com",
                    tel: "010-1111-1111",
                  );
                  var result = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UserInput(userDto: userDto),
                    ),
                  );
                  var resultStr = """
                        username = ${result.username},
                        password = ${result.password},
                        nickname = ${result.nickname},
                  """;
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(resultStr),
                      duration: const Duration(seconds: 5),
                    ),
                  );
                },
                child: const Text("정보수정"))
          ],
        ),
      ),
    );
  }
}
