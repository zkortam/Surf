// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThreadStruct extends FFFirebaseStruct {
  ThreadStruct({
    DateTime? timestamp,
    String? author,
    String? title,
    String? text,
    int? netVotes,
    String? id,
    List<String>? upVoters,
    List<String>? downVoters,
    PollStruct? poll,
    bool? isPoll,
    bool? isPolitical,
    int? politicalPosition,
    int? genre,
    List<String>? hashtags,
    String? link,
    String? summary,
    List<CommentStruct>? comments,
    bool? isStealth,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _timestamp = timestamp,
        _author = author,
        _title = title,
        _text = text,
        _netVotes = netVotes,
        _id = id,
        _upVoters = upVoters,
        _downVoters = downVoters,
        _poll = poll,
        _isPoll = isPoll,
        _isPolitical = isPolitical,
        _politicalPosition = politicalPosition,
        _genre = genre,
        _hashtags = hashtags,
        _link = link,
        _summary = summary,
        _comments = comments,
        _isStealth = isStealth,
        super(firestoreUtilData);

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;
  bool hasTimestamp() => _timestamp != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;
  bool hasAuthor() => _author != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "netVotes" field.
  int? _netVotes;
  int get netVotes => _netVotes ?? 0;
  set netVotes(int? val) => _netVotes = val;
  void incrementNetVotes(int amount) => _netVotes = netVotes + amount;
  bool hasNetVotes() => _netVotes != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "upVoters" field.
  List<String>? _upVoters;
  List<String> get upVoters => _upVoters ?? const [];
  set upVoters(List<String>? val) => _upVoters = val;
  void updateUpVoters(Function(List<String>) updateFn) =>
      updateFn(_upVoters ??= []);
  bool hasUpVoters() => _upVoters != null;

  // "downVoters" field.
  List<String>? _downVoters;
  List<String> get downVoters => _downVoters ?? const [];
  set downVoters(List<String>? val) => _downVoters = val;
  void updateDownVoters(Function(List<String>) updateFn) =>
      updateFn(_downVoters ??= []);
  bool hasDownVoters() => _downVoters != null;

  // "poll" field.
  PollStruct? _poll;
  PollStruct get poll => _poll ?? PollStruct();
  set poll(PollStruct? val) => _poll = val;
  void updatePoll(Function(PollStruct) updateFn) =>
      updateFn(_poll ??= PollStruct());
  bool hasPoll() => _poll != null;

  // "isPoll" field.
  bool? _isPoll;
  bool get isPoll => _isPoll ?? false;
  set isPoll(bool? val) => _isPoll = val;
  bool hasIsPoll() => _isPoll != null;

  // "isPolitical" field.
  bool? _isPolitical;
  bool get isPolitical => _isPolitical ?? false;
  set isPolitical(bool? val) => _isPolitical = val;
  bool hasIsPolitical() => _isPolitical != null;

  // "politicalPosition" field.
  int? _politicalPosition;
  int get politicalPosition => _politicalPosition ?? 0;
  set politicalPosition(int? val) => _politicalPosition = val;
  void incrementPoliticalPosition(int amount) =>
      _politicalPosition = politicalPosition + amount;
  bool hasPoliticalPosition() => _politicalPosition != null;

  // "genre" field.
  int? _genre;
  int get genre => _genre ?? 0;
  set genre(int? val) => _genre = val;
  void incrementGenre(int amount) => _genre = genre + amount;
  bool hasGenre() => _genre != null;

  // "hashtags" field.
  List<String>? _hashtags;
  List<String> get hashtags => _hashtags ?? const [];
  set hashtags(List<String>? val) => _hashtags = val;
  void updateHashtags(Function(List<String>) updateFn) =>
      updateFn(_hashtags ??= []);
  bool hasHashtags() => _hashtags != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  set summary(String? val) => _summary = val;
  bool hasSummary() => _summary != null;

  // "comments" field.
  List<CommentStruct>? _comments;
  List<CommentStruct> get comments => _comments ?? const [];
  set comments(List<CommentStruct>? val) => _comments = val;
  void updateComments(Function(List<CommentStruct>) updateFn) =>
      updateFn(_comments ??= []);
  bool hasComments() => _comments != null;

  // "isStealth" field.
  bool? _isStealth;
  bool get isStealth => _isStealth ?? false;
  set isStealth(bool? val) => _isStealth = val;
  bool hasIsStealth() => _isStealth != null;

  static ThreadStruct fromMap(Map<String, dynamic> data) => ThreadStruct(
        timestamp: data['timestamp'] as DateTime?,
        author: data['author'] as String?,
        title: data['title'] as String?,
        text: data['text'] as String?,
        netVotes: castToType<int>(data['netVotes']),
        id: data['id'] as String?,
        upVoters: getDataList(data['upVoters']),
        downVoters: getDataList(data['downVoters']),
        poll: PollStruct.maybeFromMap(data['poll']),
        isPoll: data['isPoll'] as bool?,
        isPolitical: data['isPolitical'] as bool?,
        politicalPosition: castToType<int>(data['politicalPosition']),
        genre: castToType<int>(data['genre']),
        hashtags: getDataList(data['hashtags']),
        link: data['link'] as String?,
        summary: data['summary'] as String?,
        comments: getStructList(
          data['comments'],
          CommentStruct.fromMap,
        ),
        isStealth: data['isStealth'] as bool?,
      );

  static ThreadStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ThreadStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'timestamp': _timestamp,
        'author': _author,
        'title': _title,
        'text': _text,
        'netVotes': _netVotes,
        'id': _id,
        'upVoters': _upVoters,
        'downVoters': _downVoters,
        'poll': _poll?.toMap(),
        'isPoll': _isPoll,
        'isPolitical': _isPolitical,
        'politicalPosition': _politicalPosition,
        'genre': _genre,
        'hashtags': _hashtags,
        'link': _link,
        'summary': _summary,
        'comments': _comments?.map((e) => e.toMap()).toList(),
        'isStealth': _isStealth,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'netVotes': serializeParam(
          _netVotes,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'upVoters': serializeParam(
          _upVoters,
          ParamType.String,
          true,
        ),
        'downVoters': serializeParam(
          _downVoters,
          ParamType.String,
          true,
        ),
        'poll': serializeParam(
          _poll,
          ParamType.DataStruct,
        ),
        'isPoll': serializeParam(
          _isPoll,
          ParamType.bool,
        ),
        'isPolitical': serializeParam(
          _isPolitical,
          ParamType.bool,
        ),
        'politicalPosition': serializeParam(
          _politicalPosition,
          ParamType.int,
        ),
        'genre': serializeParam(
          _genre,
          ParamType.int,
        ),
        'hashtags': serializeParam(
          _hashtags,
          ParamType.String,
          true,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'summary': serializeParam(
          _summary,
          ParamType.String,
        ),
        'comments': serializeParam(
          _comments,
          ParamType.DataStruct,
          true,
        ),
        'isStealth': serializeParam(
          _isStealth,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ThreadStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThreadStruct(
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        netVotes: deserializeParam(
          data['netVotes'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        upVoters: deserializeParam<String>(
          data['upVoters'],
          ParamType.String,
          true,
        ),
        downVoters: deserializeParam<String>(
          data['downVoters'],
          ParamType.String,
          true,
        ),
        poll: deserializeStructParam(
          data['poll'],
          ParamType.DataStruct,
          false,
          structBuilder: PollStruct.fromSerializableMap,
        ),
        isPoll: deserializeParam(
          data['isPoll'],
          ParamType.bool,
          false,
        ),
        isPolitical: deserializeParam(
          data['isPolitical'],
          ParamType.bool,
          false,
        ),
        politicalPosition: deserializeParam(
          data['politicalPosition'],
          ParamType.int,
          false,
        ),
        genre: deserializeParam(
          data['genre'],
          ParamType.int,
          false,
        ),
        hashtags: deserializeParam<String>(
          data['hashtags'],
          ParamType.String,
          true,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        summary: deserializeParam(
          data['summary'],
          ParamType.String,
          false,
        ),
        comments: deserializeStructParam<CommentStruct>(
          data['comments'],
          ParamType.DataStruct,
          true,
          structBuilder: CommentStruct.fromSerializableMap,
        ),
        isStealth: deserializeParam(
          data['isStealth'],
          ParamType.bool,
          false,
        ),
      );

  static ThreadStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ThreadStruct(
        timestamp: convertAlgoliaParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        author: convertAlgoliaParam(
          data['author'],
          ParamType.String,
          false,
        ),
        title: convertAlgoliaParam(
          data['title'],
          ParamType.String,
          false,
        ),
        text: convertAlgoliaParam(
          data['text'],
          ParamType.String,
          false,
        ),
        netVotes: convertAlgoliaParam(
          data['netVotes'],
          ParamType.int,
          false,
        ),
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
        upVoters: convertAlgoliaParam<String>(
          data['upVoters'],
          ParamType.String,
          true,
        ),
        downVoters: convertAlgoliaParam<String>(
          data['downVoters'],
          ParamType.String,
          true,
        ),
        poll: convertAlgoliaParam(
          data['poll'],
          ParamType.DataStruct,
          false,
          structBuilder: PollStruct.fromAlgoliaData,
        ),
        isPoll: convertAlgoliaParam(
          data['isPoll'],
          ParamType.bool,
          false,
        ),
        isPolitical: convertAlgoliaParam(
          data['isPolitical'],
          ParamType.bool,
          false,
        ),
        politicalPosition: convertAlgoliaParam(
          data['politicalPosition'],
          ParamType.int,
          false,
        ),
        genre: convertAlgoliaParam(
          data['genre'],
          ParamType.int,
          false,
        ),
        hashtags: convertAlgoliaParam<String>(
          data['hashtags'],
          ParamType.String,
          true,
        ),
        link: convertAlgoliaParam(
          data['link'],
          ParamType.String,
          false,
        ),
        summary: convertAlgoliaParam(
          data['summary'],
          ParamType.String,
          false,
        ),
        comments: convertAlgoliaParam<CommentStruct>(
          data['comments'],
          ParamType.DataStruct,
          true,
          structBuilder: CommentStruct.fromAlgoliaData,
        ),
        isStealth: convertAlgoliaParam(
          data['isStealth'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ThreadStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ThreadStruct &&
        timestamp == other.timestamp &&
        author == other.author &&
        title == other.title &&
        text == other.text &&
        netVotes == other.netVotes &&
        id == other.id &&
        listEquality.equals(upVoters, other.upVoters) &&
        listEquality.equals(downVoters, other.downVoters) &&
        poll == other.poll &&
        isPoll == other.isPoll &&
        isPolitical == other.isPolitical &&
        politicalPosition == other.politicalPosition &&
        genre == other.genre &&
        listEquality.equals(hashtags, other.hashtags) &&
        link == other.link &&
        summary == other.summary &&
        listEquality.equals(comments, other.comments) &&
        isStealth == other.isStealth;
  }

  @override
  int get hashCode => const ListEquality().hash([
        timestamp,
        author,
        title,
        text,
        netVotes,
        id,
        upVoters,
        downVoters,
        poll,
        isPoll,
        isPolitical,
        politicalPosition,
        genre,
        hashtags,
        link,
        summary,
        comments,
        isStealth
      ]);
}

ThreadStruct createThreadStruct({
  DateTime? timestamp,
  String? author,
  String? title,
  String? text,
  int? netVotes,
  String? id,
  PollStruct? poll,
  bool? isPoll,
  bool? isPolitical,
  int? politicalPosition,
  int? genre,
  String? link,
  String? summary,
  bool? isStealth,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThreadStruct(
      timestamp: timestamp,
      author: author,
      title: title,
      text: text,
      netVotes: netVotes,
      id: id,
      poll: poll ?? (clearUnsetFields ? PollStruct() : null),
      isPoll: isPoll,
      isPolitical: isPolitical,
      politicalPosition: politicalPosition,
      genre: genre,
      link: link,
      summary: summary,
      isStealth: isStealth,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThreadStruct? updateThreadStruct(
  ThreadStruct? thread, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    thread
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThreadStructData(
  Map<String, dynamic> firestoreData,
  ThreadStruct? thread,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (thread == null) {
    return;
  }
  if (thread.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && thread.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final threadData = getThreadFirestoreData(thread, forFieldValue);
  final nestedData = threadData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = thread.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThreadFirestoreData(
  ThreadStruct? thread, [
  bool forFieldValue = false,
]) {
  if (thread == null) {
    return {};
  }
  final firestoreData = mapToFirestore(thread.toMap());

  // Handle nested data for "poll" field.
  addPollStructData(
    firestoreData,
    thread.hasPoll() ? thread.poll : null,
    'poll',
    forFieldValue,
  );

  // Add any Firestore field values
  thread.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThreadListFirestoreData(
  List<ThreadStruct>? threads,
) =>
    threads?.map((e) => getThreadFirestoreData(e, true)).toList() ?? [];
