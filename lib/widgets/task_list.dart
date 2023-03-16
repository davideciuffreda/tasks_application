// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/models/task.dart';
import 'package:flutter_tasks_app/widgets/task_tile.dart';
import '../bloc/bloc_exports.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: tasksList
              .map(
                (task) => ExpansionPanelRadio(
                  value: task.id,
                  headerBuilder: (context, isOpen) => TaskTile(task: task),
                  body: ListTile(
                    title: SelectableText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Text\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(text: task.title),
                          TextSpan(
                              text: '\n\nDescription\n',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(text: task.description),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}