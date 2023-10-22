// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationStruct extends FFFirebaseStruct {
  NotificationStruct({
    int? category,
    String? itemID,
    DateTime? time,
    String? link,
    String? userID,
    bool? isMarkedAsRead,
    String? notifID,
    String? iDUserFrom,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _category = category,
        _itemID = itemID,
        _time = time,
        _link = link,
        _userID = userID,
        _isMarkedAsRead = isMarkedAsRead,
        _notifID = notifID,
        _iDUserFrom = iDUserFrom,
        super(firestoreUtilData);

  // "category" field.
  int? _category;
  int get category => _category ?? 0;
  set category(int? val) => _category = val;
  void incrementCategory(int amount) => _category = category + amount;
  bool hasCategory() => _category != null;

  // "itemID" field.
  String? _itemID;
  String get itemID => _itemID ?? '';
  set itemID(String? val) => _itemID = val;
  bool hasItemID() => _itemID != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  set time(DateTime? val) => _time = val;
  bool hasTime() => _time != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  // "userID" field.
  String? _userID;
  String get userID => _userID ?? '';
  set userID(String? val) => _userID = val;
  bool hasUserID() => _userID != null;

  // "isMarkedAsRead" field.
  bool? _isMarkedAsRead;
  bool get isMarkedAsRead => _isMarkedAsRead ?? false;
  set isMarkedAsRead(bool? val) => _isMarkedAsRead = val;
  bool hasIsMarkedAsRead() => _isMarkedAsRead != null;

  // "notifID" field.
  String? _notifID;
  String get notifID => _notifID ?? '';
  set notifID(String? val) => _notifID = val;
  bool hasNotifID() => _notifID != null;

  // "IDUserFrom" field.
  String? _iDUserFrom;
  String get iDUserFrom => _iDUserFrom ?? '';
  set iDUserFrom(String? val) => _iDUserFrom = val;
  bool hasIDUserFrom() => _iDUserFrom != null;

  static NotificationStruct fromMap(Map<String, dynamic> data) =>
      NotificationStruct(
        category: castToType<int>(data['category']),
        itemID: data['itemID'] as String?,
        time: data['time'] as DateTime?,
        link: data['link'] as String?,
        userID: data['userID'] as String?,
        isMarkedAsRead: data['isMarkedAsRead'] as bool?,
        notifID: data['notifID'] as String?,
        iDUserFrom: data['IDUserFrom'] as String?,
      );

  static NotificationStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? NotificationStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'category': _category,
        'itemID': _itemID,
        'time': _time,
        'link': _link,
        'userID': _userID,
        'isMarkedAsRead': _isMarkedAsRead,
        'notifID': _notifID,
        'IDUserFrom': _iDUserFrom,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category': serializeParam(
          _category,
          ParamType.int,
        ),
        'itemID': serializeParam(
          _itemID,
          ParamType.String,
        ),
        'time': serializeParam(
          _time,
          ParamType.DateTime,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'userID': serializeParam(
          _userID,
          ParamType.String,
        ),
        'isMarkedAsRead': serializeParam(
          _isMarkedAsRead,
          ParamType.bool,
        ),
        'notifID': serializeParam(
          _notifID,
          ParamType.String,
        ),
        'IDUserFrom': serializeParam(
          _iDUserFrom,
          ParamType.String,
        ),
      }.withoutNulls;

  static NotificationStruct fromSerializableMap(Map<String, dynamic> data) =>
      NotificationStruct(
        category: deserializeParam(
          data['category'],
          ParamType.int,
          false,
        ),
        itemID: deserializeParam(
          data['itemID'],
          ParamType.String,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        userID: deserializeParam(
          data['userID'],
          ParamType.String,
          false,
        ),
        isMarkedAsRead: deserializeParam(
          data['isMarkedAsRead'],
          ParamType.bool,
          false,
        ),
        notifID: deserializeParam(
          data['notifID'],
          ParamType.String,
          false,
        ),
        iDUserFrom: deserializeParam(
          data['IDUserFrom'],
          ParamType.String,
          false,
        ),
      );

  static NotificationStruct fromAlgoliaData(Map<String, dynamic> data) =>
      NotificationStruct(
        category: convertAlgoliaParam(
          data['category'],
          ParamType.int,
          false,
        ),
        itemID: convertAlgoliaParam(
          data['itemID'],
          ParamType.String,
          false,
        ),
        time: convertAlgoliaParam(
          data['time'],
          ParamType.DateTime,
          false,
        ),
        link: convertAlgoliaParam(
          data['link'],
          ParamType.String,
          false,
        ),
        userID: convertAlgoliaParam(
          data['userID'],
          ParamType.String,
          false,
        ),
        isMarkedAsRead: convertAlgoliaParam(
          data['isMarkedAsRead'],
          ParamType.bool,
          false,
        ),
        notifID: convertAlgoliaParam(
          data['notifID'],
          ParamType.String,
          false,
        ),
        iDUserFrom: convertAlgoliaParam(
          data['IDUserFrom'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'NotificationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NotificationStruct &&
        category == other.category &&
        itemID == other.itemID &&
        time == other.time &&
        link == other.link &&
        userID == other.userID &&
        isMarkedAsRead == other.isMarkedAsRead &&
        notifID == other.notifID &&
        iDUserFrom == other.iDUserFrom;
  }

  @override
  int get hashCode => const ListEquality().hash([
        category,
        itemID,
        time,
        link,
        userID,
        isMarkedAsRead,
        notifID,
        iDUserFrom
      ]);
}

NotificationStruct createNotificationStruct({
  int? category,
  String? itemID,
  DateTime? time,
  String? link,
  String? userID,
  bool? isMarkedAsRead,
  String? notifID,
  String? iDUserFrom,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NotificationStruct(
      category: category,
      itemID: itemID,
      time: time,
      link: link,
      userID: userID,
      isMarkedAsRead: isMarkedAsRead,
      notifID: notifID,
      iDUserFrom: iDUserFrom,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NotificationStruct? updateNotificationStruct(
  NotificationStruct? notification, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    notification
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNotificationStructData(
  Map<String, dynamic> firestoreData,
  NotificationStruct? notification,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (notification == null) {
    return;
  }
  if (notification.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && notification.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final notificationData =
      getNotificationFirestoreData(notification, forFieldValue);
  final nestedData =
      notificationData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = notification.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNotificationFirestoreData(
  NotificationStruct? notification, [
  bool forFieldValue = false,
]) {
  if (notification == null) {
    return {};
  }
  final firestoreData = mapToFirestore(notification.toMap());

  // Add any Firestore field values
  notification.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNotificationListFirestoreData(
  List<NotificationStruct>? notifications,
) =>
    notifications?.map((e) => getNotificationFirestoreData(e, true)).toList() ??
    [];
