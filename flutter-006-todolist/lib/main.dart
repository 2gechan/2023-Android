import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/todo.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  var todoList = [
    Todo(
      sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      stime: DateFormat("HH:ss:mm").format(DateTime.now()),
      content: "오늘은 금요일",
      complete: false,
    ),
    Todo(
      sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      stime: DateFormat("HH:ss:mm").format(DateTime.now()),
      content: "Flutter 프로젝트",
      complete: false,
    )
  ];

  Widget alertDialog(BuildContext context) => AlertDialog(
        actions: [
          TextField(
            // keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.go,
            onSubmitted: (value) {
              var snackBar = SnackBar(content: Text(value));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            decoration: const InputDecoration(
              hintText: "할일을 입력해주세요",
            ),
          )
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Image.asset(
            "images/profile.jpg",
            fit: BoxFit.fill,
          ),
          title: const Text("나의 todo 리스트"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => alertDialog(context),
                  );
                },
                icon: const Icon(Icons.add)),
          ]),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(todoList[index].sdate),
                      Text(todoList[index].stime),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        todoList[index].content,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
