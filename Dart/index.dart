class Player {
  final String name;
  int xp;
  String team;
  int age;

  Player({
    required this.name,
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
