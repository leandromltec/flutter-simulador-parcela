class Equipment {
  String? name;
  bool isDone;

  Equipment({this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
