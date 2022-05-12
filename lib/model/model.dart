import 'package:flutter/material.dart';

class Model {
String title = '';
String author = '';
String startdate = '';
String finishdate = '';
String summary = '';
String review = '';
String star  = '';
String tropes  = '';
String lists = '';
String id = '';


  Model({ required this.id,required this.title, required this.author, required this.startdate, required this.finishdate, required this.summary, required this.review, required this.star, required this.tropes,required this.lists});

  static Model fromJson(Map<String, dynamic> json) => Model(
     title: json ['title'],
      startdate : json ['startdate'],
finishdate : json ['finishdate'],
summary :json ['summary'],
review : json ['review'],
star  : json ['star'],
tropes   : json ['tropes'],
lists : json ['lists'],
id: json ['id'], author: '',

   );

  Map<String, dynamic> toJson() => {
'title' : title,
'author' : author,
'startdate' : startdate,
'finishdate' :  finishdate,
'summary' : summary,
'review' : review,
'star'  : star,
'tropes'  : tropes,
'lists' : lists,
'id': id,
  };
}