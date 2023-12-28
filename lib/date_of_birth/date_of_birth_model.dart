import '/flutter_flow/flutter_flow_util.dart';
import 'date_of_birth_widget.dart' show DateOfBirthWidget;
import 'package:flutter/material.dart';

class DateOfBirthModel extends FlutterFlowModel<DateOfBirthWidget> {
  ///  Local state fields for this page.

  int isUsernameValid = 1;

  int isUsernameSet = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  DateTime? datePicked;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
