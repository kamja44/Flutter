enum Team { red, blue }

enum XPLevel { beginner, medium, pro }

class Player {
  String name;
  XPLevel xp;
  Team team;

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
  var kamja = Player(name: "kamja", xp: XPLevel.medium, team: Team.blue)
    ..name = "kokuma"
    ..xp = XPLevel.pro
    ..team = Team.red
    ..sayHello();
}
