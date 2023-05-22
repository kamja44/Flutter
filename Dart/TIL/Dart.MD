1. [1장](#1장)<br>
   &nbsp;&nbsp;1-1. [main 함수](#main)<br>
   &nbsp;&nbsp;1-2. [변수선언](#변수선언)<br>
   &nbsp;&nbsp;1-3. [Dynamic Type](#dynamic-type)<br>
   &nbsp;&nbsp;1-4. [Null Safety](#null-safety)<br>
   &nbsp;&nbsp;1-5. [Final Variables](#final-variables)<br>
   &nbsp;&nbsp;1-6. [Late Variables](#late-variables)<br>
   &nbsp;&nbsp;1-7. [Constant Variables](#constant-variables)<br>
2. [2장](#2장)<br>
   &nbsp;&nbsp;2-1. [Basic Data Types](#basic-data-types)<br>
   &nbsp;&nbsp;2-2. [Lists](#lists)<br>
   &nbsp;&nbsp;&nbsp;&nbsp;2-2-1. [Collection if](#collection-if)<br>
   &nbsp;&nbsp;2-3. [String interpolation](#string-interpolation)<br>

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

## Constant Variables

dart의 const는 compile-time constant를 만든다.

- compile-time constant는 컴파일 시점에 값을 알고 있어야 한다.

  - 즉, const는 컴파일 할 때 알고 있는 값에 사용한다.
    - 어떤 값인지 모를때는 final or var을 사용한다.

- dart의 const는 js나 ts의 const와 다르다.
  - js나 ts의 const는 dart의 final과 비슷하다.

```dart
void main() {
  const API = fetchApi(); // compile-time constant가 아니다.
  // 컴파일러가 API 변수의 값을 모르기 때문
  // 즉, API는 const가 아닌 final이 되어야 한다.
  final API = fetchApi();
  const API = "121212";
  const max_allowed_price = 120;
}

```

## Basic Data Types

num 자료형을 사용하면 그 숫자는 integer일 수도 있고 double일 수도 있다.

- int와 double 자료형은 num 클래스를 상속받아 사용한다.

```dart
void main() {
  String name = "kamja";
  bool alive = true;
  int age = 12;
  double money = 65.55;
  num x = 12;
  x = 1.1;
}
```

## Lists

List 선언 방법

```dart
void main(){
  // 1.
  var numbers = [1, 2, 3, 4,];
  // 2.
  List<int> numbers = [1, 2, 3, 4,];

  var numbers2 = [1, 2, 3, 4, "kamja",];
}
```

### Collection if

존재할 수도 안할 수도 있는 요소를 가지고 list를 만들 수 있다.

```dart
void main() {
  var giveMeFive = true;
  var numbers = [
    1,
    2,
    3,
    4,
    "kamja",
    if(giveMeFive ) 5,
    // giveMeFive가 존재한다면 5를 추가한다.
    // 위 코드는 다음과 같다.
    // if(giveMeFive){numbers.add(5);}
  ];
  print(numbers); // [1, 2, 3, 4, kamja, 5]
}

```

## String interpolation

text에 변수를 추가하는 방법

- ""('')안에 `$변수명`으로 사용한다.
- 계산을 수행할 때는 `${계산식}`으로 사용한다.

변수가 이미 존재할 때의 String interpolation

```dart
void main() {
  var name  = "kamja";
  var greeting = "Hello my name is $name nice to meet you!";
  print(greeting); // Hello my name is kamja nice to meet you!
}
```

계산을 실행할 때의 String interpolation

```dart
void main() {
  var name = "kamja";
  var age = 10;
  var greeting = "Hello my name is $name nice to meet you! and I'm ${age + 2}"; // Hello my name is kamja nice to meet you! and I'm 12
  print(greeting);
}

```
