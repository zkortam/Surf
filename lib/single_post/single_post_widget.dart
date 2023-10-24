import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/bottom_notif_widget.dart';
import '/components/comment_widget.dart';
import '/components/p_c_comment_light_widget.dart';
import '/components/p_c_nav_bar_widget.dart';
import '/components/post_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'single_post_model.dart';
export 'single_post_model.dart';

class SinglePostWidget extends StatefulWidget {
  const SinglePostWidget({
    Key? key,
    required this.posts,
    this.action,
    this.username,
  }) : super(key: key);

  final PostsRecord? posts;
  final int? action;
  final String? username;

  @override
  _SinglePostWidgetState createState() => _SinglePostWidgetState();
}

class _SinglePostWidgetState extends State<SinglePostWidget> {
  late SinglePostModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SinglePostModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentPageLink = await generateCurrentPageLink(
        context,
        title: '@${widget.username}\'s Post',
        imageUrl: widget.posts?.post?.images?.first?.image,
        description: 'View on Surf',
        forceRedirect: true,
      );

      if (widget.action == 1) {
        await Share.share(
          _model.currentPageLink,
          sharePositionOrigin: getWidgetBoundingBox(context),
        );
      } else {
        if (widget.action == 2) {
          await Clipboard.setData(ClipboardData(text: _model.currentPageLink));
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            enableDrag: false,
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: BottomNotifWidget(
                    text: 'Copied to clipboard',
                  ),
                ),
              );
            },
          ).then((value) => safeSetState(() {}));
        }
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
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

    return Builder(
      builder: (context) => StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(
          queryBuilder: (usersRecord) => usersRecord.where(
            'uid',
            isEqualTo: widget.posts?.post?.author,
          ),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: SpinKitRipple(
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 50.0,
                  ),
                ),
              ),
            );
          }
          List<UsersRecord> singlePostUsersRecordList = snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final singlePostUsersRecord = singlePostUsersRecordList.isNotEmpty
              ? singlePostUsersRecordList.first
              : null;
          return Title(
              title: 'singlePost',
              color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
              child: GestureDetector(
                onTap: () => _model.unfocusNode.canRequestFocus
                    ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                    : FocusScope.of(context).unfocus(),
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  body: SafeArea(
                    top: true,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.pCNavBarModel,
                          updateCallback: () => setState(() {}),
                          child: PCNavBarWidget(),
                        ),
                        Flexible(
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Align(
                                    alignment:
                                        AlignmentDirectional(0.00, -1.00),
                                    child: Container(
                                      width: 600.0,
                                      decoration: BoxDecoration(),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (responsiveVisibility(
                                              context: context,
                                              desktop: false,
                                            ))
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 5.0, 5.0, 10.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xFF9F1CFA),
                                                        Color(0xFF0D28A2)
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.87, -1.0),
                                                      end: AlignmentDirectional(
                                                          -0.87, 1.0),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200.0),
                                                  ),
                                                  child: Visibility(
                                                    visible:
                                                        responsiveVisibility(
                                                      context: context,
                                                      tablet: false,
                                                      tabletLandscape: false,
                                                      desktop: false,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  5.0,
                                                                  0.0,
                                                                  5.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor:
                                                                Colors.white,
                                                            borderRadius: 25.0,
                                                            borderWidth: 3.0,
                                                            buttonSize: 40.0,
                                                            icon: Icon(
                                                              Icons
                                                                  .arrow_back_rounded,
                                                              color:
                                                                  Colors.white,
                                                              size: 15.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              context.safePop();
                                                            },
                                                          ),
                                                          Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                0.75,
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    '6vxptz32' /* Comments */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            18.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
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
                                              ),
                                            StreamBuilder<List<PostsRecord>>(
                                              stream: queryPostsRecord(
                                                queryBuilder: (postsRecord) =>
                                                    postsRecord
                                                        .where(
                                                          'post.id',
                                                          isEqualTo: widget
                                                              .posts?.post?.id,
                                                        )
                                                        .where(
                                                          'post.timestamp',
                                                          isEqualTo: widget
                                                              .posts
                                                              ?.post
                                                              ?.timestamp,
                                                        ),
                                                singleRecord: true,
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
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<PostsRecord>
                                                    columnPostsRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final columnPostsRecord =
                                                    columnPostsRecordList
                                                            .isNotEmpty
                                                        ? columnPostsRecordList
                                                            .first
                                                        : null;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  10.0),
                                                      child: wrapWithModel(
                                                        model: _model.postModel,
                                                        updateCallback: () =>
                                                            setState(() {}),
                                                        updateOnChange: true,
                                                        child: PostWidget(
                                                          isComment: false,
                                                          post:
                                                              columnPostsRecord!,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 0.0, 5.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                child: Container(
                                                  width: 600.0,
                                                  constraints: BoxConstraints(
                                                    minHeight: 150.0,
                                                    maxHeight: 500.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          3.0,
                                                                          3.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 45.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                Container(
                                                                              width: 35.0,
                                                                              height: 35.0,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              decoration: BoxDecoration(
                                                                                shape: BoxShape.circle,
                                                                              ),
                                                                              child: Image.network(
                                                                                valueOrDefault<String>(
                                                                                  currentUserPhoto,
                                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/surf-1-0-7-65fnd5/assets/9cs0t43k77pp/agents.png',
                                                                                ),
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              AuthUserStreamWidget(
                                                                                builder: (context) => Text(
                                                                                  valueOrDefault(currentUserDocument?.realName, ''),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        fontSize: 14.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              AuthUserStreamWidget(
                                                                                builder: (context) => Text(
                                                                                  '@${currentUserDisplayName}',
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              UsersRecord>>(
                                                                        stream:
                                                                            queryUsersRecord(
                                                                          queryBuilder: (usersRecord) =>
                                                                              usersRecord.where(
                                                                            'uid',
                                                                            isEqualTo:
                                                                                widget.posts?.post?.author,
                                                                          ),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: SpinKitRipple(
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 50.0,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<UsersRecord>
                                                                              textUsersRecordList =
                                                                              snapshot.data!;
                                                                          // Return an empty Container when the item does not exist.
                                                                          if (snapshot
                                                                              .data!
                                                                              .isEmpty) {
                                                                            return Container();
                                                                          }
                                                                          final textUsersRecord = textUsersRecordList.isNotEmpty
                                                                              ? textUsersRecordList.first
                                                                              : null;
                                                                          return InkWell(
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
                                                                              context.pushNamed(
                                                                                'Profile',
                                                                                queryParameters: {
                                                                                  'userID': serializeParam(
                                                                                    textUsersRecord?.uid,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                'replying to @${valueOrDefault<String>(
                                                                                  widget.posts?.post?.isStealth == true ? 'Anonymous' : textUsersRecord?.displayName,
                                                                                  'Anonymous',
                                                                                )}',
                                                                                'Replying to @Anonymous',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Outfit',
                                                                                    fontSize: 14.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      10.0,
                                                                      5.0,
                                                                      5.0),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController,
                                                            focusNode: _model
                                                                .textFieldFocusNode,
                                                            autofocus: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                              hintText:
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                'iuup1e04' /* Type comment... */,
                                                              ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium,
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 2.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          10.0,
                                                                          10.0,
                                                                          10.0),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  fontSize:
                                                                      14.0,
                                                                ),
                                                            maxLines: 7,
                                                            minLines: 2,
                                                            validator: _model
                                                                .textControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                        if (_model.uploadedFileUrl !=
                                                                null &&
                                                            _model.uploadedFileUrl !=
                                                                '')
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        5.0,
                                                                        5.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 240.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20.0),
                                                              ),
                                                              child: Visibility(
                                                                visible: _model
                                                                            .uploadedFileUrl !=
                                                                        null &&
                                                                    _model.uploadedFileUrl !=
                                                                        '',
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowMediaDisplay(
                                                                    path: _model
                                                                        .uploadedFileUrl,
                                                                    imageBuilder:
                                                                        (path) =>
                                                                            ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      child: Image
                                                                          .network(
                                                                        path,
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            250.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    videoPlayerBuilder:
                                                                        (path) =>
                                                                            FlutterFlowVideoPlayer(
                                                                      path:
                                                                          path,
                                                                      width: double
                                                                          .infinity,
                                                                      height: double
                                                                          .infinity,
                                                                      autoPlay:
                                                                          false,
                                                                      looping:
                                                                          true,
                                                                      showControls:
                                                                          true,
                                                                      allowFullScreen:
                                                                          true,
                                                                      allowPlaybackSpeedMenu:
                                                                          false,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      5.0,
                                                                      5.0,
                                                                      5.0),
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
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                child:
                                                                    FlutterFlowIconButton(
                                                                  borderColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                  borderRadius:
                                                                      20.0,
                                                                  borderWidth:
                                                                      3.0,
                                                                  buttonSize:
                                                                      35.0,
                                                                  icon: Icon(
                                                                    Icons.add,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 20.0,
                                                                  ),
                                                                  onPressed:
                                                                      () async {
                                                                    final selectedMedia =
                                                                        await selectMediaWithSourceBottomSheet(
                                                                      context:
                                                                          context,
                                                                      allowPhoto:
                                                                          true,
                                                                      includeBlurHash:
                                                                          true,
                                                                    );
                                                                    if (selectedMedia !=
                                                                            null &&
                                                                        selectedMedia.every((m) => validateFileFormat(
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
                                                                            (m) async =>
                                                                                await uploadData(m.storagePath, m.bytes),
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
                                                                      if (selectedUploadedFiles.length ==
                                                                              selectedMedia
                                                                                  .length &&
                                                                          downloadUrls.length ==
                                                                              selectedMedia.length) {
                                                                        setState(
                                                                            () {
                                                                          _model.uploadedLocalFile =
                                                                              selectedUploadedFiles.first;
                                                                          _model.uploadedFileUrl =
                                                                              downloadUrls.first;
                                                                        });
                                                                      } else {
                                                                        setState(
                                                                            () {});
                                                                        return;
                                                                      }
                                                                    }
                                                                  },
                                                                ),
                                                              ),
                                                              StreamBuilder<
                                                                  List<
                                                                      UsersRecord>>(
                                                                stream:
                                                                    queryUsersRecord(
                                                                  queryBuilder:
                                                                      (usersRecord) =>
                                                                          usersRecord
                                                                              .where(
                                                                    'uid',
                                                                    isEqualTo: widget
                                                                        .posts
                                                                        ?.post
                                                                        ?.author,
                                                                  ),
                                                                  singleRecord:
                                                                      true,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitRipple(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<UsersRecord>
                                                                      buttonUsersRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  // Return an empty Container when the item does not exist.
                                                                  if (snapshot
                                                                      .data!
                                                                      .isEmpty) {
                                                                    return Container();
                                                                  }
                                                                  final buttonUsersRecord = buttonUsersRecordList
                                                                          .isNotEmpty
                                                                      ? buttonUsersRecordList
                                                                          .first
                                                                      : null;
                                                                  return FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      final firestoreBatch = FirebaseFirestore
                                                                          .instance
                                                                          .batch();
                                                                      try {
                                                                        firestoreBatch.update(
                                                                            widget.posts!.reference,
                                                                            createPostsRecordData(
                                                                              post: createPostStruct(
                                                                                fieldValues: {
                                                                                  'comments': FieldValue.arrayUnion([
                                                                                    getCommentFirestoreData(
                                                                                      createCommentStruct(
                                                                                        isPostComment: true,
                                                                                        idReplyTo: widget.posts?.post?.id,
                                                                                        text: _model.textController.text,
                                                                                        authorid: currentUserUid,
                                                                                        id: 'C${currentUserUid}RT${widget.posts?.post?.author}${widget.posts?.post?.comments?.length?.toString()}',
                                                                                        timestamp: getCurrentTimestamp,
                                                                                        imageHash: createImageHashStruct(
                                                                                          image: _model.uploadedFileUrl,
                                                                                          blurHash: _model.uploadedLocalFile.blurHash,
                                                                                          clearUnsetFields: false,
                                                                                        ),
                                                                                        isStealth: valueOrDefault<bool>(currentUserDocument?.isStealth, false),
                                                                                        isAuthorStealth: widget.posts?.post?.isStealth,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                      true,
                                                                                    )
                                                                                  ]),
                                                                                },
                                                                                clearUnsetFields: false,
                                                                              ),
                                                                            ));

                                                                        firestoreBatch.set(
                                                                            CommentsRecord.collection.doc(),
                                                                            createCommentsRecordData(
                                                                              comment: createCommentStruct(
                                                                                isPostComment: true,
                                                                                idReplyTo: widget.posts?.post?.id,
                                                                                text: _model.textController.text,
                                                                                authorid: currentUserUid,
                                                                                timestamp: getCurrentTimestamp,
                                                                                id: 'C${currentUserUid}RT${widget.posts?.post?.author}${widget.posts?.post?.comments?.length?.toString()}',
                                                                                imageHash: createImageHashStruct(
                                                                                  image: _model.uploadedFileUrl,
                                                                                  blurHash: _model.uploadedLocalFile.blurHash,
                                                                                  clearUnsetFields: false,
                                                                                  create: true,
                                                                                ),
                                                                                isStealth: valueOrDefault<bool>(currentUserDocument?.isStealth, false),
                                                                                isAuthorStealth: widget.posts?.post?.isStealth,
                                                                                clearUnsetFields: false,
                                                                                create: true,
                                                                              ),
                                                                            ));
                                                                        if (widget.posts?.post?.author ==
                                                                            currentUserUid) {
                                                                          return;
                                                                        }

                                                                        if (valueOrDefault<bool>(
                                                                            currentUserDocument?.isStealth,
                                                                            false)) {
                                                                          return;
                                                                        }

                                                                        firestoreBatch.update(
                                                                            buttonUsersRecord!.reference,
                                                                            {
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'notifications': FieldValue.arrayUnion([
                                                                                    getNotificationFirestoreData(
                                                                                      createNotificationStruct(
                                                                                        category: 1,
                                                                                        itemID: widget.posts?.post?.id,
                                                                                        time: getCurrentTimestamp,
                                                                                        userID: currentUserUid,
                                                                                        isMarkedAsRead: false,
                                                                                        notifID: 'NP${buttonUsersRecord?.notifications?.length?.toString()}',
                                                                                        iDUserFrom: currentUserUid,
                                                                                        clearUnsetFields: false,
                                                                                      ),
                                                                                      true,
                                                                                    )
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                        triggerPushNotification(
                                                                          notificationTitle:
                                                                              '@${currentUserDisplayName}has commented on your post',
                                                                          notificationText: _model
                                                                              .textController
                                                                              .text,
                                                                          notificationImageUrl: _model.uploadedFileUrl != null && _model.uploadedFileUrl != ''
                                                                              ? _model.uploadedFileUrl
                                                                              : 'null',
                                                                          userRefs: [
                                                                            buttonUsersRecord!.reference
                                                                          ],
                                                                          initialPageName:
                                                                              'singlePost',
                                                                          parameterData: {
                                                                            'posts':
                                                                                widget.posts,
                                                                          },
                                                                        );
                                                                        setState(
                                                                            () {
                                                                          _model.isDataUploading =
                                                                              false;
                                                                          _model.uploadedLocalFile =
                                                                              FFUploadedFile(bytes: Uint8List.fromList([]));
                                                                          _model.uploadedFileUrl =
                                                                              '';
                                                                        });

                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .textController
                                                                              ?.clear();
                                                                        });
                                                                      } finally {
                                                                        await firestoreBatch
                                                                            .commit();
                                                                      }
                                                                    },
                                                                    text: FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '1kzsz5h4' /* Post */,
                                                                    ),
                                                                    options:
                                                                        FFButtonOptions(
                                                                      height:
                                                                          35.0,
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                      elevation:
                                                                          3.0,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1.0,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20.0),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<CommentsRecord>>(
                                                stream: queryCommentsRecord(
                                                  queryBuilder: (commentsRecord) =>
                                                      commentsRecord
                                                          .where(
                                                            'comment.idReplyTo',
                                                            isEqualTo: widget
                                                                .posts
                                                                ?.post
                                                                ?.id,
                                                          )
                                                          .orderBy(
                                                              'comment.timestamp',
                                                              descending: true),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child: SpinKitRipple(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 50.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<CommentsRecord>
                                                      columnCommentsRecordList =
                                                      snapshot.data!;
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        columnCommentsRecordList
                                                            .length,
                                                        (columnIndex) {
                                                      final columnCommentsRecord =
                                                          columnCommentsRecordList[
                                                              columnIndex];
                                                      return Container(
                                                        width: 600.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Stack(
                                                          children: [
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
                                                                            5.0,
                                                                            5.0,
                                                                            5.0,
                                                                            5.0),
                                                                child:
                                                                    CommentWidget(
                                                                  key: Key(
                                                                      'Key4ov_${columnIndex}_of_${columnCommentsRecordList.length}'),
                                                                  comment:
                                                                      columnCommentsRecord
                                                                          .comment,
                                                                  authorIDreplyto:
                                                                      widget
                                                                          .posts!
                                                                          .post
                                                                          .author,
                                                                ),
                                                              ),
                                                            if (responsiveVisibility(
                                                              context: context,
                                                              phone: false,
                                                            ))
                                                              PCCommentLightWidget(
                                                                key: Key(
                                                                    'Keykq9_${columnIndex}_of_${columnCommentsRecordList.length}'),
                                                                comment:
                                                                    columnCommentsRecord
                                                                        .comment,
                                                                authorIDreplyto:
                                                                    widget
                                                                        .posts!
                                                                        .post
                                                                        .author,
                                                              ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                                  );
                                                },
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
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
