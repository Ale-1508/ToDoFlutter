class ToDo {
  final String description;
  
  ToDo({
    required this.description,
    DateTime? expiry,
    bool? important = false
  });

}