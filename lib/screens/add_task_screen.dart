// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/bloc/bloc_exports.dart';
import 'package:flutter_tasks_app/models/task.dart';
import 'package:flutter_tasks_app/services/guid_gen.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "Add task",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: InputDecoration(
              label: Text("Title"),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            autofocus: true,
            minLines: 1,
            maxLines: 5,
            controller: descController,
            decoration: InputDecoration(
              label: Text("Description"),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Cancel",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  var task = Task(
                    title: titleController.text,
                    description: descController.text,
                    id: GUIDGen.generate(),
                  );
                  context.read<TasksBloc>().add(AddTask(task: task));
                  Navigator.pop(context);
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
