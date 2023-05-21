void main() {
  const API = fetchApi(); // compile-time constant가 아니다.
  // 컴파일러가 API 변수의 값을 모르기 때문
  // 즉, API는 const가 아닌 final이 되어야 한다.
  final API = fetchApi();
  const API = "121212";
  const max_allowed_price = 120;
}
