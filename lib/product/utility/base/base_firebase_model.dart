import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_full_news_app/product/utility/exception/custom_exception.dart';

mixin IdModel {
  String? get id;
}

mixin BaseFireBaseModel<T extends IdModel> {
  T fromJson(Map<String, dynamic> json);

  T fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw FirebaseCustomException('$snapshot data is null  ');
    }

    //fixme id is not null
    value.addEntries([MapEntry('id', snapshot.id)]);

    return fromJson(value);
  }
}
