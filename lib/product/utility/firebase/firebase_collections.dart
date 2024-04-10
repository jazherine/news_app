import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseCollections {
  news,
  tag,
  version;

  CollectionReference get reference => FirebaseFirestore.instance.collection(name);
}
