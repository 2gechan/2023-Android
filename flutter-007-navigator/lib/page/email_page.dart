import 'package:flutter/material.dart';

class EMailPage extends StatefulWidget {
  const EMailPage({super.key});

  @override
  State<StatefulWidget> createState() => _EMailPage();
}

class _EMailPage extends State<EMailPage> {
  @override
  Widget build(BuildContext context) {
    /// ModalRoute 객체로 부터 설정 값(settings)을 getter 하고
    /// 설정 값들 중에서 arguments 값을 getter 하여 args 에 Map type으로 저장
    Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text("E-Mail Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("여기는 Email Page"),
            Text("Email ${args["email"]}"),
            Text("Password ${args["password"]}"),
            ElevatedButton(
              // pushNamed를 사용하려면 main에서 routes를 사용해야한다.
              onPressed: () => Navigator.of(context).pushNamed("/mypage"),
              child: const Text("My Page"),
            ),
          ],
        ),
      ),
    );
  }
}
