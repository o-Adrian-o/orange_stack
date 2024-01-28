import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orange_network/orange_network.dart';

class Collection {
  final String path;
  List<Model> models = List.empty();
  CollectionReference<Object?> get ref =>
      FirebaseFirestore.instance.resolveCollection(path);

  Collection(this.path);

  /// Usage :
  /// ```dart
  /// collection.onUpdate(() { setState(() { ... }) });
  /// ```
  void onUpdate(void Function() onUpdate) {
    ref.snapshots().listen((event) {
      models = event.docs
          .map((e) => Model("$path/${e.id}", data: e.data()))
          .toList();
      onUpdate();
    });
  }

  /// Usage :
  /// ```dart
  /// collection.add({"name": "John Doe"});
  /// ```
  void add(Map<String, dynamic> data) {
    ref.add(data);
  }

  /// Usage :
  /// ```dart
  /// collection.remove("123");
  /// ```
  void remove(String id) {
    ref.doc(id).delete();
  }
}