import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.updateAuthUser,
  });

// main.dart에 선언된 _authUser 변수를 update할 함수 사용할 준비
  final Function(User? user) updateAuthUser;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailInputFoucs = FocusNode();
  final _passwordInputFoucs = FocusNode();

  final _formKey = GlobalKey<FormState>();

  String _emailValue = "";
  String _passwordValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "로그인이 필요합니다.",
            style: TextStyle(fontSize: 20),
          ),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) => _emailValue = value,
                    focusNode: _emailInputFoucs,
                  ),
                  TextFormField(
                    focusNode: _passwordInputFoucs,
                    onChanged: (value) => _passwordValue = value,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        onPressed: () async {
                          try {
                            if (_formKey.currentState!.validate()) {
                              // 로그인에 성공하면 result에 사용자 정보가 담기게 된다.
                              var result = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: _emailValue,
                                password: _passwordValue,
                              );
                              // main.dart의 _authUser State에 로그인한 사용자 정보
                              // Update 요청하기
                              widget.updateAuthUser(result.user);

                              // 화면전환, SnackBar 등을 화면에 표현하고자 할 때
                              // Don't use BuildContext ... 의 경고가 나타나면
                              // 아래의 코드를 먼저 실행하도록 추가한다.
                              // BuildContext(context)가 아직 완전히 생성되지 않거나
                              // 어떤 이유로 context가 사라질수도 있는데
                              // 사용상 주의하라 라는 경고
                              // mounted 라는 시스템 변수가 생성되었는지 확인한 후
                              // context 관련 코드를 실행하라 라는 의미
                              if (!mounted) return;
                              Navigator.of(context).pop();
                            }
                          } on FirebaseAuthException {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("")),
                            );
                          }
                        },
                        child: const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            backgroundColor: Colors.green),
                        onPressed: () async {
                          try {
                            final GoogleSignInAccount? googleUser =
                                await GoogleSignIn().signIn();

                            final GoogleSignInAuthentication? googleAuth =
                                await googleUser?.authentication;

                            if (googleUser == null || googleAuth == null) {
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("구글 Login 실패"),
                                ),
                              );
                            } else {
                              final credential = GoogleAuthProvider.credential(
                                  accessToken: googleAuth.accessToken,
                                  idToken: googleAuth.idToken);
                              // google에게 로그인 요청

                              // google이 보내준 인증정보를 사용하여
                              // firebase에 로그인 하기
                              // oAuth2 방식의 로그인
                              final userCredential = await FirebaseAuth.instance
                                  .signInWithCredential(credential);

                              await widget.updateAuthUser(userCredential.user);

                              if (!mounted) return;
                              Navigator.of(context).pop();
                            }
                          } catch (e) {
                            if (!mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          }
                        },
                        child: const SizedBox(
                          width: double.infinity,
                          child: Text(
                            "Google Login",
                            textAlign: TextAlign.center,
                          ),
                        )),
                  )
                ],
              ))
        ],
      )),
    );
  }
}
