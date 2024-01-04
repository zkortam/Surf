import 'package:collection/collection.dart';

enum Sapphirebasic {
  bob0,
}

enum Sapphire {
  sapphirebasic,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Sapphirebasic):
      return Sapphirebasic.values.deserialize(value) as T?;
    case (Sapphire):
      return Sapphire.values.deserialize(value) as T?;
    default:
      return null;
  }
}
