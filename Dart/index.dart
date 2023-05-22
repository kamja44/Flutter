void main() {
  var oldFriends = ["kamja", "kokuma"];
  var newFriends = [
    "kimchi",
    "potato",
    "rice",
    for (var friend in oldFriends) "🍙  $friend",
  ];
  // list 안의 for문은 다음과 같다.
  // for(var friend in oldFriends){newFriend.add("🍙  $friend");}
  print(newFriends); // [kimchi, potato, rice, 🍙  kamja, 🍙  kokuma]
}
