import '/components/thread_poll_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'thread_widget.dart' show ThreadWidget;
import 'package:flutter/material.dart';

class ThreadModel extends FlutterFlowModel<ThreadWidget> {
  ///  Local state fields for this component.

  String firstCommentID = '';

  ///  State fields for stateful widgets in this component.

  // Model for ThreadPoll component.
  late ThreadPollModel threadPollModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    threadPollModel = createModel(context, () => ThreadPollModel());
  }

  @override
  void dispose() {
    threadPollModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
