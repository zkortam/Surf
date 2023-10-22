import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/p_c_comment_dark_widget.dart';
import '/components/thread_poll_widget.dart';
import '/components/threads_comp_widget.dart';
import '/components/threads_hashtags_widget.dart';
import '/components/threads_link_widget.dart';
import '/components/threads_more_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'thread_widget.dart' show ThreadWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ThreadModel extends FlutterFlowModel<ThreadWidget> {
  ///  Local state fields for this component.

  String firstCommentID = '';

  ///  State fields for stateful widgets in this component.

  // Model for ThreadPoll component.
  late ThreadPollModel threadPollModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    threadPollModel = createModel(context, () => ThreadPollModel());
  }

  void dispose() {
    threadPollModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
