import 'dart:math';

void main(List<String> args) {
  List<int> nums = [];

  // 1 ~ 100까지의 범위의 난수를 만들어 20개의 배열을 생성했다.
  for (int i = 0; i < 20; i++) {
    var num = Random().nextInt(100) + 1;
    nums.add(num);
  }
  print(nums);

  // 배열에 저장된 요소들중에 소수를 구하여 출력하시오
  int check = 0;
  for (int i = 0; i < nums.length; i++) {
    for (int j = 2; j < nums[i]; j++) {
      if (nums[i] == 2 || nums[i] == 1) {
        print(nums[i]);
        break;
      }
      if (nums[i] % j == 0) {
        check++;
        break;
      }
    }
    if (check == 0) {
      print(nums[i]);
    }
    check = 0;
  }
}
