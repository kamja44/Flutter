void main() {
  dynamic name;
  if (name is String) {
    // name이 String Type일 경우의 동작
    // 즉, name은 String Type의 메서드를 사용할 수 있다.
  }
  if (name is int) {
    // name이 Int Type일 경우의 동작
    // 즉, name은 Int type의 메서드를 사용할 수 있다.
  }
}
