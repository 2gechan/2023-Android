// List(배열)
var nums = [1, 2, 3, 4, 5, 6, 7, 8, 9];
var nations = ["RoK", "USA", "BRITH", "GERMENY"];
List<String> names = ["홍길동", "이몽룡", "성춘향"];
void main(List<String> args) {
  print(nums);
  print(nations);
  print(names);

  // List(배열)에서 특정 값 추가하기
  nums.add(100);
  nations.add("스위스");
  names.add("임꺽정");
  print(nums);
  print(nations);
  print(names);

  // List(배열)에서 특정 값 제거하기
  nations.remove("USA");
  print(nations);

  // List의 3번 index 요소를 제거하기
  nations.removeAt(3);
  print(nations);

  print(names.first);
  print(names.last);
  print(names.reversed);
  names.shuffle();
  print(names);
}
