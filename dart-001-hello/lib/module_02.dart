String sayHello(String? name, int? age, String? nation) {
  return "안녕 $name야, 당신의 나이는 $age이고, 고향은 $nation 이야";
}

String sayHelloNameParams({String? name, int? age, String? nation}) {
  return "안녕 $name야, 당신의 나이는 $age이고, 고향은 $nation 이야";
}

/// <Comp name="홍길동", age=33, nation="대한민국" />