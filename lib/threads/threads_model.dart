import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/p_c_nav_bar_widget.dart';
import '/components/select_space_widget.dart';
import '/components/space_threads_nav_widget.dart';
import '/components/thread_widget.dart';
import '/components/threads_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'threads_widget.dart' show ThreadsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ThreadsModel extends FlutterFlowModel<ThreadsWidget> {
  ///  Local state fields for this page.

  bool isCommentAllowed = false;

  bool isFollowersOnly = false;

  bool isPoll = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PCNavBar component.
  late PCNavBarModel pCNavBarModel;
  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleController;
  String? Function(BuildContext, String?)? titleControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for threadsBar component.
  late ThreadsBarModel threadsBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pCNavBarModel = createModel(context, () => PCNavBarModel());
    threadsBarModel = createModel(context, () => ThreadsBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    pCNavBarModel.dispose();
    titleFocusNode?.dispose();
    titleController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();

    threadsBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
