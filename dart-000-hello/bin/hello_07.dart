String stdFunc(String nation) {
  return nation.toUpperCase();
}

String arrowFunc(String nation) => nation.toUpperCase();

int stdSum(int num1, int num2) {
  int sum = num1 + num2;
  return sum;
}

// return 값이 null 값을 허용하도록 하고 매개변수 name이 null 일 수도 있다는 것을 미리 선언한다.
// name?.toUpperCase() ?? null : name이 null이 아니면 대문자로 변경하고 아니면 그냥 null
String? arrowStrFunc(String? name) => name?.toUpperCase() ?? null;
String? stdNullFunc(String? name) {
  if (name != null) {
    return name.toUpperCase();
  }
  return null;
}

// return 타입에 ?가 안붙어 있기 때문에 null을 return 할 수 없기 때문에 반드시 문자열을 return 해야 한다.
String arrowNotNullFunc(String? name) => name?.toUpperCase() ?? "null";
