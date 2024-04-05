// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_firebase_full_news_app/product/utility/exception/custom_exception.dart';

class VersionManager {
  VersionManager({
    required this.deviceValue,
    required this.databasevalue,
  });

  final String deviceValue;
  final String databasevalue;

  bool isNeedUpdate() {
    final deviceNumberSplited = deviceValue.split('.').join();
    final databaseNumberSplited = databasevalue.split('.').join();

    final deviceNumber = int.tryParse(deviceNumberSplited);
    final databaseNumber = int.tryParse(databaseNumberSplited);

    if (deviceNumber == null || databaseNumber == null) {
      throw VersionCustomException('$deviceValue or $databasevalue is not valid for parse ');
    }

    return deviceNumber < databaseNumber;
  }
}
