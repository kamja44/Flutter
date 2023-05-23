// constructor 선언방법 1
class Player {
  // late은 변수들의 값을 나중에 받아온다.
  late String name;
  late final int xp;

  Player(String name, int xp) {
    this.name = name;
    this.xp = xp;
  }

  void sayHello() {
    print("Hi my name is $name");
  }
}

// constructor 선언방법 2
class Player2 {
  String name;
  final int xp;

  Player2(this.name, this.xp);

  void sayHello() {
    print("Hi my name is $name");
  }
}

void main() {
  var player = Player("kamja", 1500);
  player.sayHello(); // Hi my name is kamja

  var player2 = Player("kokuma", 3000);
  player2.sayHello(); // Hi my name is kokuma

  var player3 = Player2("kamja", 2000);
  player3.sayHello();
}
