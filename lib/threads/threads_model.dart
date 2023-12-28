import '/components/p_c_nav_bar_widget.dart';
import '/components/thread_create_widget.dart';
import '/components/threads_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'threads_widget.dart' show ThreadsWidget;
import 'package:flutter/material.dart';

class ThreadsModel extends FlutterFlowModel<ThreadsWidget> {
  ///  Local state fields for this page.

  bool isCommentAllowed = false;

  bool isFollowersOnly = false;

  bool isPoll = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PCNavBar component.
  late PCNavBarModel pCNavBarModel;
  // Model for threadCreate component.
  late ThreadCreateModel threadCreateModel1;
  // Model for threadsBar component.
  late ThreadsBarModel threadsBarModel;
  // Model for threadCreate component.
  late ThreadCreateModel threadCreateModel2;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pCNavBarModel = createModel(context, () => PCNavBarModel());
    threadCreateModel1 = createModel(context, () => ThreadCreateModel());
    threadsBarModel = createModel(context, () => ThreadsBarModel());
    threadCreateModel2 = createModel(context, () => ThreadCreateModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pCNavBarModel.dispose();
    threadCreateModel1.dispose();
    threadsBarModel.dispose();
    threadCreateModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
