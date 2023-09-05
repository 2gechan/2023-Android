import 'package:flutter/material.dart';
import 'package:navigator/page/email_page.dart';
import 'package:navigator/page/home_page.dart';
import 'package:navigator/page/my_page.dart';

Widget mainDrawer(BuildContext context) => Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                "gechan",
              ),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage("images/profile.jpg"),
              )
            ],
            accountName: Text("gechan"),
            accountEmail: Text("github.com/2gechan"),
          ),
          ListTile(
            title: const Text(
              "Home",
              style: TextStyle(color: Colors.cyan),
            ),
            leading: const Icon(
              Icons.home,
              color: Colors.blue,
            ),
            onTap: () {
              debugPrint("Home 메뉴가 클릭됨");
              const HomePage();

              /// 스마트 기기에서 현재 화면을 다른 화면으로 전환하기
              /// web, pc 어플리케이션에서는 단순히 화면을 전환하는데
              /// 별 어려움이 없이 수행이 가능하다.
              /// 스마트 기기에서는 화면 하나 하나가 context 이다.
              /// 화면을 전환 시킬 때도 context를 잘 관리해야한다.
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
          const Divider(
            height: 0.2,
            color: Colors.black,
          ),
          ListTile(
            title: const Text(
              "MyPage",
              style: TextStyle(color: Colors.cyan),
            ),
            leading: const Icon(
              Icons.people,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const MyPage()),
              );
            },
          ),
          ListTile(
            title: const Text(
              "e-mail",
              style: TextStyle(color: Colors.cyan),
            ),
            leading: const Icon(
              Icons.email,
              color: Colors.blue,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                "/email",
                arguments: {"email": "github.com/2gechan"},
              );
            },
          ),
          const Divider(
            height: 0.2,
            color: Colors.black,
          ),
        ],
      ),
    );
