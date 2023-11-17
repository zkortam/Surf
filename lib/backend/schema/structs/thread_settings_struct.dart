// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThreadSettingsStruct extends FFFirebaseStruct {
  ThreadSettingsStruct({
    bool? isAI,
    bool? isAutoHashtag,
    bool? isAutoBeautification,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _isAI = isAI,
        _isAutoHashtag = isAutoHashtag,
        _isAutoBeautification = isAutoBeautification,
        super(firestoreUtilData);

  // "isAI" field.
  bool? _isAI;
  bool get isAI => _isAI ?? false;
  set isAI(bool? val) => _isAI = val;
  bool hasIsAI() => _isAI != null;

  // "isAutoHashtag" field.
  bool? _isAutoHashtag;
  bool get isAutoHashtag => _isAutoHashtag ?? false;
  set isAutoHashtag(bool? val) => _isAutoHashtag = val;
  bool hasIsAutoHashtag() => _isAutoHashtag != null;

  // "isAutoBeautification" field.
  bool? _isAutoBeautification;
  bool get isAutoBeautification => _isAutoBeautification ?? false;
  set isAutoBeautification(bool? val) => _isAutoBeautification = val;
  bool hasIsAutoBeautification() => _isAutoBeautification != null;

  static ThreadSettingsStruct fromMap(Map<String, dynamic> data) =>
      ThreadSettingsStruct(
        isAI: data['isAI'] as bool?,
        isAutoHashtag: data['isAutoHashtag'] as bool?,
        isAutoBeautification: data['isAutoBeautification'] as bool?,
      );

  static ThreadSettingsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ThreadSettingsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'isAI': _isAI,
        'isAutoHashtag': _isAutoHashtag,
        'isAutoBeautification': _isAutoBeautification,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'isAI': serializeParam(
          _isAI,
          ParamType.bool,
        ),
        'isAutoHashtag': serializeParam(
          _isAutoHashtag,
          ParamType.bool,
        ),
        'isAutoBeautification': serializeParam(
          _isAutoBeautification,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ThreadSettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThreadSettingsStruct(
        isAI: deserializeParam(
          data['isAI'],
          ParamType.bool,
          false,
        ),
        isAutoHashtag: deserializeParam(
          data['isAutoHashtag'],
          ParamType.bool,
          false,
        ),
        isAutoBeautification: deserializeParam(
          data['isAutoBeautification'],
          ParamType.bool,
          false,
        ),
      );

  static ThreadSettingsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ThreadSettingsStruct(
        isAI: convertAlgoliaParam(
          data['isAI'],
          ParamType.bool,
          false,
        ),
        isAutoHashtag: convertAlgoliaParam(
          data['isAutoHashtag'],
          ParamType.bool,
          false,
        ),
        isAutoBeautification: convertAlgoliaParam(
          data['isAutoBeautification'],
          ParamType.bool,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ThreadSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThreadSettingsStruct &&
        isAI == other.isAI &&
        isAutoHashtag == other.isAutoHashtag &&
        isAutoBeautification == other.isAutoBeautification;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([isAI, isAutoHashtag, isAutoBeautification]);
}

ThreadSettingsStruct createThreadSettingsStruct({
  bool? isAI,
  bool? isAutoHashtag,
  bool? isAutoBeautification,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThreadSettingsStruct(
      isAI: isAI,
      isAutoHashtag: isAutoHashtag,
      isAutoBeautification: isAutoBeautification,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ThreadSettingsStruct? updateThreadSettingsStruct(
  ThreadSettingsStruct? threadSettings, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    threadSettings
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addThreadSettingsStructData(
  Map<String, dynamic> firestoreData,
  ThreadSettingsStruct? threadSettings,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (threadSettings == null) {
    return;
  }
  if (threadSettings.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && threadSettings.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final threadSettingsData =
      getThreadSettingsFirestoreData(threadSettings, forFieldValue);
  final nestedData =
      threadSettingsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = threadSettings.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getThreadSettingsFirestoreData(
  ThreadSettingsStruct? threadSettings, [
  bool forFieldValue = false,
]) {
  if (threadSettings == null) {
    return {};
  }
  final firestoreData = mapToFirestore(threadSettings.toMap());

  // Add any Firestore field values
  threadSettings.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getThreadSettingsListFirestoreData(
  List<ThreadSettingsStruct>? threadSettingss,
) =>
    threadSettingss
        ?.map((e) => getThreadSettingsFirestoreData(e, true))
        .toList() ??
    [];
