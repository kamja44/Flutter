1. [1장](#1장)<br>
   &nbsp;&nbsp;1-1. [main 함수](#main)<br>
   &nbsp;&nbsp;1-2. [변수선언](#변수선언)<br>
   &nbsp;&nbsp;1-3. [Dynamic Type](#dynamic-type)<br>

# 1장

## main()

main() 함수는 프로그램의 시작점

## 변수선언

1. var 키워드

- var 키워드를 사용하여 변수를 선언하면 변수의 타입을 추론한다.
  - 함수나 메소드 내부에 지역 변수를 선언할 때 관습적으로 var를 사용한다.

```js
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

```js
void main() {
  // 변수의 type이 dynamic
  // var name;
  dynamic name; // var로 선언해도 되고 dynamic으로 선언해도 된다.
  name = 'kamja';
  name = 12;
  name = true;
}
```

```js
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
