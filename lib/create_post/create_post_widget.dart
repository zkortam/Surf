import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/structs/index.dart';
import '/components/beautified_text_widget.dart';
import '/components/bottom_bar_error_widget.dart';
import '/components/bottom_notif_widget.dart';
import '/components/p_c_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'create_post_model.dart';
export 'create_post_model.dart';

class CreatePostWidget extends StatefulWidget {
  const CreatePostWidget({Key? key}) : super(key: key);

  @override
  _CreatePostWidgetState createState() => _CreatePostWidgetState();
}

class _CreatePostWidgetState extends State<CreatePostWidget>
    with TickerProviderStateMixin {
  late CreatePostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  final animationsMap = {
    'containerOnActionTriggerAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnActionTriggerAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onActionTrigger,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreatePostModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isPoll = false;
        _model.option3 = false;
        _model.option4 = false;
        _model.isMorePressed = 0;
        _model.isSpoiler = false;
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();
    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();
    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();
    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode4 ??= FocusNode();
    _model.textController5 ??= TextEditingController();
    _model.textFieldFocusNode5 ??= FocusNode();
    _model.textController6 ??= TextEditingController();
    _model.textFieldFocusNode6 ??= FocusNode();
    _model.textController7 ??= TextEditingController();
    _model.textFieldFocusNode7 ??= FocusNode();
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
        title: 'createPost',
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
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                  ))
                    wrapWithModel(
                      model: _model.pCNavBarModel,
                      updateCallback: () => setState(() {}),
                      child: PCNavBarWidget(
                        currentPage: 6,
                      ),
                    ),
                  Flexible(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Container(
                            width: 600.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 20.0, 10.0, 0.0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: FlutterFlowButtonTabBar(
                                      useToggleButtonStyle: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                      unselectedLabelStyle: TextStyle(),
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      unselectedBackgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      unselectedBorderColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      borderWidth: 1.0,
                                      borderRadius: 10.0,
                                      elevation: 0.0,
                                      buttonMargin:
                                          EdgeInsetsDirectional.fromSTEB(
                                              8.0, 0.0, 8.0, 0.0),
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 4.0, 4.0, 4.0),
                                      tabs: [
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'pv9z3zeo' /* Post */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '9l7gyyur' /* Thread */,
                                          ),
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 15.0, 0.0, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 20.0,
                                                          10.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: 150.0,
                                                        height: 50.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            AuthUserStreamWidget(
                                                              builder:
                                                                  (context) =>
                                                                      Container(
                                                                width: 35.0,
                                                                height: 35.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  currentUserPhoto,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Text(
                                                                        '@${currentUserDisplayName}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isStealth,
                                                                      false))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          AuthUserStreamWidget(
                                                                        builder:
                                                                            (context) =>
                                                                                Container(
                                                                          height:
                                                                              18.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                Color(0xFF1861A0),
                                                                                Color(0xFF1A105D)
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                1.0
                                                                              ],
                                                                              begin: AlignmentDirectional(1.0, 0.0),
                                                                              end: AlignmentDirectional(-1.0, 0),
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                child: Text(
                                                                                  FFLocalizations.of(context).getText(
                                                                                    'tjd3ql00' /* Stealth */,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: Colors.white,
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Stack(
                                                            children: [
                                                              if (_model
                                                                      .isSpoiler ==
                                                                  false)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                    borderRadius:
                                                                        20.0,
                                                                    borderWidth:
                                                                        2.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .ghost,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model.isSpoiler =
                                                                            true;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                              if (_model
                                                                      .isSpoiler ==
                                                                  true)
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                    borderRadius:
                                                                        20.0,
                                                                    borderWidth:
                                                                        2.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .ghost,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      setState(
                                                                          () {
                                                                        _model.isSpoiler =
                                                                            false;
                                                                      });
                                                                    },
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              final firestoreBatch =
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .batch();
                                                              try {
                                                                if (currentUserEmailVerified &&
                                                                    (_model.textController1.text !=
                                                                            null &&
                                                                        _model.textController1.text !=
                                                                            '') &&
                                                                    (_model.uploadedFileUrl !=
                                                                            null &&
                                                                        _model.uploadedFileUrl !=
                                                                            '')) {
                                                                  setState(() {
                                                                    _model.postID =
                                                                        'P${currentUserUid}[]${(currentUserDocument?.posts?.toList() ?? []).length.toString()}${random_data.randomString(
                                                                      2,
                                                                      12,
                                                                      true,
                                                                      true,
                                                                      true,
                                                                    )}';
                                                                  });
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              BottomNotifWidget(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'kx41gmij' /* Posting */,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));

                                                                  var postsRecordReference =
                                                                      PostsRecord
                                                                          .collection
                                                                          .doc();
                                                                  firestoreBatch.set(
                                                                      postsRecordReference,
                                                                      createPostsRecordData(
                                                                        post:
                                                                            createPostStruct(
                                                                          timestamp:
                                                                              getCurrentTimestamp,
                                                                          caption: _model
                                                                              .textController1
                                                                              .text,
                                                                          author:
                                                                              currentUserUid,
                                                                          netVotes:
                                                                              0,
                                                                          id: _model
                                                                              .postID,
                                                                          isExpanded:
                                                                              false,
                                                                          isSpoiler:
                                                                              _model.isSpoiler,
                                                                          isStealth: valueOrDefault<bool>(
                                                                              currentUserDocument?.isStealth,
                                                                              false),
                                                                          fieldValues: {
                                                                            'spoilerClickers':
                                                                                [
                                                                              currentUserUid
                                                                            ],
                                                                            'images':
                                                                                [
                                                                              getImageHashFirestoreData(
                                                                                createImageHashStruct(
                                                                                  image: _model.uploadedFileUrl,
                                                                                  blurHash: _model.uploadedLocalFile.blurHash,
                                                                                  clearUnsetFields: false,
                                                                                  create: true,
                                                                                ),
                                                                                true,
                                                                              )
                                                                            ],
                                                                          },
                                                                          clearUnsetFields:
                                                                              false,
                                                                          create:
                                                                              true,
                                                                        ),
                                                                      ));
                                                                  _model.post =
                                                                      PostsRecord.getDocumentFromData(
                                                                          createPostsRecordData(
                                                                            post:
                                                                                createPostStruct(
                                                                              timestamp: getCurrentTimestamp,
                                                                              caption: _model.textController1.text,
                                                                              author: currentUserUid,
                                                                              netVotes: 0,
                                                                              id: _model.postID,
                                                                              isExpanded: false,
                                                                              isSpoiler: _model.isSpoiler,
                                                                              isStealth: valueOrDefault<bool>(currentUserDocument?.isStealth, false),
                                                                              fieldValues: {
                                                                                'spoilerClickers': [
                                                                                  currentUserUid
                                                                                ],
                                                                                'images': [
                                                                                  getImageHashFirestoreData(
                                                                                    createImageHashStruct(
                                                                                      image: _model.uploadedFileUrl,
                                                                                      blurHash: _model.uploadedLocalFile.blurHash,
                                                                                      clearUnsetFields: false,
                                                                                      create: true,
                                                                                    ),
                                                                                    true,
                                                                                  )
                                                                                ],
                                                                              },
                                                                              clearUnsetFields: false,
                                                                              create: true,
                                                                            ),
                                                                          ),
                                                                          postsRecordReference);

                                                                  firestoreBatch
                                                                      .update(
                                                                          currentUserReference!,
                                                                          {
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'Posts':
                                                                                FieldValue.arrayUnion([
                                                                              getPostFirestoreData(
                                                                                updatePostStruct(
                                                                                  _model.post?.post,
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                true,
                                                                              )
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                  setState(() {
                                                                    _model
                                                                        .textController1
                                                                        ?.clear();
                                                                  });
                                                                  setState(() {
                                                                    _model.isDataUploading =
                                                                        false;
                                                                    _model.uploadedLocalFile =
                                                                        FFUploadedFile(
                                                                            bytes:
                                                                                Uint8List.fromList([]));
                                                                    _model.uploadedFileUrl =
                                                                        '';
                                                                  });

                                                                  context
                                                                      .pushNamed(
                                                                          'Home');
                                                                } else {
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled:
                                                                        true,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    enableDrag:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return GestureDetector(
                                                                        onTap: () => _model.unfocusNode.canRequestFocus
                                                                            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                            : FocusScope.of(context).unfocus(),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              BottomBarErrorWidget(
                                                                            text:
                                                                                FFLocalizations.of(context).getText(
                                                                              'go7rhtxx' /* Please write a caption and upl... */,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ).then((value) =>
                                                                      safeSetState(
                                                                          () {}));
                                                                }
                                                              } finally {
                                                                await firestoreBatch
                                                                    .commit();
                                                              }

                                                              setState(() {});
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'eu18c34k' /* Post */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                10.0,
                                                                0.0),
                                                    child: TextFormField(
                                                      controller: _model
                                                          .textController1,
                                                      focusNode: _model
                                                          .textFieldFocusNode1,
                                                      autofocus: true,
                                                      obscureText: false,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        hintText:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '3ftumxfo' /* Caption */,
                                                        ),
                                                        hintStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium,
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                            width: 3.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            width: 3.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 3.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        focusedErrorBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .error,
                                                            width: 3.0,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15.0),
                                                        ),
                                                        contentPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    0.0,
                                                                    10.0),
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                      textAlign:
                                                          TextAlign.start,
                                                      maxLength: 50,
                                                      maxLengthEnforcement:
                                                          MaxLengthEnforcement
                                                              .enforced,
                                                      validator: _model
                                                          .textController1Validator
                                                          .asValidator(context),
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (_model.uploadedFileUrl !=
                                                            null &&
                                                        _model.uploadedFileUrl !=
                                                            '')
                                                      Stack(
                                                        children: [
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 500.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image:
                                                                        CachedNetworkImageProvider(
                                                                      _model
                                                                          .uploadedFileUrl,
                                                                    ),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                              ),
                                                            ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            tablet: false,
                                                            tabletLandscape:
                                                                false,
                                                            desktop: false,
                                                          ))
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 375.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  image:
                                                                      DecorationImage(
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    image:
                                                                        CachedNetworkImageProvider(
                                                                      _model
                                                                          .uploadedFileUrl,
                                                                    ),
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    if (_model.uploadedFileUrl !=
                                                            null &&
                                                        _model.uploadedFileUrl !=
                                                            '')
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.00, 0.00),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              setState(() {
                                                                _model.isDataUploading =
                                                                    false;
                                                                _model.uploadedLocalFile =
                                                                    FFUploadedFile(
                                                                        bytes: Uint8List.fromList(
                                                                            []));
                                                                _model.uploadedFileUrl =
                                                                    '';
                                                              });
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              '1n9f2g04' /* Swap Image */,
                                                            ),
                                                            icon: Icon(
                                                              Icons.swap_horiz,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 45.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40.0),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                if (_model.uploadedFileUrl ==
                                                        null ||
                                                    _model.uploadedFileUrl ==
                                                        '')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                30.0,
                                                                10.0,
                                                                0.0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 130.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '432zhht9' /* Upload a file */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontSize:
                                                                      20.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        15.0,
                                                                        0.0,
                                                                        0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            BottomNotifWidget(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            '8jnqxade' /* Uploading */,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));

                                                                final selectedMedia =
                                                                    await selectMediaWithSourceBottomSheet(
                                                                  context:
                                                                      context,
                                                                  allowPhoto:
                                                                      true,
                                                                  includeDimensions:
                                                                      true,
                                                                  includeBlurHash:
                                                                      true,
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                  textColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  pickerFontFamily:
                                                                      'Outfit',
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  setState(() =>
                                                                      _model.isDataUploading =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];

                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    _model.isDataUploading =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    setState(
                                                                        () {
                                                                      _model.uploadedLocalFile =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                  } else {
                                                                    setState(
                                                                        () {});
                                                                    return;
                                                                  }
                                                                }

                                                                setState(() {
                                                                  _model.addToImages(
                                                                      ImageHashStruct(
                                                                    image: _model
                                                                        .uploadedFileUrl,
                                                                    blurHash: _model
                                                                        .uploadedLocalFile
                                                                        .blurHash,
                                                                  ));
                                                                });
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'ij595q6f' /* Upload */,
                                                              ),
                                                              icon: Icon(
                                                                Icons
                                                                    .cloud_upload,
                                                                size: 15.0,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                height: 45.0,
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                elevation: 3.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            40.0),
                                                              ),
                                                              showLoadingIndicator:
                                                                  false,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 30.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 20.0, 10.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 150.0,
                                                      height: 50.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          AuthUserStreamWidget(
                                                            builder:
                                                                (context) =>
                                                                    Container(
                                                              width: 35.0,
                                                              height: 35.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                currentUserPhoto,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            Text(
                                                                      '@${currentUserDisplayName}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium,
                                                                    ),
                                                                  ),
                                                                ),
                                                                if (valueOrDefault<
                                                                        bool>(
                                                                    currentUserDocument
                                                                        ?.isStealth,
                                                                    false))
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Container(
                                                                        height:
                                                                            18.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          gradient:
                                                                              LinearGradient(
                                                                            colors: [
                                                                              Color(0xFF1861A0),
                                                                              Color(0xFF1A105D)
                                                                            ],
                                                                            stops: [
                                                                              0.0,
                                                                              1.0
                                                                            ],
                                                                            begin:
                                                                                AlignmentDirectional(1.0, 0.0),
                                                                            end:
                                                                                AlignmentDirectional(-1.0, 0),
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(50.0),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '3y30erzr' /* Stealth */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Outfit',
                                                                                      color: Colors.white,
                                                                                      fontSize: 12.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 150.0,
                                                      height: 50.0,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          if (_model.isPoll ==
                                                              true)
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                borderRadius:
                                                                    20.0,
                                                                borderWidth:
                                                                    3.0,
                                                                buttonSize:
                                                                    40.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .arrow_back_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 17.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  setState(() {
                                                                    _model.isPoll =
                                                                        false;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              final firestoreBatch =
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .batch();
                                                              try {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            BottomNotifWidget(
                                                                          text:
                                                                              FFLocalizations.of(context).getText(
                                                                            'mbi8v1fn' /* Posting */,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));

                                                                if (_model
                                                                    .isPoll) {
                                                                  setState(() {
                                                                    _model.addToOptions(_model
                                                                        .textController3
                                                                        .text);
                                                                  });
                                                                  setState(() {
                                                                    _model.addToOptions(_model
                                                                        .textController4
                                                                        .text);
                                                                  });
                                                                  if (_model
                                                                      .option3) {
                                                                    setState(
                                                                        () {
                                                                      _model.addToOptions(_model
                                                                          .textController5
                                                                          .text);
                                                                    });
                                                                    if (_model
                                                                        .option4) {
                                                                      setState(
                                                                          () {
                                                                        _model.addToOptions(_model
                                                                            .textController6
                                                                            .text);
                                                                      });
                                                                    }
                                                                  }

                                                                  firestoreBatch
                                                                      .update(
                                                                          currentUserReference!,
                                                                          {
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'threads':
                                                                                FieldValue.arrayUnion([
                                                                              getThreadFirestoreData(
                                                                                createThreadStruct(
                                                                                  timestamp: getCurrentTimestamp,
                                                                                  author: currentUserUid,
                                                                                  title: _model.textController2.text,
                                                                                  netVotes: 0,
                                                                                  id: 'T${currentUserUid}${(currentUserDocument?.threads?.toList() ?? []).length.toString()}',
                                                                                  isPoll: _model.isPoll,
                                                                                  poll: createPollStruct(
                                                                                    fieldValues: {
                                                                                      'options': _model.options,
                                                                                    },
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                  isStealth: valueOrDefault<bool>(currentUserDocument?.isStealth, false),
                                                                                  clearUnsetFields: false,
                                                                                ),
                                                                                true,
                                                                              )
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });

                                                                  firestoreBatch
                                                                      .set(
                                                                          ThreadRecord
                                                                              .collection
                                                                              .doc(),
                                                                          createThreadRecordData(
                                                                            thread:
                                                                                createThreadStruct(
                                                                              timestamp: getCurrentTimestamp,
                                                                              author: currentUserUid,
                                                                              title: _model.textController2.text,
                                                                              netVotes: 0,
                                                                              id: 'T${currentUserUid}${(currentUserDocument?.threads?.toList() ?? []).length.toString()}',
                                                                              poll: createPollStruct(
                                                                                fieldValues: {
                                                                                  'options': _model.options,
                                                                                },
                                                                                clearUnsetFields: false,
                                                                                create: true,
                                                                              ),
                                                                              isPoll: true,
                                                                              isStealth: valueOrDefault<bool>(currentUserDocument?.isStealth, false),
                                                                              clearUnsetFields: false,
                                                                              create: true,
                                                                            ),
                                                                          ));
                                                                } else {
                                                                  if (functions.getStringLength(_model
                                                                          .textController7
                                                                          .text) >
                                                                      999) {
                                                                    _model.threadSummary =
                                                                        await actions
                                                                            .chatGPT(
                                                                      _model
                                                                          .apiKey,
                                                                      'Please summarize the following prompt in 2 sentences max. Make the summary clear and concise. Do not repeat anything. Make it good gramatically, have good spelling, and structure.  FULL SENTENCES. NO CUT OFFS. Here\'s the prompt.${functions.stringClipper(_model.textController7.text, 0, 500)}',
                                                                      1500,
                                                                      0.05,
                                                                    );
                                                                    _model.isPolitical =
                                                                        await actions
                                                                            .chatGPT(
                                                                      _model
                                                                          .apiKey,
                                                                      'Is this thread political? Answer 0 if it isn\'t. 1 if it is. Being political means being related to any political topic. I only want you to declare 0 or 1. nothing else. Here\'s the thread: ${functions.stringClipper(_model.textController7.text, 0, 500)}',
                                                                      1500,
                                                                      0.1,
                                                                    );
                                                                    if (functions
                                                                            .stringToInt(_model.isPolitical!) ==
                                                                        1) {
                                                                      _model.threadPolitical =
                                                                          await actions
                                                                              .chatGPT(
                                                                        _model
                                                                            .apiKey,
                                                                        'If the following prompt is a conservative bias, reply 1. liberal bias reply -1. If it\'s politically neutral, reply 0. I only want your answer to be that. NO OTHER TEXT.${functions.stringClipper(_model.textController7.text, 0, 500)}',
                                                                        1500,
                                                                        0.1,
                                                                      );

                                                                      firestoreBatch
                                                                          .update(
                                                                              currentUserReference!,
                                                                              {
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'threads': FieldValue.arrayUnion([
                                                                                  getThreadFirestoreData(
                                                                                    createThreadStruct(
                                                                                      timestamp: getCurrentTimestamp,
                                                                                      author: currentUserUid,
                                                                                      title: _model.textController2.text,
                                                                                      text: functions.threadTextStripper(_model.textController7.text),
                                                                                      netVotes: 0,
                                                                                      id: 'T${currentUserUid}${(currentUserDocument?.threads?.toList() ?? []).length.toString()}',
                                                                                      isPoll: _model.isPoll,
                                                                                      poll: createPollStruct(
                                                                                        fieldValues: {
                                                                                          'options': _model.options,
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                      link: functions.cutURL(_model.textController7.text) != null && functions.cutURL(_model.textController7.text) != '' ? functions.cutURL(_model.textController7.text) : null,
                                                                                      summary: functions.substringerGPT(_model.threadSummary!),
                                                                                      isStealth: valueOrDefault<bool>(currentUserDocument?.isStealth, false),
                                                                                      politicalPosition: functions.stringToInt(_model.threadPolitical!),
                                                                                      isPolitical: true,
                                                                                      fieldValues: {
                                                                                        'hashtags': functions.extractHashtags(_model.textController7.text),
                                                                                      },
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                    true,
                                                                                  )
                                                                                ]),
                                                                              },
                                                                            ),
                                                                          });

                                                                      firestoreBatch.set(
                                                                          ThreadRecord.collection.doc(),
                                                                          createThreadRecordData(
                                                                            thread:
                                                                                createThreadStruct(
                                                                              timestamp: getCurrentTimestamp,
                                                                              author: currentUserUid,
                                                                              title: _model.textController2.text,
                                                                              text: functions.threadTextStripper(_model.textController7.text),
                                                                              id: 'T${currentUserUid}${(currentUserDocument?.threads?.toList() ?? []).length.toString()}',
                                                                              netVotes: 0,
                                                                              isPoll: false,
                                                                              link: functions.cutURL(_model.textController7.text),
                                                                              summary: functions.substringerGPT(_model.threadSummary!),
                                                                              isStealth: valueOrDefault<bool>(currentUserDocument?.isStealth, false),
                                                                              politicalPosition: functions.stringToInt(_model.threadPolitical!),
                                                                              isPolitical: true,
                                                                              fieldValues: {
                                                                                'hashtags': functions.extractHashtags(_model.textController7.text),
                                                                              },
                                                                              clearUnsetFields: false,
                                                                              create: true,
                                                                            ),
                                                                          ));
                                                                    } else {
                                                                      firestoreBatch
                                                                          .update(
                                                                              currentUserReference!,
                                                                              {
                                                                            ...mapToFirestore(
                                                                              {
                                                                                'threads': FieldValue.arrayUnion([
                                                                                  getThreadFirestoreData(
                                                                                    createThreadStruct(
                                                                                      timestamp: getCurrentTimestamp,
                                                                                      author: currentUserUid,
                                                                                      title: _model.textController2.text,
                                                                                      text: functions.threadTextStripper(_model.textController7.text),
                                                                                      netVotes: 0,
                                                                                      id: 'T${currentUserUid}${(currentUserDocument?.threads?.toList() ?? []).length.toString()}',
                                                                                      isPoll: _model.isPoll,
                                                                                      poll: createPollStruct(
                                                                                        fieldValues: {
                                                                                          'options': _model.options,
                                                                                        },
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                      link: functions.cutURL(_model.textController7.text) != null && functions.cutURL(_model.textController7.text) != '' ? functions.cutURL(_model.textController7.text) : null,
                                                                                      summary: functions.substringerGPT(_model.threadSummary!),
                                                                                      isStealth: valueOrDefault<bool>(currentUserDocument?.isStealth, false),
                                                                                      fieldValues: {
                                                                                        'hashtags': functions.extractHashtags(_model.textController7.text),
                                                                                      },
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                    true,
                                                                                  )
                                                                                ]),
                                                                              },
                                                                            ),
                                                                          });

                                                                      firestoreBatch.set(
                                                                          ThreadRecord.collection.doc(),
                                                                          createThreadRecordData(
                                                                            thread:
                                                                                createThreadStruct(
                                                                              timestamp: getCurrentTimestamp,
                                                                              author: currentUserUid,
                                                                              title: _model.textController2.text,
                                                                              text: functions.threadTextStripper(_model.textController7.text),
                                                                              id: 'T${currentUserUid}${(currentUserDocument?.threads?.toList() ?? []).length.toString()}',
                                                                              netVotes: 0,
                                                                              isPoll: false,
                                                                              link: functions.cutURL(_model.textController7.text),
                                                                              summary: functions.substringerGPT(_model.threadSummary!),
                                                                              isStealth: valueOrDefault<bool>(currentUserDocument?.isStealth, false),
                                                                              fieldValues: {
                                                                                'hashtags': functions.extractHashtags(_model.textController7.text),
                                                                              },
                                                                              clearUnsetFields: false,
                                                                              create: true,
                                                                            ),
                                                                          ));
                                                                    }
                                                                  } else {
                                                                    firestoreBatch
                                                                        .update(
                                                                            currentUserReference!,
                                                                            {
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'threads': FieldValue.arrayUnion([
                                                                                getThreadFirestoreData(
                                                                                  createThreadStruct(
                                                                                    timestamp: getCurrentTimestamp,
                                                                                    author: currentUserUid,
                                                                                    title: _model.textController2.text,
                                                                                    text: functions.threadTextStripper(_model.textController7.text),
                                                                                    netVotes: 0,
                                                                                    id: 'T${currentUserUid}${(currentUserDocument?.threads?.toList() ?? []).length.toString()}',
                                                                                    isPoll: _model.isPoll,
                                                                                    poll: createPollStruct(
                                                                                      fieldValues: {
                                                                                        'options': _model.options,
                                                                                      },
                                                                                      clearUnsetFields: false,
                                                                                    ),
                                                                                    link: functions.cutURL(_model.textController7.text) != null && functions.cutURL(_model.textController7.text) != '' ? functions.cutURL(_model.textController7.text) : null,
                                                                                    isStealth: valueOrDefault<bool>(currentUserDocument?.isStealth, false),
                                                                                    fieldValues: {
                                                                                      'hashtags': functions.extractHashtags(_model.textController7.text),
                                                                                    },
                                                                                    clearUnsetFields: false,
                                                                                  ),
                                                                                  true,
                                                                                )
                                                                              ]),
                                                                            },
                                                                          ),
                                                                        });

                                                                    firestoreBatch.set(
                                                                        ThreadRecord.collection.doc(),
                                                                        createThreadRecordData(
                                                                          thread:
                                                                              createThreadStruct(
                                                                            timestamp:
                                                                                getCurrentTimestamp,
                                                                            author:
                                                                                currentUserUid,
                                                                            title:
                                                                                _model.textController2.text,
                                                                            text:
                                                                                functions.threadTextStripper(_model.textController7.text),
                                                                            id: 'T${currentUserUid}${(currentUserDocument?.threads?.toList() ?? []).length.toString()}',
                                                                            netVotes:
                                                                                0,
                                                                            isPoll:
                                                                                false,
                                                                            link:
                                                                                functions.cutURL(_model.textController7.text),
                                                                            isStealth:
                                                                                valueOrDefault<bool>(currentUserDocument?.isStealth, false),
                                                                            fieldValues: {
                                                                              'hashtags': functions.extractHashtags(_model.textController7.text),
                                                                            },
                                                                            clearUnsetFields:
                                                                                false,
                                                                            create:
                                                                                true,
                                                                          ),
                                                                        ));
                                                                  }
                                                                }

                                                                context.goNamed(
                                                                  'Threads',
                                                                  extra: <String,
                                                                      dynamic>{
                                                                    kTransitionInfoKey:
                                                                        TransitionInfo(
                                                                      hasTransition:
                                                                          true,
                                                                      transitionType:
                                                                          PageTransitionType
                                                                              .fade,
                                                                    ),
                                                                  },
                                                                );
                                                              } finally {
                                                                await firestoreBatch
                                                                    .commit();
                                                              }

                                                              setState(() {});
                                                            },
                                                            text: FFLocalizations
                                                                    .of(context)
                                                                .getText(
                                                              'o1eudivt' /* Post */,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                              elevation: 3.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Colors
                                                                    .transparent,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 0.0),
                                                child: TextFormField(
                                                  controller:
                                                      _model.textController2,
                                                  focusNode: _model
                                                      .textFieldFocusNode2,
                                                  autofocus: true,
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    hintText:
                                                        _model.isPoll == true
                                                            ? 'Question'
                                                            : 'Title',
                                                    hintStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium,
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        width: 3.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        width: 3.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 3.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        width: 3.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                10.0,
                                                                0.0,
                                                                10.0),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                  maxLength: 50,
                                                  maxLengthEnforcement:
                                                      MaxLengthEnforcement
                                                          .enforced,
                                                  validator: _model
                                                      .textController2Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Stack(
                                                children: [
                                                  if (_model.isPoll == true)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minHeight:
                                                                      160.0,
                                                                  maxHeight:
                                                                      227.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              width: 3.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.textController3,
                                                                              focusNode: _model.textFieldFocusNode3,
                                                                              autofocus: true,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  'vxdovwzm' /* Option 1 */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                enabledBorder: InputBorder.none,
                                                                                focusedBorder: InputBorder.none,
                                                                                errorBorder: InputBorder.none,
                                                                                focusedErrorBorder: InputBorder.none,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              validator: _model.textController3Validator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              50.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              width: 3.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.textController4,
                                                                              focusNode: _model.textFieldFocusNode4,
                                                                              autofocus: true,
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                hintText: FFLocalizations.of(context).getText(
                                                                                  '9m0ya9zo' /* Option 2 */,
                                                                                ),
                                                                                hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                enabledBorder: InputBorder.none,
                                                                                focusedBorder: InputBorder.none,
                                                                                errorBorder: InputBorder.none,
                                                                                focusedErrorBorder: InputBorder.none,
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                              validator: _model.textController4Validator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (_model
                                                                          .option3)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              5.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              setState(() {
                                                                                _model.addToOptions(_model.textController5.text);
                                                                              });
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  width: 3.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                child: TextFormField(
                                                                                  controller: _model.textController5,
                                                                                  focusNode: _model.textFieldFocusNode5,
                                                                                  autofocus: true,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                    hintText: FFLocalizations.of(context).getText(
                                                                                      'jl4eyzye' /* Option 3 */,
                                                                                    ),
                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                    enabledBorder: InputBorder.none,
                                                                                    focusedBorder: InputBorder.none,
                                                                                    errorBorder: InputBorder.none,
                                                                                    focusedErrorBorder: InputBorder.none,
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                  validator: _model.textController5Validator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ).animateOnActionTrigger(animationsMap['containerOnActionTriggerAnimation1']!, hasBeenTriggered: hasContainerTriggered1),
                                                                        ),
                                                                      if (_model
                                                                          .option4)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              5.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                50.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                width: 3.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                              child: TextFormField(
                                                                                controller: _model.textController6,
                                                                                focusNode: _model.textFieldFocusNode6,
                                                                                autofocus: true,
                                                                                obscureText: false,
                                                                                decoration: InputDecoration(
                                                                                  labelStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                  hintText: FFLocalizations.of(context).getText(
                                                                                    'zi2yz48j' /* Option 4 */,
                                                                                  ),
                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                                                                                  enabledBorder: InputBorder.none,
                                                                                  focusedBorder: InputBorder.none,
                                                                                  errorBorder: InputBorder.none,
                                                                                  focusedErrorBorder: InputBorder.none,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                validator: _model.textController6Validator.asValidator(context),
                                                                              ),
                                                                            ),
                                                                          ).animateOnActionTrigger(animationsMap['containerOnActionTriggerAnimation2']!, hasBeenTriggered: hasContainerTriggered2),
                                                                        ),
                                                                      if (_model
                                                                              .isMorePressed !=
                                                                          2)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              5.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              if (_model.isMorePressed == 0) {
                                                                                setState(() {
                                                                                  _model.option3 = true;
                                                                                  _model.isMorePressed = 1;
                                                                                });
                                                                                if (animationsMap['containerOnActionTriggerAnimation1'] != null) {
                                                                                  setState(() => hasContainerTriggered1 = true);
                                                                                  SchedulerBinding.instance.addPostFrameCallback((_) async => await animationsMap['containerOnActionTriggerAnimation1']!.controller.forward(from: 0.0));
                                                                                }
                                                                              } else {
                                                                                if (_model.isMorePressed == 1) {
                                                                                  setState(() {
                                                                                    _model.option4 = true;
                                                                                    _model.isMorePressed = 2;
                                                                                  });
                                                                                  if (animationsMap['containerOnActionTriggerAnimation2'] != null) {
                                                                                    setState(() => hasContainerTriggered2 = true);
                                                                                    SchedulerBinding.instance.addPostFrameCallback((_) async => await animationsMap['containerOnActionTriggerAnimation2']!.controller.forward(from: 0.0));
                                                                                  }
                                                                                }
                                                                              }
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 50.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  width: 3.0,
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'xfy0f6lg' /* More options */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (_model.isPoll == false)
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.4,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textController7,
                                                              focusNode: _model
                                                                  .textFieldFocusNode7,
                                                              autofocus: true,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                                hintText:
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                  'gugcmwwk' /* What's happening? */,
                                                                ),
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium,
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                    width: 3.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    width: 3.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 3.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 3.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                contentPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            15.0,
                                                                            10.0,
                                                                            15.0),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                              maxLines: 20,
                                                              minLines: 5,
                                                              maxLength: 2000,
                                                              maxLengthEnforcement:
                                                                  MaxLengthEnforcement
                                                                      .enforced,
                                                              validator: _model
                                                                  .textController7Validator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      10.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  borderRadius:
                                                                      20.0,
                                                                  borderWidth:
                                                                      2.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons.grain,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    setState(
                                                                        () {
                                                                      _model.isPoll =
                                                                          true;
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                  borderRadius:
                                                                      20.0,
                                                                  borderWidth:
                                                                      2.0,
                                                                  buttonSize:
                                                                      40.0,
                                                                  icon: Icon(
                                                                    Icons
                                                                        .star_border,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                BottomNotifWidget(
                                                                              text: 'Beautifying',
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));

                                                                    _model.gptOut =
                                                                        await actions
                                                                            .chatGPT(
                                                                      _model
                                                                          .apiKey,
                                                                      '${_model.textController7.text}Fix all of the grammar and spelling mistakes in this prompt.',
                                                                      1500,
                                                                      0.05,
                                                                    );
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return GestureDetector(
                                                                          onTap: () => _model.unfocusNode.canRequestFocus
                                                                              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                                                                              : FocusScope.of(context).unfocus(),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                BeautifiedTextWidget(
                                                                              text: functions.substringerGPT(_model.gptOut!),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
