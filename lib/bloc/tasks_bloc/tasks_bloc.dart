import 'package:bloc/bloc.dart';
import 'package:flutter_tasks_app/bloc/bloc_exports.dart';
import 'package:flutter_tasks_app/models/task.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      todoTasks: List.from(state.todoTasks)..add(event.task),
      doneTasks: state.doneTasks,
      favoritesTasks: state.favoritesTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> todoTasks = state.todoTasks;
    List<Task> doneTasks = state.doneTasks;
    List<Task> favoritesTasks = state.favoritesTasks;

    task.isDone == false
        ? {
            todoTasks = List.from(todoTasks)..remove(task),
            doneTasks = List.from(doneTasks)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            doneTasks = List.from(doneTasks)..remove(task),
            todoTasks = List.from(todoTasks)
              ..insert(0, task.copyWith(isDone: false)),
          };

    emit(TasksState(
      todoTasks: todoTasks,
      doneTasks: doneTasks,
      favoritesTasks: favoritesTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        removedTasks: List.from(state.removedTasks)..remove(event.task),
        todoTasks: state.todoTasks,
        doneTasks: state.doneTasks,
        favoritesTasks: state.favoritesTasks,
      ),
    );
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        todoTasks: List.from(state.todoTasks)..remove(event.task),
        doneTasks: List.from(state.doneTasks)..remove(event.task),
        favoritesTasks: List.from(state.favoritesTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDelete: true)),
      ),
    );
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
