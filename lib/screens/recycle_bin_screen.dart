// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/widgets/my_drawer.dart';
import 'package:flutter_tasks_app/widgets/task_list.dart';

import '../bloc/bloc_exports.dart';

class RecycleBinScreen extends StatefulWidget {
  static const String routeName = "/recycle-bin";

  const RecycleBinScreen({Key? key}) : super(key: key);

  @override
  State<RecycleBinScreen> createState() => _RecycleBinScreenState();
}

class _RecycleBinScreenState extends State<RecycleBinScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  size: 28,
                ),
              )
            ],
          ),
          drawer: MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text(
                    '${state.removedTasks.length} tasks deleted',
                  ),
                ),
              ),
              TaskList(tasksList: state.removedTasks),
            ],
          ),
        );
      },
    );
  }
}
