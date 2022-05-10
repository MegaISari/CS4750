import 'package:flutter/material.dart';
import 'package:newbook_app/widget/add_dialog_widget.dart';
import 'package:newbook_app/widget/toReadListWidget.dart';
import 'package:newbook_app/widget/completed_list_widget.dart';

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
      Container(),
    ];

    return Scaffold(
      appBar: AppBar(  title: Text('New Book'),
          centerTitle: true,
          backgroundColor: Colors.pink,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
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
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Organize',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: Colors.pink,
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

class SecondPage extends StatelessWidget {
   SecondPage({Key? key}) : super(key: key);

final title = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Book'),
      ),
      body: SingleChildScrollView(
        child: Column(
      children: <Widget>[
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter the title of the book',
        ),
      ),
    ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            controller: title,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter the name of the author',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your start date of reading the book',
            ),
          ),
        ),
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter your finish date of reading the book',
    ),
    ),
    ),
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
    child: TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
    decoration: const InputDecoration(
    border: UnderlineInputBorder(),
    labelText: 'Write your summary after reading the book',
    ),
    ),
    ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Write your review after reading the book',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your stars out of 5 after reading the book',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter the tropes included in the book',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter the name of the lists you wanted',
            ),
          ),
        ),
        RaisedButton(onPressed: null,
        child: Text('Submit'),
        ),
    ],
      ),
      ),
    );
  }
}
