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
