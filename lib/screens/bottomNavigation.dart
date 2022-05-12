import 'package:flutter/material.dart';
import 'package:newbook_app/widget/add_dialog_widget.dart';
import 'package:newbook_app/widget/toReadListWidget.dart';
import 'package:newbook_app/widget/completed_list_widget.dart';
import 'package:provider/provider.dart';

import '../api/firebase_api.dart';
import '../model/todo.dart';
import 'package:newbook_app/provider/todos.dart';

class bottomNavigation extends StatefulWidget {

  @override
  _bottomNavigationState createState() => _bottomNavigationState();
}

class _bottomNavigationState extends State<bottomNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      toReadListWidget(),
      CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(  title: Text('New Book'),
          centerTitle: true,
          backgroundColor: Colors.pink,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:  Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index; 
        }),
        items: const <BottomNavigationBarItem>
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'To read',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Finished',
          ),
        ],
      ),
       body: StreamBuilder<List<Todo>>(
        stream: FirebaseApi.readTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return buildText('Something Went Wrong Try later');
              } else {
                final todos = snapshot.data;

                final provider = Provider.of<TodosProvider>(context);
                provider.setTodos(todos!);

                return tabs[selectedIndex];
              }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
      backgroundColor: Colors.blue,
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AddTodoDialogWidget(),
        barrierDismissible: false,
      ),
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
