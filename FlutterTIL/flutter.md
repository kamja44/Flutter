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

## InitState

- 상태를 초기화하기 위한 메서드
- initState 메서드는 항상 build 메서드보다 먼저 호출되어야 한다.
  - InitState 메서드는 단 한번만 호출된다.
  - initState를 사용할 때 super.initState()를 호출해야 한다.

```dart
@override
void initState(){
  super.initState();
  print("initState!");
}
```

## dispose

- 위젯이 스크린에서 제거될 때 호출되는 메서드이다.
  - 무언가를 취소할 때 사용한다.

```dart
@override
void dispose(){
  super.dispose();
  print("dispose!);
}
```

### Life Cycle

stateful Widget은 Life Cycle을 가지고 있다.

- initState은 build 이전에 호출된다.
  - 변수를 초기화한다.
- build는 위젯에서 UI를 만든다.
- dispose는 위젯이 위젯 트리에서 제거될 때 실행된다.
  - dispose 메서드 안에서 이벤트 리스너와 같은 것들을 취소시킨다.

# POMODORO APP

## Flexible

- 하드 코딩되는 값을 만들게 해준다.
  - UI를 비율에 기반해서 유연하게 만든다.

```dart
Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                iconSize: 130,
                color: Theme.of(context).cardColor,
                onPressed: () {},
                icon: const Icon(Icons.play_circle_outline),
              ),
            ),
          ),
```

## Expanded

- 요소를 확장시킨다.

```dart
Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodors",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                        Text(
                          "0",
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w800,
                            color:
                                Theme.of(context).textTheme.displayLarge!.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
```

## late

late modifier는 이 property를 당장 초기화 하지 않아도 된다는 것을 의미한다.

```dart
late Timer timer;
```

## Timer

```dart
  void onTick(Timer timer) {
    setState(() {
      totalSeconds -= 1;
    });
  }

Timer.periodic(Duration(seconds: 1), onTick)
```

- 매 1초마다 onTick 함수를 실행한다.
- onTick()은 함수를 지금 실행함을 의미한다.
  - 즉, 함수를 지금 실행할 것이 아니기에 onTick을 사용해야한다.

# Toonflx

dart, flutter의 패키지는 pub.dev에서 다운받을 수 있다.

- node의 npm or python의 pip와 동일하다.

http 패키지 다운로드 방법

1. dart명령어 커맨드 라인에 실행
   `dart pub add http`

2. flutter명령어 커맨드 라인에 실행
   `flutter pub add http`

3. dependencies를 pubspec.ymal이라는 파일에 추가하기
   `dependencies: http: ^0.13.5`

## get (http 패키지)

특정 URL에 요청을 보낸다.

```dart
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons(){
    final url = Uril.parse("$baseUrl/$today");
    http.get(url)
  }
}

```

## Future

- 미래에 받을 값의 타입을 알려준다.
  - 즉, 미래에 완료될 동작을 의미한다.
  - ex) API호출 후 반환받은 응답을 사용할 때

## 비동기 프로그래밍

- js의 async await 문법과 동일하다.

```dart
  void getTodaysToons() async{
    final url = Uri.parse("$baseUrl/$today");
    await http.get(url);
  }
```

## models > api_service.dart

- 호출한 API 데이터를 클래스로 만들어서 여러 클래스로 이뤄진 리스트로 변환한다.

## dynamic type

- dynamic타입은 어떠한 타입이든 올 수 있다.
  - 즉, 우리가 타입을 직접 정해줘야 한다.

## future type

- 당장 완료될 수 없는 작업의 타입을 의미한다.

## dart의 Named Constructors

- Constructor의 인수만 적어주고, property를 적어주면 초기화가 가능하다.

```dart
WebtoonModel.fromJson(Map<String ,dynamic> json) : title = json["title"], thumb = json["thumb"], id = json["id"];
```

## API로 호출한 데이터 불러오기

방법 1

```dart
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebToons() async {
    webtoons = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    waitForWebToons();
  }
```

방법 2
FutureBuilder 위젯 사용

## FuterBuilder 위젯

- Builder는 UI를 그려주는 함수이다.
  - initial 데이터 전달이 가능하다.
  - future 타입의 데이터 전달이 가능하다.
    - FutureBuilder가 future타입의 데이터를 기다리기에 await를 사용할 필요가 없다.
- builder의 2번째 매개변수 snapshot을 이용하면 Future의 상태를 알 수 있다.

```dart
Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text("There is data!");
          }
          return const Text("Loading...");
        },
      ),
    );
```

FutureBuilder 위젯을 사용하면 stateless 위젯으로도 데이터를 받아올 수 있다.
