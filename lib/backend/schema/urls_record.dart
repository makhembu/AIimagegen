import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UrlsRecord extends FirestoreRecord {
  UrlsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('urls');

  static Stream<UrlsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UrlsRecord.fromSnapshot(s));

  static Future<UrlsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UrlsRecord.fromSnapshot(s));

  static UrlsRecord fromSnapshot(DocumentSnapshot snapshot) => UrlsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UrlsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UrlsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UrlsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UrlsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUrlsRecordData({
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class UrlsRecordDocumentEquality implements Equality<UrlsRecord> {
  const UrlsRecordDocumentEquality();

  @override
  bool equals(UrlsRecord? e1, UrlsRecord? e2) {
    return e1?.url == e2?.url;
  }

  @override
  int hash(UrlsRecord? e) => const ListEquality().hash([e?.url]);

  @override
  bool isValidKey(Object? o) => o is UrlsRecord;
}
