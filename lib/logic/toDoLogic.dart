class ToDo {
  final String description;
  DateTime? expiry;
  bool important;
  
  ToDo({
    required this.description,
    this.expiry,
    this.important = false,
  });

  void setImportant(bool value) {
    important = value;
  }
}