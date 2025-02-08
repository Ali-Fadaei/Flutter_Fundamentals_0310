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

  var textIsEmpty = true;

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
  void initState() {
    print('init state!');
    taskCtrl.addListener(() {
      setState(() {
        textIsEmpty = taskCtrl.text.isEmpty;
      });
    });
    super.initState();
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
                  // spacing: 16,
                  children: tasks.expand((value) {
                    return [
                      TodoCard(todoData: value),
                      const SizedBox(height: 16)
                    ];
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      hintText: 'write you\'re task here!',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                IconButton.filled(
                  iconSize: 40,
                  icon: Icon(
                    Icons.add_task,
                    size: 30,
                  ),
                  onPressed: textIsEmpty ? null : onTaskAddPressed,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
