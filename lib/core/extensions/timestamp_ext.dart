// core/extensions/map_timestamp_ext.dart

import 'package:cloud_firestore/cloud_firestore.dart';

extension MapTimestampX on Map<String, dynamic> {
  DateTime? timestamp(String key) {
    return (this[key] as Timestamp?)?.toDate();
  }
}
