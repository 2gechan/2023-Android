import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist/models/todo.dart';
import 'package:todolist/service/todo_service.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  /// **Controller
  /// flutter의 대부분의 Widget에는 위젯 Controller라는 객체가 있다
  /// HTML의 id 속성에 해당하는 객체이다.
  var inputController = TextEditingController();
  var todoContent = "";
  var todoList = [];

  Todo getTodo(String content) => Todo(
        sdate: DateFormat("yyyy-MM-dd").format(DateTime.now()),
        stime: DateFormat("HH:mm:ss").format(DateTime.now()),
        content: content,
        complete: false,
      );

  /// Scaffold
  /// 처음 화면의 layout을 꾸밀 때 사용하는 Widget이다
  /// appBar, body, bottomSheet가 있는데
  /// appBar는 화면의 머릿글에 해당하는 부분
  /// body는 본문(중앙)에 해당하는 부분
  /// bottomSheet는 화면의 footer에 해당하는 부분
  /// body는 보통 데이터를 표현하는 부분, 여긴 Scroll이 일어나는 부분
  /// appBar, bottomSheet는 body가 변화되더라도 Scroll이 되지 않는 부분
  /// bottomsheet는 입력화면에서 소프트 키보드가 나타나면 키보드 위에 표현되는 부분
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
      bottomSheet: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  // TextField에 id(Controller) 설정하기
                  controller: inputController,
                  onChanged: (value) => setState(() {
                    todoContent = value;
                  }),
                  decoration: InputDecoration(
                    prefix: const SizedBox(
                      width: 20,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => inputController.clear(),
                      icon: const Icon(Icons.clear),
                    ),
                    hintText: "할일을 입력해 주세요",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              IconButton(
                  onPressed: () {
                    var todo = getTodo(todoContent);
                    setState(() {
                      // todoList.add(todo);
                      TodoService().insert(todo);
                      todoContent = "";
                      inputController.clear();
                    });
                  },
                  icon: const Icon(Icons.send_outlined))
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: FutureBuilder(
            // future는 실제 데이터를 가져오는 속성
            // 여기에서 가져온 데이터는 builder에게 snapshot에 담아서 전달
            future: TodoService().selectAll(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return todoListView(
                  snapshot: snapshot,
                );
              } else {
                return const Center();
              }
            }),
      ),
    );
  }

  /// ListView return type을 Widget으로 변경하기
  /// 모든 Widget은 가장 상위 클래스인 Widget을 상속받고 있기 때문에
  /// 모든 Widget의 return type은 Widget으로 설정하여도 된다.
  Widget todoListView({required AsyncSnapshot<List<Todo>> snapshot}) {
    // snapshot으로 부터 실제 todoList를 뽑아서 todoList에 담기
    var todoList = snapshot.data!;
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return ListTile(
          // onTap: () {},
          selectedColor:
              const Color.fromARGB(98, 79, 179, 236).withOpacity(0.5),
          splashColor: const Color.fromARGB(255, 88, 105, 202).withOpacity(0.5),
          title: Dismissible(
            // Key(todoList[index].content),
            // 만약 todolist 데이터가 없는 경우
            // key의 값이 null이 된다.
            // flutter에서 제공하는 uuid 인 UniqueKey()를 사용한다.
            key: UniqueKey(),
            // 왼쪽에서 오른쪽으로 Swipe를 했을 때 나타나는 Widget
            background: Container(
              margin: const EdgeInsets.all(8),
              color: Colors.green,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: const Icon(
                Icons.save,
                size: 36,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              child: const Icon(
                Icons.delete,
                size: 36,
                color: Colors.white,
              ),
            ),

            /// 사라지기 전의 event
            /// event 핸들러에서 Future.value(true)를 return 하면
            /// swipe 행위가 진행되고, false를 return 하면 진행을 멈춘다.
            confirmDismiss: (direction) => onConfirmHandler(direction, index),

            /// confirmDismiss에서 true가 return 되었을 때 할일
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                setState(() {
                  todoList[index].complete = !todoList[index].complete;
                });
              } else if (direction == DismissDirection.endToStart) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${todoList[index].content}를 삭제하였습니다."),
                  ),
                );
                setState(() {
                  todoList.removeAt(index);
                });
              }
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
                        style: todoList[index].complete
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 20,
                                color: Color.fromARGB(255, 167, 166, 166))
                            : const TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool?> onConfirmHandler(direction, index) {
    if (direction == DismissDirection.startToEnd) {
      return completeConfirm(index);
    } else if (direction == DismissDirection.endToStart) {
      return deleteConfirm(index);
    }
    // Future : 화면에 state에 의해서 변화를 감지하는 객체
    return Future.value(false);
  }

  Future<bool?> deleteConfirm(index) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("삭제할까요?"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text("예"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("아니오"),
          )
        ],
      ),
    );
  }

  Future<bool?> completeConfirm(index) {
    var yesNo = todoList[index].complete ? "완료처리를 취소할까요" : "완료처리를 할까요?";
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(yesNo),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Navigator.pop(true) : showDialog가 return 하는 값
              Navigator.of(context).pop(true);
            },
            child: const Text("예"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("아니오"),
          )
        ],
      ),
    );
  }

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
}
