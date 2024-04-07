import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseCloudStorage {
  FirebaseCloudStorage._();
  static final FirebaseCloudStorage instance = FirebaseCloudStorage._();

  static final _storage = FirebaseStorage.instance;

  final gsReference = _storage.refFromURL('gs://flutter-full-newss.appspot.com/oldpalace.png');

  Future<String?> fetchImage() async {
    final response = await gsReference.getDownloadURL();
    if (response == null) {
      Exception("ananıskm");
    } else {
      return response;
    }
  }
}
