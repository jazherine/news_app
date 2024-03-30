import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IdModel {
  String? get id;
}

abstract class BaseFireBaseModel<T extends IdModel> {
  T fromJson(Map<String, dynamic> json);

  T? fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      return null;
    }

    //fixme id is not null
    value.addEntries([MapEntry('id', snapshot.id)]);

    return fromJson(value);
  }
}
