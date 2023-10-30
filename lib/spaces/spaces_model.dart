import '/backend/backend.dart';
import '/components/p_c_nav_bar_widget.dart';
import '/components/thread_widget.dart';
import '/components/threads_bar_copy_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'spaces_widget.dart' show SpacesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SpacesModel extends FlutterFlowModel<SpacesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PCNavBar component.
  late PCNavBarModel pCNavBarModel;
  // Model for ThreadsBarCopy component.
  late ThreadsBarCopyModel threadsBarCopyModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pCNavBarModel = createModel(context, () => PCNavBarModel());
    threadsBarCopyModel = createModel(context, () => ThreadsBarCopyModel());
  }

  void dispose() {
    unfocusNode.dispose();
    pCNavBarModel.dispose();
    threadsBarCopyModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
