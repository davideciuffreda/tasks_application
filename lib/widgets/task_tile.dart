import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/bloc/bloc_exports.dart';
import 'package:flutter_tasks_app/models/task.dart';
import 'package:flutter_tasks_app/widgets/popup_menu.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    task.isDeleted!
        ? context.read<TasksBloc>().add(DeleteTask(task: task))
        : context.read<TasksBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              SizedBox(
                width: 5,
              ),
              Icon(Icons.star_border_outlined),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        decoration:
                            task.isDone! ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    Text(
                      DateFormat().add_yMMMd().add_Hms().format(DateTime.now()),
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: task.isDone,
              onChanged: task.isDeleted == false
                  ? (value) {
                      context.read<TasksBloc>().add(UpdateTask(task: task));
                    }
                  : null,
            ),
            PopupMenu(
              task: task,
              removeOrDeleteCallBack: () => _removeOrDeleteTask(context, task),
            ),
          ],
        ),
      ],
    );
  }
}
