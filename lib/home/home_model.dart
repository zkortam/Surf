import '/components/p_c_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool isComment = false;

  bool isFollowersOnly = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for PCNavBar component.
  late PCNavBarModel pCNavBarModel;
  // State field(s) for SwipeableStack widget.
  late CardSwiperController swipeableStackController;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    pCNavBarModel = createModel(context, () => PCNavBarModel());
    swipeableStackController = CardSwiperController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    pCNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
