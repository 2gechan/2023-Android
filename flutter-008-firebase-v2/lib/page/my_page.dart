import 'package:firebase/page/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage(
      {super.key, required this.authUser, required this.updateAuthUser});

  final Function(User? user) updateAuthUser;
  final User? authUser;

  @override
  State<StatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final User? _authUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("마이페이지"),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pop(context);
              await FirebaseAuth.instance.signOut();
              widget.updateAuthUser(null);
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: widget.authUser != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("로그인한 사용자 ${_authUser!.email}"),
                  Text("로그인한 UserId ${_authUser!.uid}"),
                ],
              )
            : SimpleDialog(
                title: const Text(
                  "로그인이 필요한 서비스 입니다",
                  style: TextStyle(fontSize: 25, color: Colors.red),
                ),
                children: [
                  const Padding(padding: EdgeInsets.fromLTRB(30, 0, 30, 20)),
                  ElevatedButton(
                      onPressed: () => Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginPage(
                              updateAuthUser: widget.updateAuthUser,
                            ),
                          )),
                      child: const Text("로그인"))
                ],
              ),
      ),
    );
  }
}
