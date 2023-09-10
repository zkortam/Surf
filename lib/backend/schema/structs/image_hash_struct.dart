// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImageHashStruct extends FFFirebaseStruct {
  ImageHashStruct({
    String? image,
    String? blurHash,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _image = image,
        _blurHash = blurHash,
        super(firestoreUtilData);

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "blurHash" field.
  String? _blurHash;
  String get blurHash => _blurHash ?? '';
  set blurHash(String? val) => _blurHash = val;
  bool hasBlurHash() => _blurHash != null;

  static ImageHashStruct fromMap(Map<String, dynamic> data) => ImageHashStruct(
        image: data['image'] as String?,
        blurHash: data['blurHash'] as String?,
      );

  static ImageHashStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ImageHashStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'image': _image,
        'blurHash': _blurHash,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'blurHash': serializeParam(
          _blurHash,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImageHashStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageHashStruct(
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        blurHash: deserializeParam(
          data['blurHash'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImageHashStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageHashStruct &&
        image == other.image &&
        blurHash == other.blurHash;
  }

  @override
  int get hashCode => const ListEquality().hash([image, blurHash]);
}

ImageHashStruct createImageHashStruct({
  String? image,
  String? blurHash,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageHashStruct(
      image: image,
      blurHash: blurHash,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageHashStruct? updateImageHashStruct(
  ImageHashStruct? imageHash, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imageHash
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageHashStructData(
  Map<String, dynamic> firestoreData,
  ImageHashStruct? imageHash,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imageHash == null) {
    return;
  }
  if (imageHash.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imageHash.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageHashData = getImageHashFirestoreData(imageHash, forFieldValue);
  final nestedData = imageHashData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imageHash.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageHashFirestoreData(
  ImageHashStruct? imageHash, [
  bool forFieldValue = false,
]) {
  if (imageHash == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imageHash.toMap());

  // Add any Firestore field values
  imageHash.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageHashListFirestoreData(
  List<ImageHashStruct>? imageHashs,
) =>
    imageHashs?.map((e) => getImageHashFirestoreData(e, true)).toList() ?? [];
