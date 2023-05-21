void main() {
  late final String name;
  // do something, go to api
  name = "kamja"; // final 변수는 한 번만 할당할 수 있다.

  late final String name2;
  print(name2); // name2는 값을 넣기 전에 접근하지 말아야 된다고 알려준다.
  name2 = "";
  print(name2);
}
