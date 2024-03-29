
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newbook_app/provider/todos.dart';
import 'package:newbook_app/widget/todo_widget.dart';

class toReadListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? Center(
            child: Text(
              'To Read Page: Books added to To Read list will show up here',
              style: TextStyle(fontSize: 12),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            separatorBuilder: (context, index) => Container(height: 8),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(todo: todo);
            },
          );
  }
}