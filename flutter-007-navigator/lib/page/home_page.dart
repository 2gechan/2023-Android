import 'package:flutter/material.dart';
import '/models/user.dart';
import '/page/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    // required this.name,
    // required this.email,
  });

  // final String name;
  // final String email;

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("여기는 홈페이지"),
            ElevatedButton(
              onPressed: () {
                var user = User(
                  username: "username",
                  password: "password",
                  nickname: "nickname",
                  email: "email",
                  tel: "tel",
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      name: "홍길동",
                      email: "github.com/2gechan",
                      userDto: user,
                    ),
                  ),
                );
              },
              child: const Text("자세히 보기"),
            )
          ],
        ),
      ),
    );
  }
}
