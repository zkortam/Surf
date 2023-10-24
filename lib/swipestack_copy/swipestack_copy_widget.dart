import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'swipestack_copy_model.dart';
export 'swipestack_copy_model.dart';

class SwipestackCopyWidget extends StatefulWidget {
  const SwipestackCopyWidget({Key? key}) : super(key: key);

  @override
  _SwipestackCopyWidgetState createState() => _SwipestackCopyWidgetState();
}

class _SwipestackCopyWidgetState extends State<SwipestackCopyWidget>
    with TickerProviderStateMixin {
  late SwipestackCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(-68.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(-68.0, 0.0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(68.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 1000.ms,
          duration: 600.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(68.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipestackCopyModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Title(
        title: 'swipestackCopy',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: StreamBuilder<List<PostsRecord>>(
                      stream: queryPostsRecord(
                        queryBuilder: (postsRecord) => postsRecord
                            .orderBy('post.timestamp', descending: true),
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: SpinKitRipple(
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<PostsRecord> swipeableStackPostsRecordList =
                            snapshot.data!;
                        return FlutterFlowSwipeableStack(
                          topCardHeightFraction: 0.72,
                          middleCardHeightFraction: 0.68,
                          bottomCardHeightFraction: 0.75,
                          topCardWidthFraction: 0.9,
                          middleCardWidthFraction: 0.85,
                          bottomCardWidthFraction: 0.8,
                          onSwipeFn: (index) {},
                          onLeftSwipe: (index) async {
                            final swipeableStackPostsRecord =
                                swipeableStackPostsRecordList[index];
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation1'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation1']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            if (functions.stringInArr(
                                currentUserUid,
                                swipeableStackPostsRecord.post.downVoters
                                    .toList())) {
                              await swipeableStackPostsRecord.reference
                                  .update(createPostsRecordData(
                                post: createPostStruct(
                                  fieldValues: {
                                    'upVoters': FieldValue.arrayRemove(
                                        [currentUserUid]),
                                    'netVotes': FieldValue.increment(-(1)),
                                  },
                                  clearUnsetFields: false,
                                ),
                              ));
                            } else {
                              if (functions.stringInArr(
                                  currentUserUid,
                                  swipeableStackPostsRecord.post.upVoters
                                      .toList())) {
                                await swipeableStackPostsRecord.reference
                                    .update(createPostsRecordData(
                                  post: createPostStruct(
                                    fieldValues: {
                                      'upVoters': FieldValue.arrayUnion(
                                          [currentUserUid]),
                                      'netVotes': FieldValue.increment(2),
                                      'downVoters': FieldValue.arrayRemove(
                                          [currentUserUid]),
                                    },
                                    clearUnsetFields: false,
                                  ),
                                ));
                              } else {
                                await swipeableStackPostsRecord.reference
                                    .update(createPostsRecordData(
                                  post: createPostStruct(
                                    fieldValues: {
                                      'upVoters': FieldValue.arrayUnion(
                                          [currentUserUid]),
                                      'netVotes': FieldValue.increment(1),
                                    },
                                    clearUnsetFields: false,
                                  ),
                                ));
                              }

                              return;
                            }
                          },
                          onRightSwipe: (index) async {
                            final swipeableStackPostsRecord =
                                swipeableStackPostsRecordList[index];
                            if (animationsMap[
                                    'containerOnActionTriggerAnimation2'] !=
                                null) {
                              await animationsMap[
                                      'containerOnActionTriggerAnimation2']!
                                  .controller
                                  .forward(from: 0.0);
                            }
                            if (functions.stringInArr(
                                currentUserUid,
                                swipeableStackPostsRecord.post.downVoters
                                    .toList())) {
                              await swipeableStackPostsRecord.reference
                                  .update(createPostsRecordData(
                                post: createPostStruct(
                                  fieldValues: {
                                    'netVotes': FieldValue.increment(1),
                                    'downVoters': FieldValue.arrayRemove(
                                        [currentUserUid]),
                                  },
                                  clearUnsetFields: false,
                                ),
                              ));
                            } else {
                              if (functions.stringInArr(
                                  currentUserUid,
                                  swipeableStackPostsRecord.post.downVoters
                                      .toList())) {
                                await swipeableStackPostsRecord.reference
                                    .update(createPostsRecordData(
                                  post: createPostStruct(
                                    fieldValues: {
                                      'upVoters': FieldValue.arrayRemove(
                                          [currentUserUid]),
                                      'netVotes': FieldValue.increment(-(2)),
                                      'downVoters': FieldValue.arrayUnion(
                                          [currentUserUid]),
                                    },
                                    clearUnsetFields: false,
                                  ),
                                ));
                              } else {
                                await swipeableStackPostsRecord.reference
                                    .update(createPostsRecordData(
                                  post: createPostStruct(
                                    fieldValues: {
                                      'netVotes': FieldValue.increment(-(1)),
                                      'downVoters': FieldValue.arrayUnion(
                                          [currentUserUid]),
                                    },
                                    clearUnsetFields: false,
                                  ),
                                ));
                              }

                              return;
                            }
                          },
                          onUpSwipe: (index) {},
                          onDownSwipe: (index) {},
                          itemBuilder: (context, swipeableStackIndex) {
                            final swipeableStackPostsRecord =
                                swipeableStackPostsRecordList[
                                    swipeableStackIndex];
                            return PostWidget(
                              key: Key(
                                  'Keyq76_${swipeableStackIndex}_of_${swipeableStackPostsRecordList.length}'),
                              isComment: false,
                              post: swipeableStackPostsRecord,
                            );
                          },
                          itemCount: swipeableStackPostsRecordList.length,
                          controller: _model.swipeableStackController,
                          enableSwipeUp: false,
                          enableSwipeDown: false,
                        );
                      },
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 50.0),
                      child: Container(
                        width: 20.0,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xA0D20F2C),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(50.0),
                            topLeft: Radius.circular(0.0),
                            topRight: Radius.circular(50.0),
                          ),
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation1']!,
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(1.00, 0.00),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 50.0),
                      child: Container(
                        width: 20.0,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xA00BA217),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(0.0),
                          ),
                        ),
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation2']!,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
