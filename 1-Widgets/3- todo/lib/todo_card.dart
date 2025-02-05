import 'package:flutter/material.dart';
import 'package:todo/todo.dart';

class TodoCard extends StatelessWidget {
  //
  final Todo todoData;

  const TodoCard({
    super.key,
    required this.todoData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 150,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      color: Colors.grey,
      child: Row(
        children: [
          Checkbox(
            value: todoData.isCkeck,
            onChanged: (value) {},
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todoData.title,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Divider(),
                Text(
                  todoData.date,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton.outlined(
            onPressed: () {},
            hoverColor: Colors.red.shade300,
            icon: Icon(Icons.remove_circle_outline),
          ),
        ],
      ),
    );
  }
}
