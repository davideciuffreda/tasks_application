// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/models/task.dart';
import 'package:flutter_tasks_app/widgets/task_list.dart';

import '../bloc/bloc_exports.dart';

class TodoScreen extends StatelessWidget {
  static const String routeName = "/tasks";

  TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.todoTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${tasksList.length} to do | ${state.doneTasks.length} done',
                ),
              ),
            ),
            TaskList(tasksList: tasksList),
          ],
        );
      },
    );
  }
}
