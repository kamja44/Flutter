String capitalizeName(String? name) => name?.toUpperCase() ?? "ANON";

void main() {
  capitalizeName("kamja"); // KAMJA
  capitalizeName(null);

  // ??= operator
  String? name;
  name ??= "kamja";
}
