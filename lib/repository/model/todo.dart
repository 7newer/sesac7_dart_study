import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable(explicitToJson: true)
class Todo {

  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(
      {required this.userId, required this.id, required this.title, required this.completed});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Todo && runtimeType == other.runtimeType &&
              userId == other.userId && id == other.id &&
              title == other.title && completed == other.completed;

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;

  Todo copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return Todo(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);
}