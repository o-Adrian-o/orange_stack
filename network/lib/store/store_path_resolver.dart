import 'package:cloud_firestore/cloud_firestore.dart';

extension PathResolver on FirebaseFirestore {
  DocumentReference resolveDocument(String path) =>
      resolve(path) as DocumentReference;

  CollectionReference resolveCollection(String path) =>
      resolve(path) as CollectionReference;

  dynamic resolve(String path) {
    final parts = path.split("/");
    dynamic current;
    var level = 0;

    while (level < parts.length) {
      final key = parts[level];
      if (level % 2 == 0) {
        if (level == 0) {
          current = collection(key);
        } else {
          current = current.collection(key);
        }
      } else {
        current = current.doc(key);
      }
      level++;
    }

    return current;
  }
}
