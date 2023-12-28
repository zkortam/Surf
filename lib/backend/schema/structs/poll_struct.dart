// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PollStruct extends FFFirebaseStruct {
  PollStruct({
    List<String>? options,
    int? totalVotes,
    List<String>? option1Voters,
    List<String>? option2Voters,
    List<String>? option3Voters,
    List<String>? option4Voters,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _options = options,
        _totalVotes = totalVotes,
        _option1Voters = option1Voters,
        _option2Voters = option2Voters,
        _option3Voters = option3Voters,
        _option4Voters = option4Voters,
        super(firestoreUtilData);

  // "options" field.
  List<String>? _options;
  List<String> get options => _options ?? const [];
  set options(List<String>? val) => _options = val;
  void updateOptions(Function(List<String>) updateFn) =>
      updateFn(_options ??= []);
  bool hasOptions() => _options != null;

  // "totalVotes" field.
  int? _totalVotes;
  int get totalVotes => _totalVotes ?? 0;
  set totalVotes(int? val) => _totalVotes = val;
  void incrementTotalVotes(int amount) => _totalVotes = totalVotes + amount;
  bool hasTotalVotes() => _totalVotes != null;

  // "option1Voters" field.
  List<String>? _option1Voters;
  List<String> get option1Voters => _option1Voters ?? const [];
  set option1Voters(List<String>? val) => _option1Voters = val;
  void updateOption1Voters(Function(List<String>) updateFn) =>
      updateFn(_option1Voters ??= []);
  bool hasOption1Voters() => _option1Voters != null;

  // "option2Voters" field.
  List<String>? _option2Voters;
  List<String> get option2Voters => _option2Voters ?? const [];
  set option2Voters(List<String>? val) => _option2Voters = val;
  void updateOption2Voters(Function(List<String>) updateFn) =>
      updateFn(_option2Voters ??= []);
  bool hasOption2Voters() => _option2Voters != null;

  // "option3Voters" field.
  List<String>? _option3Voters;
  List<String> get option3Voters => _option3Voters ?? const [];
  set option3Voters(List<String>? val) => _option3Voters = val;
  void updateOption3Voters(Function(List<String>) updateFn) =>
      updateFn(_option3Voters ??= []);
  bool hasOption3Voters() => _option3Voters != null;

  // "option4Voters" field.
  List<String>? _option4Voters;
  List<String> get option4Voters => _option4Voters ?? const [];
  set option4Voters(List<String>? val) => _option4Voters = val;
  void updateOption4Voters(Function(List<String>) updateFn) =>
      updateFn(_option4Voters ??= []);
  bool hasOption4Voters() => _option4Voters != null;

  static PollStruct fromMap(Map<String, dynamic> data) => PollStruct(
        options: getDataList(data['options']),
        totalVotes: castToType<int>(data['totalVotes']),
        option1Voters: getDataList(data['option1Voters']),
        option2Voters: getDataList(data['option2Voters']),
        option3Voters: getDataList(data['option3Voters']),
        option4Voters: getDataList(data['option4Voters']),
      );

  static PollStruct? maybeFromMap(dynamic data) =>
      data is Map ? PollStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'options': _options,
        'totalVotes': _totalVotes,
        'option1Voters': _option1Voters,
        'option2Voters': _option2Voters,
        'option3Voters': _option3Voters,
        'option4Voters': _option4Voters,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'options': serializeParam(
          _options,
          ParamType.String,
          true,
        ),
        'totalVotes': serializeParam(
          _totalVotes,
          ParamType.int,
        ),
        'option1Voters': serializeParam(
          _option1Voters,
          ParamType.String,
          true,
        ),
        'option2Voters': serializeParam(
          _option2Voters,
          ParamType.String,
          true,
        ),
        'option3Voters': serializeParam(
          _option3Voters,
          ParamType.String,
          true,
        ),
        'option4Voters': serializeParam(
          _option4Voters,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static PollStruct fromSerializableMap(Map<String, dynamic> data) =>
      PollStruct(
        options: deserializeParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        totalVotes: deserializeParam(
          data['totalVotes'],
          ParamType.int,
          false,
        ),
        option1Voters: deserializeParam<String>(
          data['option1Voters'],
          ParamType.String,
          true,
        ),
        option2Voters: deserializeParam<String>(
          data['option2Voters'],
          ParamType.String,
          true,
        ),
        option3Voters: deserializeParam<String>(
          data['option3Voters'],
          ParamType.String,
          true,
        ),
        option4Voters: deserializeParam<String>(
          data['option4Voters'],
          ParamType.String,
          true,
        ),
      );

  static PollStruct fromAlgoliaData(Map<String, dynamic> data) => PollStruct(
        options: convertAlgoliaParam<String>(
          data['options'],
          ParamType.String,
          true,
        ),
        totalVotes: convertAlgoliaParam(
          data['totalVotes'],
          ParamType.int,
          false,
        ),
        option1Voters: convertAlgoliaParam<String>(
          data['option1Voters'],
          ParamType.String,
          true,
        ),
        option2Voters: convertAlgoliaParam<String>(
          data['option2Voters'],
          ParamType.String,
          true,
        ),
        option3Voters: convertAlgoliaParam<String>(
          data['option3Voters'],
          ParamType.String,
          true,
        ),
        option4Voters: convertAlgoliaParam<String>(
          data['option4Voters'],
          ParamType.String,
          true,
        ),
        firestoreUtilData: const FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PollStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PollStruct &&
        listEquality.equals(options, other.options) &&
        totalVotes == other.totalVotes &&
        listEquality.equals(option1Voters, other.option1Voters) &&
        listEquality.equals(option2Voters, other.option2Voters) &&
        listEquality.equals(option3Voters, other.option3Voters) &&
        listEquality.equals(option4Voters, other.option4Voters);
  }

  @override
  int get hashCode => const ListEquality().hash([
        options,
        totalVotes,
        option1Voters,
        option2Voters,
        option3Voters,
        option4Voters
      ]);
}

PollStruct createPollStruct({
  int? totalVotes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PollStruct(
      totalVotes: totalVotes,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PollStruct? updatePollStruct(
  PollStruct? poll, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    poll
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPollStructData(
  Map<String, dynamic> firestoreData,
  PollStruct? poll,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (poll == null) {
    return;
  }
  if (poll.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && poll.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final pollData = getPollFirestoreData(poll, forFieldValue);
  final nestedData = pollData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = poll.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPollFirestoreData(
  PollStruct? poll, [
  bool forFieldValue = false,
]) {
  if (poll == null) {
    return {};
  }
  final firestoreData = mapToFirestore(poll.toMap());

  // Add any Firestore field values
  poll.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPollListFirestoreData(
  List<PollStruct>? polls,
) =>
    polls?.map((e) => getPollFirestoreData(e, true)).toList() ?? [];
