import '/flutter_flow/flutter_flow_util.dart';
import 'biometric_test_widget.dart' show BiometricTestWidget;
import 'package:flutter/material.dart';

class BiometricTestModel extends FlutterFlowModel<BiometricTestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isVerifiedBio = false;

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
