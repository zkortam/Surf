import '/backend/backend.dart';
import '/components/p_c_nav_bar_widget.dart';
import '/components/post_widget.dart';
import '/components/thread_widget.dart';
import '/components/user_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isUsers = true;

  bool isThreads = false;

  bool isPost = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PCNavBar component.
  late PCNavBarModel pCNavBarModel;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // Algolia Search Results from action on TextField
  List<UsersRecord>? algoliaSearchResults1 = [];
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Algolia Search Results from action on TextField
  List<PostsRecord>? algoliaSearchResults2 = [];
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // Algolia Search Results from action on TextField
  List<ThreadRecord>? algoliaSearchResults3 = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    pCNavBarModel = createModel(context, () => PCNavBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    pCNavBarModel.dispose();
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
