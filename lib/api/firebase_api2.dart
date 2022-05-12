import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:newbook_app/model/model.dart';
import 'package:newbook_app/utils.dart';

class FirebaseApi {
  static Future<String> createTodo(Model detail) async {
    final docDetail = FirebaseFirestore.instance.collection('detail').doc();

    detail.id = docDetail.id;
    await docDetail.set(detail.toJson());

    return docDetail.id;
  }

  static Stream<List<Model>> readTodos() => FirebaseFirestore.instance
      .collection('detail')
      .snapshots()
      .transform(Utils.transformer(Model.fromJson));

  static Future updateTodo(Model detail) async {
    final docTodo = FirebaseFirestore.instance.collection('detail').doc(detail.id);

    await docTodo.update(detail.toJson());
  }

  static Future deleteTodo(Model detail) async {
    final docTodo = FirebaseFirestore.instance.collection('detail').doc(detail.id);

    await docTodo.delete();
  }
}