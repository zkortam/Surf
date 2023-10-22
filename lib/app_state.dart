import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _mulmediauploadarray = [];
  List<String> get mulmediauploadarray => _mulmediauploadarray;
  set mulmediauploadarray(List<String> _value) {
    _mulmediauploadarray = _value;
  }

  void addToMulmediauploadarray(String _value) {
    _mulmediauploadarray.add(_value);
  }

  void removeFromMulmediauploadarray(String _value) {
    _mulmediauploadarray.remove(_value);
  }

  void removeAtIndexFromMulmediauploadarray(int _index) {
    _mulmediauploadarray.removeAt(_index);
  }

  void updateMulmediauploadarrayAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _mulmediauploadarray[_index] = updateFn(_mulmediauploadarray[_index]);
  }

  void insertAtIndexInMulmediauploadarray(int _index, String _value) {
    _mulmediauploadarray.insert(_index, _value);
  }

  String _paramholder = '';
  String get paramholder => _paramholder;
  set paramholder(String _value) {
    _paramholder = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
