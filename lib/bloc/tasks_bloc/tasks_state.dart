// ignore_for_file: dead_code

part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> todoTasks;
  final List<Task> doneTasks;
  final List<Task> favoritesTasks;
  final List<Task> removedTasks;

  const TasksState({
    this.todoTasks = const <Task>[],
    this.doneTasks = const <Task>[],
    this.favoritesTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object> get props => [
        todoTasks,
        doneTasks,
        favoritesTasks,
        removedTasks,
      ];

  Map<String, dynamic> toMap() {
    return {
      'todoTasks': todoTasks.map((e) => e.toMap()).toList(),
      'doneTasks': doneTasks.map((e) => e.toMap()).toList(),
      'favoritesTasks': favoritesTasks.map((e) => e.toMap()).toList(),
      'removedTasks': removedTasks.map((e) => e.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      todoTasks: List<Task>.from(map['todoTasks']?.map((e) => Task.fromMap(e))),
      doneTasks: List<Task>.from(map['doneTasks']?.map((e) => Task.fromMap(e))),
      favoritesTasks:
          List<Task>.from(map['favoritesTasks']?.map((e) => Task.fromMap(e))),
      removedTasks:
          List<Task>.from(map['removedTasks']?.map((e) => Task.fromMap(e))),
    );
  }
}
