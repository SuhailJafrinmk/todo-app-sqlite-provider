class TodoModel{
  final int ? id;
  final String title;
  final String ?description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime ?reminder;
  TodoModel({this.id, required this.title,this.description, required this.createdAt, required this.updatedAt,  this.reminder});
}