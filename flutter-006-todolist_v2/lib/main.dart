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
  var todoList = [];

//   var todoList = [
//     Todo(
//       sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
//       stime: DateFormat("HH:ss:mm").format(DateTime.now()),
//       content: "오늘은 금요일",
//       complete: false,
//     ),
//     Todo(
//       sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
//       stime: DateFormat("HH:ss:mm").format(DateTime.now()),
//       content: "Flutter 프로젝트",
//       complete: false,
//     )
//   ];

  Todo getTodo(String content) => Todo(
        sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
        stime: DateFormat("HH:mm:ss").format(DateTime.now()),
        content: content,
        complete: false,
      );

  Widget alertDialog(BuildContext context) => AlertDialog(
        actions: [
          TextField(
            // keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.go,
            onSubmitted: (value) {
              var snackBar = SnackBar(
                content: Text("$value가 추가되었음"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              var todo = getTodo(value);
              Navigator.of(context).pop();
              setState(() {
                todoList.add(todo);
              });
            },
            decoration: const InputDecoration(
              hintText: "할일을 입력해주세요",
            ),
          )
        ],
      );
  @override
  Widget build(BuildContext context) {
    // state 클래스 내의 함수를 실행하여 결과를 가져온 후 todolist를 만든다.
    // 이때 클래스 내의 함수를 호출하여 다른 변수를 만드는 경우
    // 이 코드는 build 함수 내부에서 실행해야 한다.
    // todoList.add(value) = [
    //   getTodo("flutter project"),
    //   getTodo("피곤한 하루"),
    // ];

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
            onTap: () {},
            selectedColor:
                const Color.fromARGB(98, 79, 179, 236).withOpacity(0.5),
            splashColor:
                const Color.fromARGB(255, 88, 105, 202).withOpacity(0.5),
            title: Dismissible(
              key: Key(todoList[index].content),
              background: Container(color: Colors.green),
              onDismissed: (direction) {
                setState(() {
                  todoList.removeAt(index);
                });
              },
              child: Padding(
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
            ),
          );
        },
      ),
    );
  }
}
