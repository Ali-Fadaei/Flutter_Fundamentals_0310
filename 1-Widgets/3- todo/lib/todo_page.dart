import 'package:flutter/material.dart';
import 'package:todo/todo.dart';
import 'package:todo/todo_card.dart';

class TodoPage extends StatefulWidget {
  //
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  //
  final taskCtrl = TextEditingController();

  final List<Todo> tasks = [];

  void onTaskAddPressed() {
    setState(() {
      var data = Todo(
        title: taskCtrl.text,
        date: DateTime.now().toString(),
      );
      tasks.add(data);
      taskCtrl.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TODO APP',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      drawer: Container(
        height: double.infinity,
        width: 200,
        color: Colors.white,
        // color: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: tasks.map((value) {
                    return TodoCard(todoData: value);
                  }).toList(),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskCtrl,
                    decoration: InputDecoration(
                      hintText: 'write you\'re task here!',
                    ),
                  ),
                ),
                IconButton.filled(
                  iconSize: 40,
                  onPressed: onTaskAddPressed,
                  icon: Icon(Icons.add_task),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
