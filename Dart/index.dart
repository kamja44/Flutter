class Human {
  final String name;
  Human({required this.name});
  void sayHello() {
    print("Hi my name is $name");
  }
}

enum Team { red, blue }

// Player 클래스는 Human 클래스가 갖고 있는 모든 것들을 갖는다.
class Player extends Human {
  final Team team;

  Player({
    required this.team,
    required String name,
    // Human 클래스를 상속받기에 Human 클래스의 name property를 받아야한다.
  }) : super(name: name);
  // super를 이용하여 name을 Human 클래스에 전달한다.
}

void main() {
  var player = Player(team: Team.red, name: "kamja");
}
