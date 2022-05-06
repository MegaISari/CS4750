import 'package:flutter/material.dart';

class bottomNav extends StatefulWidget {

  @override
  _bottomNavState createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Container(
      child: const Center(child: Text( 'To Read Page: Books added to To Read list will show up here')),
    ),
    Container(
      child: const Center(child: Text('Finished: Books that are finished will show up here')),
    ),
    Container(
      child: const Center(child: Text( 'Organized: Organizing your books based on tropes and others')),
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  title: Text('New Book'),
          centerTitle: true,
          backgroundColor: Colors.pink,
      ),
      body: Center(
      child: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondPage(),
              )
          );
        },
        backgroundColor: Colors.blue[500],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>
        [
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'To read',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: 'Finished',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Organize',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
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
