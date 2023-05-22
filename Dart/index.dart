void main() {
  var numbers = {1, 2, 3, 4}; // Set<int>
  // 위 코드는 아래의 코드와 동일하다.
  // Set<int> numbers = {1, 2, 3, 4};
  numbers.add(1);
  numbers.add(1);
  numbers.add(1);
  print(numbers); // {1, 2, 3, 4}

  // list 사용
  List<int> numbers2 = [1, 2, 3, 4];
  numbers2.add(1);
  numbers2.add(1);
  numbers2.add(1);
  print(numbers2); // [1, 2, 3, 4, 1, 1, 1]
}
