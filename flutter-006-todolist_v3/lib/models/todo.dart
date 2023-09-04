class Todo {
  int? id;
  String sdate;
  String stime;
  String content;
  bool complete;

  Todo(
      {this.id,
      required this.sdate,
      required this.stime,
      required this.content,
      required this.complete});

// Map 자료형은 key, value가 쌍으로 구성된 데이터 type
// SQL Lite DB table에 insert를 하기 위해서는
// 실제 데이터를 Map<> type으로 변환을 시켜야한다.
  Map<String, Object?> toMap() {
    return {
      // "id": id,
      "sdate": sdate,
      "stime": stime,
      "content": content,
      "complete": complete ? 1 : 0
    };
  }
}
