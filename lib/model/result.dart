import 'package:flutter/material.dart';
import 'package:newbook_app/model/model.dart';

class Result extends StatelessWidget {
  Model model;

  Result({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: const Text('Book Details Submitted')),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(model.title, style: const TextStyle(fontSize: 15)),
            Text(model.author, style: const TextStyle(fontSize: 15)),
            Text(model.startdate, style: const TextStyle(fontSize: 15)),
            Text(model.finishdate, style: const TextStyle(fontSize: 15)),
            Text(model.summary, style: const TextStyle(fontSize: 15)),
            Text(model.review, style: const TextStyle(fontSize: 15)),
            Text(model.star, style: const TextStyle(fontSize: 15)),
            Text(model.star, style: const TextStyle(fontSize: 15)),
            Text(model.tropes, style: const TextStyle(fontSize: 15)),
            Text(model.lists, style: const TextStyle(fontSize: 15)),
          ],
        ),
      ),
    ));
  }
}