import 'package:flutter/material.dart';
import '/backend/backend.dart';
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
  set mulmediauploadarray(List<String> value) {
    _mulmediauploadarray = value;
  }

  void addToMulmediauploadarray(String value) {
    _mulmediauploadarray.add(value);
  }

  void removeFromMulmediauploadarray(String value) {
    _mulmediauploadarray.remove(value);
  }

  void removeAtIndexFromMulmediauploadarray(int index) {
    _mulmediauploadarray.removeAt(index);
  }

  void updateMulmediauploadarrayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _mulmediauploadarray[index] = updateFn(_mulmediauploadarray[index]);
  }

  void insertAtIndexInMulmediauploadarray(int index, String value) {
    _mulmediauploadarray.insert(index, value);
  }

  String _paramholder = '';
  String get paramholder => _paramholder;
  set paramholder(String value) {
    _paramholder = value;
  }

  String _selectedSpace = '';
  String get selectedSpace => _selectedSpace;
  set selectedSpace(String value) {
    _selectedSpace = value;
  }

  List<String> _usernames = [];
  List<String> get usernames => _usernames;
  set usernames(List<String> value) {
    _usernames = value;
  }

  void addToUsernames(String value) {
    _usernames.add(value);
  }

  void removeFromUsernames(String value) {
    _usernames.remove(value);
  }

  void removeAtIndexFromUsernames(int index) {
    _usernames.removeAt(index);
  }

  void updateUsernamesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _usernames[index] = updateFn(_usernames[index]);
  }

  void insertAtIndexInUsernames(int index, String value) {
    _usernames.insert(index, value);
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
