import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ShortsRecord extends FirestoreRecord {
  ShortsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "videourl" field.
  String? _videourl;
  String get videourl => _videourl ?? '';
  bool hasVideourl() => _videourl != null;

  // "caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  bool hasCaption() => _caption != null;

  // "comments" field.
  CommentStruct? _comments;
  CommentStruct get comments => _comments ?? CommentStruct();
  bool hasComments() => _comments != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "likers" field.
  List<DocumentReference>? _likers;
  List<DocumentReference> get likers => _likers ?? const [];
  bool hasLikers() => _likers != null;

  void _initializeFields() {
    _author = snapshotData['author'] as DocumentReference?;
    _videourl = snapshotData['videourl'] as String?;
    _caption = snapshotData['caption'] as String?;
    _comments = CommentStruct.maybeFromMap(snapshotData['comments']);
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _likers = getDataList(snapshotData['likers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shorts');

  static Stream<ShortsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShortsRecord.fromSnapshot(s));

  static Future<ShortsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShortsRecord.fromSnapshot(s));

  static ShortsRecord fromSnapshot(DocumentSnapshot snapshot) => ShortsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShortsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShortsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShortsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShortsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShortsRecordData({
  DocumentReference? author,
  String? videourl,
  String? caption,
  CommentStruct? comments,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'author': author,
      'videourl': videourl,
      'caption': caption,
      'comments': CommentStruct().toMap(),
      'timestamp': timestamp,
    }.withoutNulls,
  );

  // Handle nested data for "comments" field.
  addCommentStructData(firestoreData, comments, 'comments');

  return firestoreData;
}

class ShortsRecordDocumentEquality implements Equality<ShortsRecord> {
  const ShortsRecordDocumentEquality();

  @override
  bool equals(ShortsRecord? e1, ShortsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.author == e2?.author &&
        e1?.videourl == e2?.videourl &&
        e1?.caption == e2?.caption &&
        e1?.comments == e2?.comments &&
        e1?.timestamp == e2?.timestamp &&
        listEquality.equals(e1?.likers, e2?.likers);
  }

  @override
  int hash(ShortsRecord? e) => const ListEquality().hash([
        e?.author,
        e?.videourl,
        e?.caption,
        e?.comments,
        e?.timestamp,
        e?.likers
      ]);

  @override
  bool isValidKey(Object? o) => o is ShortsRecord;
}
