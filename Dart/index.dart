mixin Strong {
  final double strengthLevel = 1500.99;
}

mixin QuickRunner {
  void runQuick() {
    print("runnnnnnnnnn!");
  }
}

mixin Tall {
  final double height = 1.99;
}

enum Team { red, blue }

class Player with Strong, QuickRunner, Tall {}

class Horse with Strong, QuickRunner {}

class Kid with QuickRunner {}

void main() {}
