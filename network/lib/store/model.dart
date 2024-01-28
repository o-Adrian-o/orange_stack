import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:orange_network/orange_network.dart';
import 'package:flutter/widgets.dart';

class Model<T extends StatefulWidget> {
  final String path;
  dynamic data = {};
  DocumentReference<Object?> get ref =>
      FirebaseFirestore.instance.resolveDocument(path);

  Model(this.path, {this.data});

  /// Usage :
  /// ```dart
  /// model.onUpdate(() { setState(() { ... }) });
  /// ```
  void onUpdate(void Function() onUpdate) {
    ref.snapshots().listen((event) {
      data = event.data();
      onUpdate();
    });
  }

  /// Usage :
  /// ```dart
  /// model.update({"name": "John Doe"});
  /// ```
  void update(Map<String, dynamic> data) {
    ref.update(data);
  }

  /// Usage :
  /// ```dart
  /// model.set({"name": "John Doe"});
  /// ```
  void set(Map<String, dynamic> data) {
    ref.set(data);
  }

  dynamic operator [](String key) {
    return data[key];
  }
}
