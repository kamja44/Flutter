String sayHello(String name, int age, [String? country = "korea"]) =>
    "Hello $name, you are $age years old from $country";

void main() {
  var results = sayHello("kamja", 20);
  print(results);
}
