import '/flutter_flow/flutter_flow_util.dart';
import 'biometric_pin_widget.dart' show BiometricPinWidget;
import 'package:flutter/material.dart';

class BiometricPinModel extends FlutterFlowModel<BiometricPinWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isBiometric = false;

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
