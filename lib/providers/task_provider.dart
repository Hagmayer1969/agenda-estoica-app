import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  late Box<Task> _taskBox;
  List<Task> _tasks = [];
  final Uuid _uuid = const Uuid();

  TaskProvider() {
    _initializeBox();
  }

  Future<void> _initializeBox() async {
    _taskBox = Hive.box<Task>('tasks');
    _loadTasks();
  }

  void _loadTasks() {
    _tasks = _taskBox.values.toList();
    _tasks.sort((a, b) {
      // Sort by completion status first (incomplete first)
      if (a.isCompleted != b.isCompleted) {
        return a.isCompleted ? 1 : -1;
      }
      // Then by priority (high to low)
      if (a.priority != b.priority) {
        return b.priority.compareTo(a.priority);
      }
      // Finally by due date
      if (a.dueDate != null && b.dueDate != null) {
        return a.dueDate!.compareTo(b.dueDate!);
      }
      return 0;
    });
    notifyListeners();
  }

  List<Task> get tasks => _tasks;

  List<Task> get incompleteTasks =>
      _tasks.where((task) => !task.isCompleted).toList();

  List<Task> get completedTasks =>
      _tasks.where((task) => task.isCompleted).toList();

  List<Task> getTasksByDate(DateTime date) {
    return _tasks.where((task) {
      if (task.dueDate == null) return false;
      return task.dueDate!.year == date.year &&
          task.dueDate!.month == date.month &&
          task.dueDate!.day == date.day;
    }).toList();
  }

  List<Task> getTasksByPriority(int priority) {
    return _tasks.where((task) => task.priority == priority).toList();
  }

  Future<void> addTask(Task task) async {
    final newTask = Task(
      id: _uuid.v4(),
      title: task.title,
      description: task.description,
      createdAt: DateTime.now(),
      dueDate: task.dueDate,
      priority: task.priority,
      tags: task.tags,
      stoicReflection: task.stoicReflection,
    );
    
    await _taskBox.put(newTask.id, newTask);
    _loadTasks();
  }

  Future<void> updateTask(Task task) async {
    await _taskBox.put(task.id, task);
    _loadTasks();
  }

  Future<void> deleteTask(String id) async {
    await _taskBox.delete(id);
    _loadTasks();
  }

  Future<void> toggleTaskCompletion(String id) async {
    final task = _taskBox.get(id);
    if (task != null) {
      final updatedTask = task.copyWith(isCompleted: !task.isCompleted);
      await _taskBox.put(id, updatedTask);
      _loadTasks();
    }
  }

  Future<void> clearCompletedTasks() async {
    final completedIds = _tasks
        .where((task) => task.isCompleted)
        .map((task) => task.id)
        .toList();
    
    for (final id in completedIds) {
      await _taskBox.delete(id);
    }
    _loadTasks();
  }

  int get totalTasks => _tasks.length;
  int get incompletedTaskCount => incompleteTasks.length;
  int get completedTaskCount => completedTasks.length;

  double get completionRate {
    if (_tasks.isEmpty) return 0.0;
    return completedTaskCount / totalTasks;
  }
}
