import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SavedImagesRecord extends FirestoreRecord {
  SavedImagesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "urls" field.
  List<String>? _urls;
  List<String> get urls => _urls ?? const [];
  bool hasUrls() => _urls != null;

  void _initializeFields() {
    _urls = getDataList(snapshotData['urls']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('saved_images');

  static Stream<SavedImagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SavedImagesRecord.fromSnapshot(s));

  static Future<SavedImagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SavedImagesRecord.fromSnapshot(s));

  static SavedImagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SavedImagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SavedImagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SavedImagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SavedImagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SavedImagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSavedImagesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class SavedImagesRecordDocumentEquality implements Equality<SavedImagesRecord> {
  const SavedImagesRecordDocumentEquality();

  @override
  bool equals(SavedImagesRecord? e1, SavedImagesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.urls, e2?.urls);
  }

  @override
  int hash(SavedImagesRecord? e) => const ListEquality().hash([e?.urls]);

  @override
  bool isValidKey(Object? o) => o is SavedImagesRecord;
}
