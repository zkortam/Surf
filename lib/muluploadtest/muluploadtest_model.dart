import '/flutter_flow/flutter_flow_util.dart';
import 'muluploadtest_widget.dart' show MuluploadtestWidget;
import 'package:flutter/material.dart';

class MuluploadtestModel extends FlutterFlowModel<MuluploadtestWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

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
