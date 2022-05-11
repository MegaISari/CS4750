import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import '../utils.dart';

class TodoField {
  static const createdTime = 'createdTime';
}

class Todo {
  String title;
  String id;
  String description;
  bool isDone;

  Todo({
    required this.title,
    this.description = '',
    required this.id,
    this.isDone = false,
  });

static Todo fromJson(Map<String, dynamic> json) => Todo(
     title: json ['title'],
     description:json ['description'],
     id: json ['id'],
     isDone: json ['isDone'],
   );

  Map<String, dynamic> toJson() => {
'title' : title,
'description': description,
'id': id,
'isDone' :isDone,
  };
}
