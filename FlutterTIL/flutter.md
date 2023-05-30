# Widget

- 레고 블럭이라 생각
- flutter의 모든 것은 Widget이다.
  - Widget들을 합치는 방식으로 앱을 만든다.
- Widget을 만드는 것은 class를 만드는 것과 동일하다.

Flutter Widget catalog(공식 위젯)
`https://docs.flutter.dev/ui/widgets`

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

// main 함수의 runApp함수에 할당하는 widget
// 즉, App widget은 우리 앱의 root이다.
// root widget은 materialApp() 혹은 cupertinoApp()을 return 해야한다.
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello Kamja"),
        ),
        body: Center(
          child: Text("Hello World!"),
        ),
      ),
    );
  }
}
```

- class를 widget으로 만들기 위해 Widget을 상속받는다.
- build 메소드는 Widget의 UI를 만든다.
  - build 메소드는 Widget을 return해야한다.
- App widget은 root widget이다.
  - root widget은 materialApp() 혹은 cupertinoApp()을 return 해야한다.
    - materialApp()은 구글의 디자인 시스템이다.
    - cupertinoApp()는 애플의 디자인 시스템이다.

화면은 scaffold라는 규칙을 가져야 한다.

- scaffold widget 사용
- scaffold는 화면의 구조를 제공한다.
  - 모바일 앱의 모든 화면은 scaffold가 필요하다.
  - bottom tab bar, 버튼, 중앙 정렬 등의 기능들을 제공한다.

## Column

수직 배열

- MainAxisAlignment
  - 수직 방향 정렬

## Row

수평 배열

- MainAxisAlignment
  - 수평 방향 정렬

## 색상 표현 방법

1. Colors.method 사용

- 이미 정의된 색상을 사용할 때 사용한다.

2. Color(0xFF색상코드)사용
3. Color.fromARGB

- Color.fromRGBO와 동일하다.
  R = red
  G = green
  B = blue
  O = opacity

## Padding

padding의 EdgeInsets.all

- 상하좌우 모두에 padding 10을 준다.

```dart
Padding(
    padding: EdgeInsets.all(10),
);
```

padding의 EdgeInsets.only()

- 상하좌우 중 한 가지를 구체적으로 정할 수 있다.

padding의 EdgeInsets.only()

- 수직 padding과 수평 padding을 지정할 수 있다.

## Container Widget

- div 태그와 동일하다.

## borderradius

- BoxDecoration의 borderRadius
- borderRadius.circle(숫자)로 사용

## open user settings (JSON)

### editor.codeActionsOnSave

코드의 개선점을 자동으로 개선한다.

- 변수를 const로 설정하면 더 좋은경우 const로 수정한다.

```json
"editor.codeActionsOnSave": {
    "source.fixAll": true
  },
```

### dart.previewFlutterUiGuides

부모가 무엇인지 가이드라인을 생성한다.

```json
"dart.previewFlutterUiGuides": true,
```

## Stateless Widget

- build 메서드를 통해 단지 UI만 출력한다.
- 아무런 데이터를 갖고있지 않다.

## Stateful Widget

- stateful Widget은 상태를 가지고 있어서 Stateful로 불린다.
  - 즉, 상태에 따라 변하게 될 데이터를 생각할 수 있다.
- 위젯에 데이터를 저장하고, 실시간으로 데이터의 변화를 보고 싶을 때 사용한다.

## setState

State클래스에게 데이터가 변경되었다고 알려주는 함수다.

- 데이터가 변경되면 Flutter에게 데이터가 수정되었음을 알리는 역할만 한다.
  - 즉, setState(){}안에 데이터가 변경되는 코드가 위치하지 않아도 된다.
    - 가독성을 위해 setState(){}안에 데이터가 변경되는 코드를 위치시킨다.

```dart
setState(
      () {
        counter += 1;
      },
    );
```

## context

context는 모든 상위 요소에 대한 정보이다.

- 즉, 부모 요소에 접근할 수 있게 해준다.
  `Widget build(BuildContext context)`

```dart
Widget build(BuildContext context) {
    return const Text(
      "My Large Title",
      style: TextStyle(fontSize: 30, color: Theme.of(context).textTheme.titleLarge!.color,),
    );
  }
```

- 부모의 Theme에 접근한다.
