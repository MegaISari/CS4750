import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
import 'package:newbook_app/model/model.dart';
import 'package:newbook_app/model/result.dart';

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}
class _TestFormState extends State<TestForm> {
  
  final _formKey = GlobalKey<FormState>();
  Model model = Model(author: '', finishdate: '', lists: '', review: '', star: '', startdate: '', summary: '', title: '', tropes: '', id: '');

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

  return Scaffold(
    appBar: AppBar( title: Text('Your Book'),), 
   body: SingleChildScrollView(
     child: Form(
     key: _formKey,
     child: Column(
       children: <Widget>[
         Container(
           alignment: Alignment.topCenter,
           child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Container(
                 alignment: Alignment.topCenter,
                 width: halfMediaWidth,
                 child: MyTextFormField(
                   hintText: 'Enter the title of the book',
                   validator: (String value) {
                     if (value.isEmpty) {
                       return 'Enter the title of the book';
                     }
                     return null;
                   },
                   onSaved: (String value) {
                     model.title = value;
                   },
                 ),
               ),
               Container(
                 alignment: Alignment.topCenter,
                 width: halfMediaWidth,
                 child: MyTextFormField(
                   hintText: 'Enter the name of the author(s)',
                   validator: (String value) {
                     if (value.isEmpty) {
                       return 'Enter the name of the author(s)';
                     }
                     return null;
                   },
                   onSaved: (String value) {
                     model.author = value;
                   },
                 ),
               )
             ],
           ),
         ),
         MyTextFormField(
           hintText: 'Enter the start date',
           validator: (String value) {
             if (value.isEmpty) {
               return 'Enter the start date';
             }
             return null;
           },
           onSaved: (String value) {
             model.startdate = value;
           },
         ),
        MyTextFormField(
           hintText: 'Enter the finish date',
           validator: (String value) {
             if (value.isEmpty) {
               return 'Enter the finish date';
             }
             return null;
           },
           onSaved: (String value) {
             model.finishdate = value;
           },
         ),
         MyTextFormField(
           hintText: 'Enter the summary',
           validator: (String value) {
             if (value.isEmpty) {
               return 'Enter the summary';
             }
             return null;
           },
           onSaved: (String value) {
             model.summary = value;
           },
         ),
          MyTextFormField(
           hintText: 'Enter the review',
           validator: (String value) {
             if (value.isEmpty) {
               return 'Enter the review';
             }
             return null;
           },
           onSaved: (String value) {
             model.review = value;
           },
         ),
          MyTextFormField(
           hintText: 'Enter the star',
           validator: (String value) {
             if (value.isEmpty) {
               return 'Enter the star';
             }
             return null;
           },
           onSaved: (String value) {
             model.star = value;
           },
         ),
          MyTextFormField(
           hintText: 'Enter the tropes',
           validator: (String value) {
             if (value.isEmpty) {
               return 'Enter the tropes';
             }
             return null;
           },
           onSaved: (String value) {
             model.summary = value;
           },
         ),
          MyTextFormField(
           hintText: 'Enter the lists',
           validator: (String value) {
             if (value.isEmpty) {
               return 'Enter the lists';
             }
             return null;
           },
           onSaved: (String value) {
             model.lists = value;
           },
         ),
         RaisedButton(
           color: Colors.blueAccent,
           onPressed: () {
          if (_formKey.currentState!.validate()) {
                 _formKey.currentState!.save();
               Navigator.pop(context);
               print('succesfully saved');
          }
           },
           child: Text(
             'Submit',
             style: TextStyle(
               color: Colors.white,
             ),
           ),
         )
       ],
     ),
     )
   )
   );
  }
}

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;

  MyTextFormField({
    required this.hintText,
    required this.validator,
    required this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        onSaved: (val) {
      print('saved');
        },
         validator: (val) {
      print('validating');
    },
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
