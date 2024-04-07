// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_firebase_full_news_app/product/enums/platform_enum.dart';
import 'package:flutter_firebase_full_news_app/product/model/number_module.dart';
import 'package:flutter_firebase_full_news_app/product/utility/firebase/firebase_collections.dart';
import 'package:flutter_firebase_full_news_app/product/utility/version_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider() : super(const SplashState());

  Future<void> checkApplicationVersion(String clientVersion) async {
    final databaseValue = await getVersionNumberFromDatabase();

    if (databaseValue == null || databaseValue.isEmpty) {
      state = state.copyWith(isRedirectHome: false);
      return;
    }
    final checkIsNeedForceUpdate = VersionManager(deviceValue: clientVersion, databasevalue: databaseValue);

    if (checkIsNeedForceUpdate.isNeedUpdate()) {
      state = state.copyWith(isRequiredForceUpdate: true);
      return;
    }

    state = state.copyWith(isRedirectHome: true);
  }

  Future<String?> getVersionNumberFromDatabase() async {
    final response = await FirebaseCollections.version.reference
        .withConverter<NumberModel>(
          fromFirestore: (snapshot, options) {
            return NumberModel().fromFirebase(snapshot);
          },
          toFirestore: (value, options) => value.toJson(),
        )
        .doc(PlatformEnum.versionName)
        .get();
    final numberModel = response.data();
    if (numberModel != null) {
      return numberModel.number;
    } else {
      return '1.0.0';
    }
  }
}

class SplashState extends Equatable {
  const SplashState({this.isRequiredForceUpdate, this.isRedirectHome});

  final bool? isRequiredForceUpdate;
  final bool? isRedirectHome;

  @override
  // TODO: implement props
  List<Object?> get props => [isRequiredForceUpdate, isRedirectHome];

  SplashState copyWith({
    bool? isRequiredForceUpdate,
    bool? isRedirectHome,
  }) {
    return SplashState(
      isRequiredForceUpdate: isRequiredForceUpdate ?? this.isRequiredForceUpdate,
      isRedirectHome: isRedirectHome ?? this.isRedirectHome,
    );
  }
}
