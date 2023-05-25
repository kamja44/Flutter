import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(18, 18, 18, 1),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Hi, Kamja",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Welcome Back!!",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7), fontSize: 14),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 120,
              ),
              Text(
                "Total Balance",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "\$5 194 382",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 40,
                      ),
                      child: Text(
                        "Transfer",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(45),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
