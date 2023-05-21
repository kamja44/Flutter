void main() {
  String? name = "kamja";
  name = null;

  if (name != null) {
    name.isNotEmpty;
  }
  // 5 ~ 7번 라인의 if문과 9번 라인의 코드는 동일하다.
  name?.isNotEmpty;
  // name이 null이 아니라면 isNotEmpty 속성을 달라고 요청한다.
}
