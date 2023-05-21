1. [1장](#1장)<br>
   &nbsp;&nbsp;1-1. [main 함수](#main)<br>
   &nbsp;&nbsp;1-2. [변수선언](#변수선언)<br>
   &nbsp;&nbsp;1-3. [Dynamic Type](#dynamic-type)<br>
   &nbsp;&nbsp;1-4. [Null Safety](#null-safety)<br>
   &nbsp;&nbsp;1-5. [Final Variables](#final-variables)<br>
   &nbsp;&nbsp;1-6. [Late Variables](#late-variables)<br>

# 1장

## main()

main() 함수는 프로그램의 시작점

## 변수선언

1. var 키워드

- var 키워드를 사용하여 변수를 선언하면 변수의 타입을 추론한다.
  - 함수나 메소드 내부에 지역 변수를 선언할 때 관습적으로 var를 사용한다.

```dart
void main() {
  var name = "캄자";
  name = "kamja";
}
```

2. 명시적 타입 선언

- String 등을 이용하여 명시적으로 변수의 타입을선언한다.
  - class에서 변수나 property를 선언할 때 사용한다.

## Dynamic Type

여러가지 타입을 가질 수 있는 변수에 사용하는 키워드

- dynamic type은 최대한 사용을 지양해야 한다.

```dart
void main() {
  // 변수의 type이 dynamic
  // var name;
  dynamic name; // var로 선언해도 되고 dynamic으로 선언해도 된다.
  name = 'kamja';
  name = 12;
  name = true;
}
```

```dart
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

```

## Null Safety

개발자가 null값을 참조할 수 없도록 한다.

- null값을 참조하면 런타임 에러가 발생한다.
  - 런타임 에러는 사용자가 앱을 사용하던 중 발생하는 에러이다.
    - 즉, 컴파일 이전에 런타임 에러를 제어해야 한다.

`null safety는 어떤 변수, 혹은 데이터가 null이 될 수 있음을 명시한다.`

- 즉, dart가 어떤 데이터가 null일 때 참조하지 않도록 도와준다.

`Dart의 변수는 기본적으로 nullable이 아니다.`

- nullable로 만들기 위해선 반드시 물음표를 넣어야 한다.

```dart
void main(){
  String? name = "kamja";
}
```

```dart
void main(){
  String name = "kamja";
  name = null;
  // name 변수가 String타입 or null타입도 될 수 있다고 하려면  String 뒤에 ?를 추가한다.
  String? name = "kamja";

  name.length; // name이 null일 수 있기에 에러가 발생한다.
  // 즉, name이 null type이 아닌지 확인한 후 name.length를 사용해야 한다.
}
```

```dart
void main() {
  String? name = "kamja";
  name = null;

  if(name != null){
    name.isNotEmpty;
  }
  // 5 ~ 7번 라인의 if문과 9번 라인의 코드는 동일하다.
  name?.isNotEmpty;
  // name이 null이 아니라면 isNotEmpty 속성을 달라고 요청한다.
}

```

## Final Variables

한번 정의된 변수를 수정할 수 없게 만들기

- final 키워드

```dart
void main(){
  final name = "kamja";

  // final 키워드 뒤에 타입을 정의할 수 있다.
  final String name2 = "kokuma";
}
```

## Late Variables

초기 데이터 없이 변수를 선언할 수 있다.

- final이나 var 앞에 붙여줄 수 있는 수식어다.

```dart
void main() {
  late final String name;
  // do something, go to api
  name = "kamja"; // final 변수는 한 번만 할당할 수 있다.

  late final String name2;
  print(name2); // name2는 값을 넣기 전에 접근하지 말아야 된다고 알려준다.
  name2 = "";
  print(name2);
}

```
