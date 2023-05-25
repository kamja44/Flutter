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
