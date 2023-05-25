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
