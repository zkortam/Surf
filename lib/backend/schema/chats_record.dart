import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "chat_messages" field.
  List<ChatMessageStruct>? _chatMessages;
  List<ChatMessageStruct> get chatMessages => _chatMessages ?? const [];
  bool hasChatMessages() => _chatMessages != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "last_message" field.
  ChatMessageStruct? _lastMessage;
  ChatMessageStruct get lastMessage => _lastMessage ?? ChatMessageStruct();
  bool hasLastMessage() => _lastMessage != null;

  // "users" field.
  List<String>? _users;
  List<String> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  void _initializeFields() {
    _chatMessages = getStructList(
      snapshotData['chat_messages'],
      ChatMessageStruct.fromMap,
    );
    _title = snapshotData['title'] as String?;
    _image = snapshotData['image'] as String?;
    _lastMessage = ChatMessageStruct.maybeFromMap(snapshotData['last_message']);
    _users = getDataList(snapshotData['users']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? title,
  String? image,
  ChatMessageStruct? lastMessage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'image': image,
      'last_message': ChatMessageStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "last_message" field.
  addChatMessageStructData(firestoreData, lastMessage, 'last_message');

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.chatMessages, e2?.chatMessages) &&
        e1?.title == e2?.title &&
        e1?.image == e2?.image &&
        e1?.lastMessage == e2?.lastMessage &&
        listEquality.equals(e1?.users, e2?.users);
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality()
      .hash([e?.chatMessages, e?.title, e?.image, e?.lastMessage, e?.users]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
