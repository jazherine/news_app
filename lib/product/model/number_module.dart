// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_firebase_full_news_app/product/utility/base/base_firebase_model.dart';

class NumberModel extends Equatable implements IdModel, BaseFireBaseModel<NumberModel> {
  NumberModel({
    this.number,
  });

  final String? number;

  @override
  // TODO: implement id
  String? id = '';

  NumberModel copyWith({
    String? number,
  }) {
    return NumberModel(
      number: number ?? this.number,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is NumberModel && runtimeType == other.runtimeType && number == other.number;

  @override
  NumberModel fromJson(Map<String, dynamic> json) {
    return NumberModel(
      number: json['number'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [number];

  @override
  NumberModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    // TODO: implement fromFirebase
    throw UnimplementedError();
  }
}
