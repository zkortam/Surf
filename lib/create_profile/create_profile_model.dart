import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bottom_bar_error_widget.dart';
import '/components/bottom_notif_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProfileModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String banner = 'false';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for phoneNumber widget.
  TextEditingController? phoneNumberController;
  String? Function(BuildContext, String?)? phoneNumberControllerValidator;
  // State field(s) for bio widget.
  TextEditingController? bioController;
  String? Function(BuildContext, String?)? bioControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nameController?.dispose();
    phoneNumberController?.dispose();
    bioController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
