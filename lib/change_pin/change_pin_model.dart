import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_bar_error_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChangePinModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isPinCorrect = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController1;
  String? Function(BuildContext, String?)? pinCodeController1Validator;
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController2;
  String? Function(BuildContext, String?)? pinCodeController2Validator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pinCodeController1 = TextEditingController();
    pinCodeController2 = TextEditingController();
  }

  void dispose() {
    unfocusNode.dispose();
    pinCodeController1?.dispose();
    pinCodeController2?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
