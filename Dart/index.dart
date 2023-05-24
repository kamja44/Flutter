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
    ..team = "coral"
    ..sayHello();
  // .은 kamja를 가리킨다.
  // 위 코드는 아래의 코드와 동일하다.
  /**
   * var kamja = Player(name: "kamja", xp: 1000, team: "blue");
   * kamja.name = "kokuma";
   * kamja.xp = 1300;
   * kamja.team = "coral";
   */
}
