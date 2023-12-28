// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostStruct extends FFFirebaseStruct {
  PostStruct({
    DateTime? timestamp,
    String? caption,
    String? author,
    int? netVotes,
    List<ImageHashStruct>? images,
    String? id,
    bool? isExpanded,
    List<String>? upVoters,
    List<String>? downVoters,
    bool? isSpoiler,
    List<String>? spoilerClickers,
    List<CommentStruct>? comments,
    bool? isStealth,
    String? videos,
    bool? isshort,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _timestamp = timestamp,
        _caption = caption,
        _author = author,
        _netVotes = netVotes,
        _images = images,
        _id = id,
        _isExpanded = isExpanded,
        _upVoters = upVoters,
        _downVoters = downVoters,
        _isSpoiler = isSpoiler,
        _spoilerClickers = spoilerClickers,
        _comments = comments,
        _isStealth = isStealth,
        _videos = videos,
        _isshort = isshort,
        super(firestoreUtilData);

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  set timestamp(DateTime? val) => _timestamp = val;
  bool hasTimestamp() => _timestamp != null;

  // "caption" field.
  String? _caption;
  String get caption => _caption ?? '';
  set caption(String? val) => _caption = val;
  bool hasCaption() => _caption != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;
  bool hasAuthor() => _author != null;

  // "netVotes" field.
  int? _netVotes;
  int get netVotes => _netVotes ?? 0;
  set netVotes(int? val) => _netVotes = val;
  void incrementNetVotes(int amount) => _netVotes = netVotes + amount;
  bool hasNetVotes() => _netVotes != null;

  // "images" field.
  List<ImageHashStruct>? _images;
  List<ImageHashStruct> get images => _images ?? const [];
  set images(List<ImageHashStruct>? val) => _images = val;
  void updateImages(Function(List<ImageHashStruct>) updateFn) =>
      updateFn(_images ??= []);
  bool hasImages() => _images != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "isExpanded" field.
  bool? _isExpanded;
  bool get isExpanded => _isExpanded ?? false;
  set isExpanded(bool? val) => _isExpanded = val;
  bool hasIsExpanded() => _isExpanded != null;

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

  // "isSpoiler" field.
  bool? _isSpoiler;
  bool get isSpoiler => _isSpoiler ?? false;
  set isSpoiler(bool? val) => _isSpoiler = val;
  bool hasIsSpoiler() => _isSpoiler != null;

  // "spoilerClickers" field.
  List<String>? _spoilerClickers;
  List<String> get spoilerClickers => _spoilerClickers ?? const [];
  set spoilerClickers(List<String>? val) => _spoilerClickers = val;
  void updateSpoilerClickers(Function(List<String>) updateFn) =>
      updateFn(_spoilerClickers ??= []);
  bool hasSpoilerClickers() => _spoilerClickers != null;

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

  // "videos" field.
  String? _videos;
  String get videos => _videos ?? '';
  set videos(String? val) => _videos = val;
  bool hasVideos() => _videos != null;

  // "isshort" field.
  bool? _isshort;
  bool get isshort => _isshort ?? false;
  set isshort(bool? val) => _isshort = val;
  bool hasIsshort() => _isshort != null;

  static PostStruct fromMap(Map<String, dynamic> data) => PostStruct(
        timestamp: data['timestamp'] as DateTime?,
        caption: data['caption'] as String?,
        author: data['author'] as String?,
        netVotes: castToType<int>(data['netVotes']),
        images: getStructList(
          data['images'],
          ImageHashStruct.fromMap,
        ),
        id: data['id'] as String?,
        isExpanded: data['isExpanded'] as bool?,
        upVoters: getDataList(data['upVoters']),
        downVoters: getDataList(data['downVoters']),
        isSpoiler: data['isSpoiler'] as bool?,
        spoilerClickers: getDataList(data['spoilerClickers']),
        comments: getStructList(
          data['comments'],
          CommentStruct.fromMap,
        ),
        isStealth: data['isStealth'] as bool?,
        videos: data['videos'] as String?,
        isshort: data['isshort'] as bool?,
      );

  static PostStruct? maybeFromMap(dynamic data) =>
      data is Map ? PostStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'timestamp': _timestamp,
        'caption': _caption,
        'author': _author,
        'netVotes': _netVotes,
        'images': _images?.map((e) => e.toMap()).toList(),
        'id': _id,
        'isExpanded': _isExpanded,
        'upVoters': _upVoters,
        'downVoters': _downVoters,
        'isSpoiler': _isSpoiler,
        'spoilerClickers': _spoilerClickers,
        'comments': _comments?.map((e) => e.toMap()).toList(),
        'isStealth': _isStealth,
        'videos': _videos,
        'isshort': _isshort,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'timestamp': serializeParam(
          _timestamp,
          ParamType.DateTime,
        ),
        'caption': serializeParam(
          _caption,
          ParamType.String,
        ),
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'netVotes': serializeParam(
          _netVotes,
          ParamType.int,
        ),
        'images': serializeParam(
          _images,
          ParamType.DataStruct,
          true,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'isExpanded': serializeParam(
          _isExpanded,
          ParamType.bool,
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
        'isSpoiler': serializeParam(
          _isSpoiler,
          ParamType.bool,
        ),
        'spoilerClickers': serializeParam(
          _spoilerClickers,
          ParamType.String,
          true,
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
        'videos': serializeParam(
          _videos,
          ParamType.String,
        ),
        'isshort': serializeParam(
          _isshort,
          ParamType.bool,
        ),
      }.withoutNulls;

  static PostStruct fromSerializableMap(Map<String, dynamic> data) =>
      PostStruct(
        timestamp: deserializeParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        caption: deserializeParam(
          data['caption'],
          ParamType.String,
          false,
        ),
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        netVotes: deserializeParam(
          data['netVotes'],
          ParamType.int,
          false,
        ),
        images: deserializeStructParam<ImageHashStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: ImageHashStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        isExpanded: deserializeParam(
          data['isExpanded'],
          ParamType.bool,
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
        isSpoiler: deserializeParam(
          data['isSpoiler'],
          ParamType.bool,
          false,
        ),
        spoilerClickers: deserializeParam<String>(
          data['spoilerClickers'],
          ParamType.String,
          true,
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
        videos: deserializeParam(
          data['videos'],
          ParamType.String,
          false,
        ),
        isshort: deserializeParam(
          data['isshort'],
          ParamType.bool,
          false,
        ),
      );

  static PostStruct fromAlgoliaData(Map<String, dynamic> data) => PostStruct(
        timestamp: convertAlgoliaParam(
          data['timestamp'],
          ParamType.DateTime,
          false,
        ),
        caption: convertAlgoliaParam(
          data['caption'],
          ParamType.String,
          false,
        ),
        author: convertAlgoliaParam(
          data['author'],
          ParamType.String,
          false,
        ),
        netVotes: convertAlgoliaParam(
          data['netVotes'],
          ParamType.int,
          false,
        ),
        images: convertAlgoliaParam<ImageHashStruct>(
          data['images'],
          ParamType.DataStruct,
          true,
          structBuilder: ImageHashStruct.fromAlgoliaData,
        ),
        id: convertAlgoliaParam(
          data['id'],
          ParamType.String,
          false,
        ),
        isExpanded: convertAlgoliaParam(
          data['isExpanded'],
          ParamType.bool,
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
        isSpoiler: convertAlgoliaParam(
          data['isSpoiler'],
          ParamType.bool,
          false,
        ),
        spoilerClickers: convertAlgoliaParam<String>(
          data['spoilerClickers'],
          ParamType.String,
          true,
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
        videos: convertAlgoliaParam(
          data['videos'],
          ParamType.String,
          false,
        ),
        isshort: convertAlgoliaParam(
          data['isshort'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PostStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PostStruct &&
        timestamp == other.timestamp &&
        caption == other.caption &&
        author == other.author &&
        netVotes == other.netVotes &&
        listEquality.equals(images, other.images) &&
        id == other.id &&
        isExpanded == other.isExpanded &&
        listEquality.equals(upVoters, other.upVoters) &&
        listEquality.equals(downVoters, other.downVoters) &&
        isSpoiler == other.isSpoiler &&
        listEquality.equals(spoilerClickers, other.spoilerClickers) &&
        listEquality.equals(comments, other.comments) &&
        isStealth == other.isStealth &&
        videos == other.videos &&
        isshort == other.isshort;
  }

  @override
  int get hashCode => const ListEquality().hash([
        timestamp,
        caption,
        author,
        netVotes,
        images,
        id,
        isExpanded,
        upVoters,
        downVoters,
        isSpoiler,
        spoilerClickers,
        comments,
        isStealth,
        videos,
        isshort
      ]);
}

PostStruct createPostStruct({
  DateTime? timestamp,
  String? caption,
  String? author,
  int? netVotes,
  String? id,
  bool? isExpanded,
  bool? isSpoiler,
  bool? isStealth,
  String? videos,
  bool? isshort,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PostStruct(
      timestamp: timestamp,
      caption: caption,
      author: author,
      netVotes: netVotes,
      id: id,
      isExpanded: isExpanded,
      isSpoiler: isSpoiler,
      isStealth: isStealth,
      videos: videos,
      isshort: isshort,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PostStruct? updatePostStruct(
  PostStruct? post, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    post
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPostStructData(
  Map<String, dynamic> firestoreData,
  PostStruct? post,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (post == null) {
    return;
  }
  if (post.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && post.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final postData = getPostFirestoreData(post, forFieldValue);
  final nestedData = postData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = post.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPostFirestoreData(
  PostStruct? post, [
  bool forFieldValue = false,
]) {
  if (post == null) {
    return {};
  }
  final firestoreData = mapToFirestore(post.toMap());

  // Add any Firestore field values
  post.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPostListFirestoreData(
  List<PostStruct>? posts,
) =>
    posts?.map((e) => getPostFirestoreData(e, true)).toList() ?? [];
