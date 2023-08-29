void main(List<String> args) {
  String str1 = "korea";
  String str2 = 'korea';

  // Multi Line 문자열
  // 입력한 모양 그대로 문자열이 변수에 저장된다
  // Enter, 빈칸, tab 등의 값들도 그대로 유지 된다.
  String str3 = """
    가나다라마바사아자차카타파하
    ABCDEFGHIJKLMNOPQRSTUVWXYZ
  """;
  print(str3);

  int num1; // dart 에는 long 형도 없다.
  double num2; // dart에는 float가 없고 double형을 사용한다.
  num1 = 30;
  num2 = 3.0;

  print("$num1, $num2");

  // dart에서는 특별한 경우가 아니면 숫자형 변수는 num 키워드를 권장한다.
  num num3 = 30;
  bool bYes = true;
  print("$num3, $bYes");
}
