import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback removeOrDeleteCallBack;

  const PopupMenu({
    Key? key,
    required this.removeOrDeleteCallBack,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? ((context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    icon: Icon(Icons.delete_sharp),
                    label: Text("Delete task"),
                    onPressed: null,
                  ),
                  onTap: removeOrDeleteCallBack,
                ),
              ])
          : (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    icon: Icon(Icons.restore_outlined),
                    label: Text("Restore"),
                    onPressed: null,
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    icon: Icon(Icons.delete_forever_outlined),
                    label: Text("Delete forever"),
                    onPressed: null,
                  ),
                  onTap: () {},
                ),
              ],
    );
  }
}
