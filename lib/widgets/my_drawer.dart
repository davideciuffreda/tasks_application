// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/bloc/bloc_exports.dart';
import 'package:flutter_tasks_app/screens/recycle_bin_screen.dart';
import 'package:flutter_tasks_app/screens/tabs_screen.dart';
import 'package:flutter_tasks_app/screens/todo_screen.dart';
import 'package:flutter_tasks_app/services/app_theme.dart';

class MyDrawer extends StatelessWidget {

  bool switchValue = false;

  MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 100,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text(
                      "My tasks",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Text("${state.todoTasks.length} | ${state.doneTasks.length}"),
                  ),
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    TabsScreen.routeName,
                  ),
                );
              },
            ),
            Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (context, state) {
                return GestureDetector(
                  child: ListTile(
                    leading: Icon(Icons.disabled_by_default_rounded),
                    title: Text(
                      "Bin",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    trailing: Text("${state.removedTasks.length}"),
                  ),
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    RecycleBinScreen.routeName,
                  ),
                );
              },
            ),
            SizedBox(
              height: 480,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dark mode: ",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                  builder: (context, state) {
                    return Switch(
                      value: state.switchValue,
                      onChanged: (newValue) {
                        newValue
                            ? context.read<SwitchBloc>().add(SwitchOnEvent())
                            : context.read<SwitchBloc>().add(SwitchOffEvent());
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
