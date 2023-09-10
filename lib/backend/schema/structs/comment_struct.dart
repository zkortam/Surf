// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CommentStruct extends FFFirebaseStruct {
  CommentStruct({
    bool? isPostComment,
    String? idReplyTo,
    String? text,
    String? authorid,
    String? link,
    int? likes,
    String? dislikes,
    List<String>? likers,
    List<String>? dislikers,
    DateTime? timestamp,
    String? id,
    ImageHashStruct? imageHash,
    bool? isStealth,
    bool? isAuthorStealth,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isPostComment = isPostComment,
        _idReplyTo = idReplyTo,
        _text = text,
        _authorid = authorid,
        _link = link,
        _likes = likes,
        _dislikes = dislikes,
        _likers = likers,
        _dislikers = dislikers,
        _timestamp = timestamp,
        _id = id,
        _imageHash = imageHash,
        _isStealth = isStealth,
        _isAuthorStealth = isAuthorStealth,
        super(firestoreUtilData);

  // "isPostComment" field.
  bool? _isPostComment;
  bool get isPostComment => _isPostComment ?? false;
  set isPostComment(bool? val) => _isPostComment = val;
  bool hasIsPostComment() => _isPostComment != null;

  // "idReplyTo" field.
  String? _idReplyTo;
  String get idReplyTo => _idReplyTo ?? '';
  set idReplyTo(String? val) => _idReplyTo = val;
  bool hasIdReplyTo() => _idReplyTo != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "authorid" field.
  String? _authorid;
  String get authorid => _authorid ?? '';
  set authorid(String? val) => _authorid = val;
  bool hasAuthorid() => _authorid != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  set likes(int? val) => _likes = val;
  void incrementLikes(int amount) => _likes = likes + amount;
  bool hasLikes() => _likes != null;

  // "dislikes" field.
  String? _dislikes;
  String get dislikes => _dislikes ?? '';
  set dislikes(String? val) => _dislikes = val;
  bool hasDislikes() => _dislikes != null;

  // "likers" field.
  List<String>? _likers;
  List<String> get likers => _likers ?? const [];
  set likers(List<String>? val) => _likers = val;
  void updateLikers(Function(List<String>) updateFn) =>
      updateFn(_likers ??= []);
  bool hasLikers() => _likers != null;

  // "dislikers" field.
  List<String>? _dislikers;
  List<String> get dislikers => _dislikers ?? const [];
  set dislikers(List<String>? val) => _dislikers = val;
  void updateDislikers(Function(List<String>) updateFn) =>
      updateFn(_dislikers ??= []);
  bool hasDislikers() => _dislikers != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;
  bool hasTimestamp() => _timestamp != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "imageHash" field.
  ImageHashStruct? _imageHash;
  ImageHashStruct get imageHash => _imageHash ?? ImageHashStruct();
  set imageHash(ImageHashStruct? val) => _imageHash = val;
  void updateImageHash(Function(ImageHashStruct) updateFn) =>
      updateFn(_imageHash ??= ImageHashStruct());
  bool hasImageHash() => _imageHash != null;

  // "isStealth" field.
  bool? _isStealth;
  bool get isStealth => _isStealth ?? false;
  set isStealth(bool? val) => _isStealth = val;
  bool hasIsStealth() => _isStealth != null;

  // "isAuthorStealth" field.
  bool? _isAuthorStealth;
  bool get isAuthorStealth => _isAuthorStealth ?? false;
  set isAuthorStealth(bool? val) => _isAuthorStealth = val;
  bool hasIsAuthorStealth() => _isAuthorStealth != null;

  static CommentStruct fromMap(Map<String, dynamic> data) => CommentStruct(
        isPostComment: data['isPostComment'] as bool?,
        idReplyTo: data['idReplyTo'] as String?,
        text: data['text'] as String?,
        authorid: data['authorid'] as String?,
        link: data['link'] as String?,
        likes: castToType<int>(data['likes']),
        dislikes: data['dislikes'] as String?,
        likers: getDataList(data['likers']),
        dislikers: getDataList(data['dislikers']),
        timestamp: data['timestamp'] as DateTime?,
        id: data['id'] as String?,
        imageHash: ImageHashStruct.maybeFromMap(data['imageHash']),
        isStealth: data['isStealth'] as bool?,
        isAuthorStealth: data['isAuthorStealth'] as bool?,
      );

  static CommentStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? CommentStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'isPostComment': _isPostComment,
        'idReplyTo': _idReplyTo,
        'text': _text,
        'authorid': _authorid,
        'link': _link,
        'likes': _likes,
        'dislikes': _dislikes,
        'likers': _likers,
        'dislikers': _dislikers,
        'timestamp': _timestamp,
        'id': _id,
        'imageHash': _imageHash?.toMap(),
        'isStealth': _isStealth,
        'isAuthorStealth': _isAuthorStealth,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isPostComment': serializeParam(
          _isPostComment,
          ParamType.bool,
        ),
        'idReplyTo': serializeParam(
          _idReplyTo,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'authorid': serializeParam(
          _authorid,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'likes': serializeParam(
          _likes,
          ParamType.int,
        ),
        'dislikes': serializeParam(
          _dislikes,
          ParamType.String,
        ),
        'likers': serializeParam(
          _likers,
          ParamType.String,
          true,
        ),
        'dislikers': serializeParam(
          _dislikers,
          ParamType.String,
          true,
        ),
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'imageHash': serializeParam(
          _imageHash,
          ParamType.DataStruct,
        ),
        'isStealth': serializeParam(
          _isStealth,
          ParamType.bool,
        ),
        'isAuthorStealth': serializeParam(
          _isAuthorStealth,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CommentStruct fromSerializableMap(Map<String, dynamic> data) =>
      CommentStruct(
        isPostComment: deserializeParam(
          data['isPostComment'],
          ParamType.bool,
          false,
        ),
        idReplyTo: deserializeParam(
          data['idReplyTo'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        authorid: deserializeParam(
          data['authorid'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        likes: deserializeParam(
          data['likes'],
          ParamType.int,
          false,
        ),
        dislikes: deserializeParam(
          data['dislikes'],
          ParamType.String,
          false,
        ),
        likers: deserializeParam<String>(
          data['likers'],
          ParamType.String,
          true,
        ),
        dislikers: deserializeParam<String>(
          data['dislikers'],
          ParamType.String,
          true,
        ),
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        imageHash: deserializeStructParam(
          data['imageHash'],
          ParamType.DataStruct,
          false,
          structBuilder: ImageHashStruct.fromSerializableMap,
        ),
        isStealth: deserializeParam(
          data['isStealth'],
          ParamType.bool,
          false,
        ),
        isAuthorStealth: deserializeParam(
          data['isAuthorStealth'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CommentStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CommentStruct &&
        isPostComment == other.isPostComment &&
        idReplyTo == other.idReplyTo &&
        text == other.text &&
        authorid == other.authorid &&
        link == other.link &&
        likes == other.likes &&
        dislikes == other.dislikes &&
        listEquality.equals(likers, other.likers) &&
        listEquality.equals(dislikers, other.dislikers) &&
        timestamp == other.timestamp &&
        id == other.id &&
        imageHash == other.imageHash &&
        isStealth == other.isStealth &&
        isAuthorStealth == other.isAuthorStealth;
  }

  @override
  int get hashCode => const ListEquality().hash([
        isPostComment,
        idReplyTo,
        text,
        authorid,
        link,
        likes,
        dislikes,
        likers,
        dislikers,
        timestamp,
        id,
        imageHash,
        isStealth,
        isAuthorStealth
      ]);
}

CommentStruct createCommentStruct({
  bool? isPostComment,
  String? idReplyTo,
  String? text,
  String? authorid,
  String? link,
  int? likes,
  String? dislikes,
  DateTime? timestamp,
  String? id,
  ImageHashStruct? imageHash,
  bool? isStealth,
  bool? isAuthorStealth,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CommentStruct(
      isPostComment: isPostComment,
      idReplyTo: idReplyTo,
      text: text,
      authorid: authorid,
      link: link,
      likes: likes,
      dislikes: dislikes,
      timestamp: timestamp,
      id: id,
      imageHash: imageHash ?? (clearUnsetFields ? ImageHashStruct() : null),
      isStealth: isStealth,
      isAuthorStealth: isAuthorStealth,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CommentStruct? updateCommentStruct(
  CommentStruct? comment, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    comment
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCommentStructData(
  Map<String, dynamic> firestoreData,
  CommentStruct? comment,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (comment == null) {
    return;
  }
  if (comment.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && comment.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final commentData = getCommentFirestoreData(comment, forFieldValue);
  final nestedData = commentData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = comment.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCommentFirestoreData(
  CommentStruct? comment, [
  bool forFieldValue = false,
]) {
  if (comment == null) {
    return {};
  }
  final firestoreData = mapToFirestore(comment.toMap());

  // Handle nested data for "imageHash" field.
  addImageHashStructData(
    firestoreData,
    comment.hasImageHash() ? comment.imageHash : null,
    'imageHash',
    forFieldValue,
  );

  // Add any Firestore field values
  comment.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCommentListFirestoreData(
  List<CommentStruct>? comments,
) =>
    comments?.map((e) => getCommentFirestoreData(e, true)).toList() ?? [];
