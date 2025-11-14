import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String? description;

  @HiveField(3)
  DateTime createdAt;

  @HiveField(4)
  DateTime? dueDate;

  @HiveField(5)
  bool isCompleted;

  @HiveField(6)
  int priority; // 0: Low, 1: Medium, 2: High

  @HiveField(7)
  List<String> tags;

  @HiveField(8)
  String? stoicReflection;

  Task({
    required this.id,
    required this.title,
    this.description,
    required this.createdAt,
    this.dueDate,
    this.isCompleted = false,
    this.priority = 1,
    List<String>? tags,
    this.stoicReflection,
  }) : tags = tags ?? [];

  Task copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? dueDate,
    bool? isCompleted,
    int? priority,
    List<String>? tags,
    String? stoicReflection,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
      tags: tags ?? this.tags,
      stoicReflection: stoicReflection ?? this.stoicReflection,
    );
  }

  String get priorityLabel {
    switch (priority) {
      case 0:
        return 'Baixa';
      case 2:
        return 'Alta';
      default:
        return 'Média';
    }
  }
}
