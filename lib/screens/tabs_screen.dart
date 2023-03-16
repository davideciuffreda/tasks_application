// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_tasks_app/screens/add_task_screen.dart';
import 'package:flutter_tasks_app/screens/done_screen.dart';
import 'package:flutter_tasks_app/screens/favorites_screen.dart';
import 'package:flutter_tasks_app/screens/todo_screen.dart';
import 'package:flutter_tasks_app/widgets/my_drawer.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({Key? key}) : super(key: key);

  static const routeName = "/tabs";

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = [
    {
      'pageName': TodoScreen(),
      'title': 'To Do Tasks',
    },
    {
      'pageName': DoneScreen(),
      'title': 'Completed Tasks',
    },
    {
      'pageName': FavoritesScreen(),
      'title': 'Favorites Tasks',
    },
  ];

  int _selectedPageindex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageindex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(
              Icons.add,
              size: 28,
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: _pageDetails[_selectedPageindex]['pageName'],
      floatingActionButton: _selectedPageindex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageindex,
        onTap: (index) {
          setState(() {
            _selectedPageindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "To do",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all),
            label: "Completed",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
