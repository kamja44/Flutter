// Default value
String sayHello({
  String name = "anon",
  num age = 30,
  String country = "korea",
}) {
  return "Hello $name, you are $age, and you come from $country";
}

// required 사용
String sayHello2(
    {required String name, required num age, required String country}) {
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  print(sayHello()); // name은 anon으로, age는 30으로, country는 korea로 기본값이 설정되었다.
  // Hello anon, you are 30, and you come from korea
  print(sayHello2(
      age: 12,
      country: "cicici",
      name:
          "lalala")); // sayHello2() argument가 전부 required이기에 인수를 전달하지 않으면 에러가 발생한다.
}
