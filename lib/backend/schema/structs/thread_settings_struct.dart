// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ThreadSettingsStruct extends FFFirebaseStruct {
  ThreadSettingsStruct({
    String? autoBeautification,
    String? autoHashtag,
    String? aiFeatures,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _autoBeautification = autoBeautification,
        _autoHashtag = autoHashtag,
        _aiFeatures = aiFeatures,
        super(firestoreUtilData);

  // "autoBeautification" field.
  String? _autoBeautification;
  String get autoBeautification => _autoBeautification ?? '';
  set autoBeautification(String? val) => _autoBeautification = val;
  bool hasAutoBeautification() => _autoBeautification != null;

  // "autoHashtag" field.
  String? _autoHashtag;
  String get autoHashtag => _autoHashtag ?? '';
  set autoHashtag(String? val) => _autoHashtag = val;
  bool hasAutoHashtag() => _autoHashtag != null;

  // "AiFeatures" field.
  String? _aiFeatures;
  String get aiFeatures => _aiFeatures ?? '';
  set aiFeatures(String? val) => _aiFeatures = val;
  bool hasAiFeatures() => _aiFeatures != null;

  static ThreadSettingsStruct fromMap(Map<String, dynamic> data) =>
      ThreadSettingsStruct(
        autoBeautification: data['autoBeautification'] as String?,
        autoHashtag: data['autoHashtag'] as String?,
        aiFeatures: data['AiFeatures'] as String?,
      );

  static ThreadSettingsStruct? maybeFromMap(dynamic data) => data is Map
      ? ThreadSettingsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'autoBeautification': _autoBeautification,
        'autoHashtag': _autoHashtag,
        'AiFeatures': _aiFeatures,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'autoBeautification': serializeParam(
          _autoBeautification,
          ParamType.String,
        ),
        'autoHashtag': serializeParam(
          _autoHashtag,
          ParamType.String,
        ),
        'AiFeatures': serializeParam(
          _aiFeatures,
          ParamType.String,
        ),
      }.withoutNulls;

  static ThreadSettingsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThreadSettingsStruct(
        autoBeautification: deserializeParam(
          data['autoBeautification'],
          ParamType.String,
          false,
        ),
        autoHashtag: deserializeParam(
          data['autoHashtag'],
          ParamType.String,
          false,
        ),
        aiFeatures: deserializeParam(
          data['AiFeatures'],
          ParamType.String,
          false,
        ),
      );

  static ThreadSettingsStruct fromAlgoliaData(Map<String, dynamic> data) =>
      ThreadSettingsStruct(
        autoBeautification: convertAlgoliaParam(
          data['autoBeautification'],
          ParamType.String,
          false,
        ),
        autoHashtag: convertAlgoliaParam(
          data['autoHashtag'],
          ParamType.String,
          false,
        ),
        aiFeatures: convertAlgoliaParam(
          data['AiFeatures'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'ThreadSettingsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThreadSettingsStruct &&
        autoBeautification == other.autoBeautification &&
        autoHashtag == other.autoHashtag &&
        aiFeatures == other.aiFeatures;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([autoBeautification, autoHashtag, aiFeatures]);
}

ThreadSettingsStruct createThreadSettingsStruct({
  String? autoBeautification,
  String? autoHashtag,
  String? aiFeatures,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ThreadSettingsStruct(
      autoBeautification: autoBeautification,
      autoHashtag: autoHashtag,
      aiFeatures: aiFeatures,
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
