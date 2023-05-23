class Player {
  String name = "kamja";
  final int xp = 1500;

  void sayHello() {
    print("Hi my name is $name");
    print("Hi my name is ${this.name}");
  }
}

void main() {
  var player = new Player();
  print(player.name);
  player.name = "kokuma";
  print(player.name);

  // player.xp = 2000; // 'xp' can't be used as a setter because it's final.
  player.sayHello();
}
