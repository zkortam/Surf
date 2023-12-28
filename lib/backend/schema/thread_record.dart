import 'dart:async';

import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ThreadRecord extends FirestoreRecord {
  ThreadRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "thread" field.
  ThreadStruct? _thread;
  ThreadStruct get thread => _thread ?? ThreadStruct();
  bool hasThread() => _thread != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  void _initializeFields() {
    _thread = ThreadStruct.maybeFromMap(snapshotData['thread']);
    _title = snapshotData['title'] as String?;
    _text = snapshotData['text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('thread');

  static Stream<ThreadRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ThreadRecord.fromSnapshot(s));

  static Future<ThreadRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ThreadRecord.fromSnapshot(s));

  static ThreadRecord fromSnapshot(DocumentSnapshot snapshot) => ThreadRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ThreadRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ThreadRecord._(reference, mapFromFirestore(data));

  static ThreadRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ThreadRecord.getDocumentFromData(
        {
          'thread': ThreadStruct.fromAlgoliaData(snapshot.data['thread'] ?? {})
              .toMap(),
          'title': snapshot.data['title'],
          'text': snapshot.data['text'],
        },
        ThreadRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ThreadRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'thread',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ThreadRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ThreadRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createThreadRecordData({
  ThreadStruct? thread,
  String? title,
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'thread': ThreadStruct().toMap(),
      'title': title,
      'text': text,
    }.withoutNulls,
  );

  // Handle nested data for "thread" field.
  addThreadStructData(firestoreData, thread, 'thread');

  return firestoreData;
}

class ThreadRecordDocumentEquality implements Equality<ThreadRecord> {
  const ThreadRecordDocumentEquality();

  @override
  bool equals(ThreadRecord? e1, ThreadRecord? e2) {
    return e1?.thread == e2?.thread &&
        e1?.title == e2?.title &&
        e1?.text == e2?.text;
  }

  @override
  int hash(ThreadRecord? e) =>
      const ListEquality().hash([e?.thread, e?.title, e?.text]);

  @override
  bool isValidKey(Object? o) => o is ThreadRecord;
}
