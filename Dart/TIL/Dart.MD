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
   &nbsp;&nbsp;&nbsp;&nbsp;2-2-2. [Collection for](#collection-for)<br>
   &nbsp;&nbsp;2-3. [String interpolation](#string-interpolation)<br>
   &nbsp;&nbsp;2-4. [Map](#map)<br>
   &nbsp;&nbsp;2-5. [Set](#set)<br>
3. [3장](#3장)<br>
   &nbsp;&nbsp;3-1. [Defining a Function](#defining-a-function)<br>
   &nbsp;&nbsp;3-2. [Named Parameters](#named-parameters)<br>
   &nbsp;&nbsp;3-3. [Optional Positional Parameters](#optional-positional-parameters)<br>
   &nbsp;&nbsp;3-4. [QQ Operator](#qq-operator)<br>
   &nbsp;&nbsp;&nbsp;&nbsp;3-4-1. [??= 연산자](#연산자)<br>
   &nbsp;&nbsp;3-5. [Typedef](#typedef)<br>
4. [Class](#class)<br>
   &nbsp;&nbsp;4-1. [Dart Class](#dart-class)<br>
   &nbsp;&nbsp;4-2. [Constructors](#constructors)<br>
   &nbsp;&nbsp;4-3. [Named Constructor Parameters](#named-constructor-parameters)<br>
   &nbsp;&nbsp;4-4. [Named Constructors](#named-constructors)<br>
   &nbsp;&nbsp;&nbsp;&nbsp;4-4-1. [fromJson](#fromjson)<br>
   &nbsp;&nbsp;4-5. [Cascade Notation](#casecade-notation)<br>

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

- 즉, List를 생성할 때 조건에 따라 element를 추가할 수 있다.

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

### Collection For

반복문을 이용하여 list의 요소에 데이터를 추가할 수 있다.

```dart
void main() {
  var oldFriends = ["kamja", "kokuma"];
  var newFriends = [
    "kimchi",
    "potato",
    "rice",
    for (var friend in oldFriends) "🍙  $friend",
  ];
  // list 안의 for문은 다음과 같다.
  // for(var friend in oldFriends){newFriend.add("🍙  $friend");}
  print(newFriends); // [kimchi, potato, rice, 🍙  kamja, 🍙  kokuma]
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

## Map

dart의 map은 JS의 object, 파이썬의 dictionary와 같다.

```dart
void main(){
  var player = {
    "name": "kamja",
    "xp": 19.99,
    "superpower": false,
  }; // Type: Map<String, Object>
}
```

Type: Map<String, Object>

- key는 string이고, value는 object타입 이다.
  - Dart에서는 모든게 object로부터 생겨서 기본적으로 어떤 자료형이든 될 수 있다.
  - 즉, TS의 any 타입과 동일하다.

Map의 타입을 명시적으로 정의

```dart
void main(){
  Map<int, bool> player = {
    1: true,
    2: false,
    3: true
  }
}
```

var키워드로 선언하면 컴파일러가 key와 value의 자료형을 유추한다.

```dart
dart player = {
  1: true,
  2: false,
}
```

key값의 타입을 List<int> 타입으로 선언

```dart
void main(){
  Map<List<int>, bool> player = {
    [1, 2, 3, 4]: true,
  };
}
```

Map<String, Object>를 요소로 갖는 List 선언

```dart
void main(){
  List<Map<String, Object>> players = [
    {
      "name": "kamja",
      "xp": 199993.999
    },
    {
      "name": "kamja",
      "xp": 199993.999
    },
    {
      "name": "kamja",
      "xp": 199993.999
    },
  ];
}
```

API를 통해 얻은 데이터는 class를 이용하여 처리하는 것을 권장한다.

## Set

set에 속한 모든 요소들이 유니크해야될 때 사용한다.

- 유니크할 필요가 없다면 List를 사용하면 된다.

```dart
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
```

# 3장

## Defining a Function

```js
void sayHello(String name){
  print("Hello $name nice to meet you");
}

String sayHello2(String name){
  return "Hello $name nice to meet you";
}

String sayHello3(String name) => "Hello $name nice to meet you";

num plus(num a, num b) => a + b;

void main(){
  sayHello("kamja");  // Hello kamja nice to meet you
  print(sayHello2("kamja"));  // Hello kamja nice to meet you
  print(sayHello3("kamja")); // Hello kamja nice to meet you
    print(plus(10, 20)); // 30
}
```

void는 함수가 아무것도 return 하지 않는다.
sayHello2는 String을 return하는 함수이다.

## Named Parameters

순서에 관계없이 argument의 이름들만 적어주면 된다.

- named argument를 사용하기 위해선 함수의 argument 부분을 {}로 묶어줘야 한다.
  - named argument를 생성하는 2가지 방법
    - 1. default value 사용
    - 2. required 사용

```dart
String sayHello({String name, num age, String country}){
  return "Hello $name, you are $age, and you come from $country";
}
```

```dart
String sayHello({String name, num age, String country}){
  return "Hello $name, you are $age, and you come from $country";
}

void main(){
  // named argument를 사용하지 않은 코드
  print(sayHello("kamja", 20, "korea"));

  // named argument를 사용한 코드
  print(sayHello(
    age: 20,
    country: "korea",
    name: "kamja",
  ));
}
```

name argument에 default value 적용

```dart
String sayHello({String name = "anon", num age = 30, String country = "korea",}){
  return "Hello $name, you are $age, and you come from $country";
}

void main(){
  // named argument를 사용한 코드
  print(sayHello(
    age: 20,
    country: "korea",
    name: "kamja",
  ));
}
```

required 사용

```dart
// required 사용
String sayHello2(
    {required String name, required num age, required String country}) {
  return "Hello $name, you are $age, and you come from $country";
}

void main() {
  print(sayHello2(
      age: 12,
      country: "cicici",
      name:
          "lalala")); // sayHello2() argument가 전부 required이기에 인수를 전달하지 않으면 에러가 발생한다.
}
```

## Optional Positional Parameters

- positional parameters의 require 속성을 해제한다.
  - 즉, null을 허용한다.
    - 대괄호로 감싸주고 물음표를 사용한 후 기본값을 할당한다.
    - `[String? country = "korea"]`

positional parameter는 순서에 맞춰서 입력해야 한다.

```dart
void main(){
  sayHello(1, 2, 3, 4);
}
```

named parameter

```dart
void main(){
  sayHello(
    name: 1,
  );
}
```

```dart
String sayHello(String name, int age, [String? country = "korea"]) =>
    "Hello $name, you are $age years old from $country";

void main() {
  print(sayHello("kamja", 20)); // optional positional parameters를 이용하여 country를 전달하지 않아도 에러가 발생하지 않는다.
}

```

`[String? country = "korea"]`

- country는 require가 아니며 기본값으로 korea를 갖는다.

## QQ Operator

좌항과 우항이 있을때 ?? 가 체크를한다.

- QQ = Question Question
- `left ?? right`
  - 만일 좌항이 null이면 우항을 return 한다.
  - 좌항이 null이 아니면 좌항을 return 한다.
    - `name?.toUpperCase() ?? "ANON";`

사용자가 null값을 입력할 수 있는 방법 1.

```dart
String capitalizeName(String? name) {
  if(name != null){
    return name.toUpperCase();
  }
  return "ANON";
}

void main() {
  capitalizeName(null);
}

```

사용자가 null값을 입력할 수 있는 방법 2.

```dart
String capitalizeName2(String? name) => name != null ? name.toUpperCase() : "ANON";

void main() {
  capitalizeName(null);
}

```

사용자가 null값을 입력할 수 있는 방법 3.

```dart
String capitalizeName2(String? name) => name?.toUpperCase() ?? "ANON";

void main() {
  capitalizeName(null);
}

```

### ??= 연산자

변수 안에 값이 null일 때 값을 할당할 수 있다.

```dart
void main(){
  String? name;
  name ??= "kamja";
  print(name); // kamja
}
```

## Typedef

자료형의 별칭을 지정한다.
`typedef ListOfInts = List<int>;`

- 즉, ListOfInts는 List<int> 자료형이다.

```dart
typedef ListOfInts = List<int>;

List<int> reverseListOfNumbers(List<int> list){
  var reversed = list.reversed;
  return reversed.toList();
}

typedef UserInfo = Map<String, String>;

String sayHi(UserInfo userInfo){
  return "Hi ${userInfo['name']}";
}


void main(){
print(reverseListOfNumbers([1, 2, 3])); // [3, 2, 1]

print(sayHi({"name": "kamja"})); // Hi kamja
}
```

# Class

## Dart Class

클래스에서 property를 선언할 때는 타입을 사용하여 정의한다.

- 클래스를 생성할 때는 타입을 반드시 명시해야한다.
  - 클래스를 생성할 때 new 연산자를 생략할 수 있다.
    - `new Player();`과 `Player()`은 동일하게 클래스를 생성한다.

class에 final 키워드를 사용하면 property의 값을 변경하지 못하게 막을 수 있다.

dart의 클래스에서는 this를 사용할 필요가 없다.

- this를 사용해도 동일하게 동작한다.
  - class method 내에서 this는 사용하지 않는 것이 권고된다.
    - `print("Hi my name is $name");`와 `print("Hi my name is ${this.name}");`은 동일하다.

```dart
class Player {
  String name = "kamja";

  final int xp = 1500;

  void sayHello(){
    print("Hi my name is $name");
    print("Hi my name is ${this.name}");
  }
}

void main() {
  var player = new Player();
  print(player.name); // kamja
  player.name = "kokum";
  print(player.name); // kokuma

  player.xp = 2000; // 'xp' can't be used as a setter because it's final.

  player.sayHello();
}
```

## Constructors

argument로 player의 이름과 xp를 전달해서 새로운 Player를 생성한다.

- constructor method의 이름은 class의 이름과 같아야 한다.

constructor 선언방법 1

```dart
class Player{
  late final String name;
  late int xp;

  Player(String name, int xp){
    this.name = name;
    this.xp = xp;
  }
}

void main() {
  var player = Player("kamja", 1500);
  player.sayHello(); // Hi my name is kamja

  var player2 = Player("kokuma", 3000);
  player2.sayHello(); // Hi my name is kokuma
}
```

- late은 변수들의 값을 나중에 받아온다.

constructor 선언방법 2

```dart
class Player2{
  String name;
  final int xp;

  Player2(this.name, this.xp);

  void sayHello(){
    print("Hi my name is $name");
  }
}

void main() {
  var player3 = Player2("kamja", 2000);
  player3.sayHello();
}
```

## Named Constructor Parameters

parameter들에게 이름을 붙인다.
`Player(
      {required this.name,
      required this.xp,
      required this.team,
      required this.age,
      });`

```dart
class Player {
  final String name;
  int xp;
  String team;
  int age;

  Player(
      {required this.name,
      required this.xp,
      required this.team,
      required this.age,
      });
}

void main() {
  var player = Player(
    name: "kamja ",
    xp: 1200,
    team: "blue",
    age: 20,
  );
}
```

- 생성자의 요소에 required를 추가함으로써 null값을 배제한다.

## Named Constructors

- 기존 클래스의 생성자에서 약간만 다른 생성자를 메서드로 선언할 수 있다.
  `Player.createBluePlayer({
  required String name,
  required int age,
}): this.age = age,
    this.name = name,
    this.team = "blue",
    this.xp = 0;`

```dart
class Player {
  final String name;
  int xp, age;
  String team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
    required this.age,
  });

  // Player를 초기화하는 method

  // named Syntax 사용
  // named parameter에는 기본적으로 required 속성이 없다.
  Player.createBluePlayer({
    required String name,
    required int age,
  })  : this.age = age,
        this.name = name,
        this.team = "blue",
        this.xp = 0;

  // positional syntax 사용
  // 기본적으로 positional syntax는 required이다.
  Player.createRedPlayer(String name, int age)
      : this.age = age,
        this.name = name,
        this.team = "red",
        this.xp = 0;
}

void main() {
  var bluePlayer = Player.createBluePlayer(
    name: "kamja",
    age: 20,
  );
  var redPlayer = Player.createRedPlayer(
    "kokuma",
    30,
  );
}
```

- named parameter는 기본적으로 required가 아니다.
- positional parameter는 기본적으로 required이다.

### fromJson

```dart

class Player {
  final String name;
  int xp;
  String team;

  Player.fromJson(Map<String, dynamic> playerJson)
      : name = playerJson["name"],
        xp = playerJson["xp"],
        team = playerJson["team"];

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var apiData = [
    {
      "name": "kamja",
      "team": "blue",
      "xp": 0,
    },
    {
      "name": "kokuma",
      "team": "blue",
      "xp": 0,
    },
    {
      "name": "nanna",
      "team": "blue",
      "xp": 0,
    },
  ];

  apiData.forEach((playerJson) {
    var player = Player.fromJson(playerJson);
    player.sayHello();
  });
}
class Player {
  final String name;
  int xp;
  String team;

  Player.fromJson(Map<String, dynamic> playerJson)
      : name = playerJson["name"],
        xp = playerJson["xp"],
        team = playerJson["team"];

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var apiData = [
    {
      "name": "kamja",
      "team": "blue",
      "xp": 0,
    },
    {
      "name": "kokuma",
      "team": "blue",
      "xp": 0,
    },
    {
      "name": "nanna",
      "team": "blue",
      "xp": 0,
    },
  ];

  apiData.forEach((playerJson) {
    var player = Player.fromJson(playerJson);
    player.sayHello();
  });
}
```

## Casecade Notation

`var kamja = Player(name: "kamja", xp: 1000, team: "blue");
kamja.name = "kokuma";`

위의 코드를 아래와 같이 대체할 수 있다.
`var kamja = Player(name: "kamja", xp: 1000, team: "blue")
..name = "kokuma";`

- .은 kamja와 동일하다.
  - .앞에 class가 있다면, 곧바로 그 class를 가리키게 된다.

```dart
class Player {
  String name;
  int xp;
  String team;

  Player({
    required this.name,
    required this.xp,
    required this.team,
  });

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var kamja = Player(name: "kamja", xp: 1000, team: "blue")
    ..name = "kokuma"
    ..xp = 1300
    ..team = "coral";
    // .은 kamja를 가리킨다.
  // 위 코드는 아래의 코드와 동일하다.
  /**
   * var kamja = Player(name: "kamja", xp: 1000, team: "blue");
   * kamja.name = "kokuma";
   * kamja.xp = 1300;
   * kamja.team = "coral";
   */
}
```
