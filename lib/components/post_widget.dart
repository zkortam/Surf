import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/comment_widget.dart';
import '/components/home_comp_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_media_display.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';
import 'post_model.dart';
export 'post_model.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({
    Key? key,
    required this.post,
    bool? isComment,
  })  : this.isComment = isComment ?? false,
        super(key: key);

  final PostsRecord? post;
  final bool isComment;

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late PostModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostModel());

    _model.textController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        if (responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ))
          InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'singlePost',
                queryParameters: {
                  'posts': serializeParam(
                    widget.post,
                    ParamType.Document,
                  ),
                }.withoutNulls,
                extra: <String, dynamic>{
                  'posts': widget.post,
                },
              );
            },
            onLongPress: () async {
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                useSafeArea: true,
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: HomeCompWidget(
                      post: widget.post!,
                    ),
                  );
                },
              ).then((value) => safeSetState(() {}));
            },
            child: Container(
              width: 450.0,
              height: 450.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 500.0,
                    child: PageView(
                      controller: _model.pageViewController1 ??=
                          PageController(initialPage: 0),
                      scrollDirection: Axis.horizontal,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: OctoImage(
                            placeholderBuilder: OctoPlaceholder.blurHash(
                              widget.post!.post.images[0].blurHash,
                            ),
                            image: NetworkImage(
                              widget.post!.post.images[0].image,
                            ),
                            width: 300.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if ((widget.post?.post?.isSpoiler == true) &&
                      (functions.stringInArr(currentUserUid,
                              widget.post!.post.spoilerClickers.toList()) ==
                          false))
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await widget.post!.reference
                            .update(createPostsRecordData(
                          post: createPostStruct(
                            fieldValues: {
                              'spoilerClickers':
                                  FieldValue.arrayUnion([currentUserUid]),
                            },
                            clearUnsetFields: false,
                          ),
                        ));
                      },
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFD14181B),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'faxmqvvb' /* Spoiler */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 3.0, 3.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onDoubleTap: () async {
                            context.pushNamed(
                              'singlePost',
                              queryParameters: {
                                'posts': serializeParam(
                                  widget.post,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'posts': widget.post,
                              },
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              minHeight: 60.0,
                              maxHeight: 80.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0x6E000000),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  2.0, 2.0, 2.0, 2.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        1.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, -1.00),
                                              child: Container(
                                                height: 32.0,
                                                constraints: BoxConstraints(
                                                  minWidth: 90.0,
                                                  maxWidth: 200.0,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Color(0x40000000),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          300.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<UsersRecord>>(
                                                    stream: queryUsersRecord(
                                                      queryBuilder:
                                                          (usersRecord) =>
                                                              usersRecord.where(
                                                        'uid',
                                                        isEqualTo: widget.post!
                                                                .post.isStealth
                                                            ? 'anon'
                                                            : widget.post?.post
                                                                ?.author,
                                                      ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                SpinKitRipple(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<UsersRecord>
                                                          rowUsersRecordList =
                                                          snapshot.data!;
                                                      final rowUsersRecord =
                                                          rowUsersRecordList
                                                                  .isNotEmpty
                                                              ? rowUsersRecordList
                                                                  .first
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
                                                        onTap: () async {
                                                          if (widget.post!.post
                                                              .isStealth) {
                                                            return;
                                                          }

                                                          context.pushNamed(
                                                            'Profile',
                                                            queryParameters: {
                                                              'userID':
                                                                  serializeParam(
                                                                rowUsersRecord
                                                                    ?.uid,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          1.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 25.0,
                                                                height: 25.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    rowUsersRecord
                                                                        ?.photoUrl,
                                                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/surf-1-0-7-65fnd5/assets/9cs0t43k77pp/agents.png',
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Flexible(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            15.0,
                                                                            0.0),
                                                                child: Text(
                                                                  '@${valueOrDefault<String>(
                                                                    rowUsersRecord
                                                                        ?.displayName,
                                                                    'Anonymous',
                                                                  )}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, -1.00),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 0.0, 0.0),
                                                child: Container(
                                                  width: 32.0,
                                                  height: 32.0,
                                                  constraints: BoxConstraints(
                                                    minWidth: 40.0,
                                                    maxWidth: 90.0,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color(0x3F000000),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          '${widget.post!.post.netVotes > 0 ? '+' : ' '}${widget.post?.post?.netVotes?.toString()}',
                                                          '0',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Outfit',
                                                              color:
                                                                  valueOrDefault<
                                                                      Color>(
                                                                () {
                                                                  if (widget
                                                                          .post
                                                                          ?.post
                                                                          ?.netVotes ==
                                                                      0) {
                                                                    return Colors
                                                                        .white;
                                                                  } else if (widget
                                                                          .post!
                                                                          .post
                                                                          .netVotes >
                                                                      0) {
                                                                    return Color(
                                                                        0xFF21E744);
                                                                  } else {
                                                                    return Color(
                                                                        0xFFE5200B);
                                                                  }
                                                                }(),
                                                                Colors.white,
                                                              ),
                                                              fontSize: 14.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 2.0, 0.0, 0.0),
                                          child: Text(
                                            widget.post!.post.caption
                                                .maybeHandleOverflow(
                                                    maxChars: 50),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.thumb_up,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                          onPressed: () async {
                                            final firestoreBatch =
                                                FirebaseFirestore.instance
                                                    .batch();
                                            try {
                                              if (functions.stringInArr(
                                                  currentUserUid,
                                                  widget.post!.post.upVoters
                                                      .toList())) {
                                                firestoreBatch.update(
                                                    widget.post!.reference,
                                                    createPostsRecordData(
                                                      post: createPostStruct(
                                                        fieldValues: {
                                                          'upVoters': FieldValue
                                                              .arrayRemove([
                                                            currentUserUid
                                                          ]),
                                                          'netVotes': FieldValue
                                                              .increment(-(1)),
                                                        },
                                                        clearUnsetFields: false,
                                                      ),
                                                    ));
                                                return;
                                              } else {
                                                if (functions.stringInArr(
                                                    currentUserUid,
                                                    widget.post!.post.downVoters
                                                        .toList())) {
                                                  firestoreBatch.update(
                                                      widget.post!.reference,
                                                      createPostsRecordData(
                                                        post: createPostStruct(
                                                          fieldValues: {
                                                            'upVoters':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              currentUserUid
                                                            ]),
                                                            'netVotes':
                                                                FieldValue
                                                                    .increment(
                                                                        2),
                                                            'downVoters':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              currentUserUid
                                                            ]),
                                                          },
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                      ));
                                                } else {
                                                  firestoreBatch.update(
                                                      widget.post!.reference,
                                                      createPostsRecordData(
                                                        post: createPostStruct(
                                                          fieldValues: {
                                                            'upVoters':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              currentUserUid
                                                            ]),
                                                            'netVotes':
                                                                FieldValue
                                                                    .increment(
                                                                        1),
                                                          },
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                      ));
                                                }

                                                return;
                                              }
                                            } finally {
                                              await firestoreBatch.commit();
                                            }
                                          },
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.thumb_down,
                                              color: Colors.white,
                                              size: 30.0,
                                            ),
                                            onPressed: () async {
                                              final firestoreBatch =
                                                  FirebaseFirestore.instance
                                                      .batch();
                                              try {
                                                if (functions.stringInArr(
                                                    currentUserUid,
                                                    widget.post!.post.downVoters
                                                        .toList())) {
                                                  firestoreBatch.update(
                                                      widget.post!.reference,
                                                      createPostsRecordData(
                                                        post: createPostStruct(
                                                          fieldValues: {
                                                            'netVotes':
                                                                FieldValue
                                                                    .increment(
                                                                        1),
                                                            'downVoters':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              currentUserUid
                                                            ]),
                                                          },
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                      ));
                                                  return;
                                                } else {
                                                  if (functions.stringInArr(
                                                      currentUserUid,
                                                      widget.post!.post.upVoters
                                                          .toList())) {
                                                    firestoreBatch.update(
                                                        widget.post!.reference,
                                                        createPostsRecordData(
                                                          post:
                                                              createPostStruct(
                                                            fieldValues: {
                                                              'upVoters': FieldValue
                                                                  .arrayRemove([
                                                                currentUserUid
                                                              ]),
                                                              'netVotes':
                                                                  FieldValue
                                                                      .increment(
                                                                          -(2)),
                                                              'downVoters':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                currentUserUid
                                                              ]),
                                                            },
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                        ));
                                                  } else {
                                                    firestoreBatch.update(
                                                        widget.post!.reference,
                                                        createPostsRecordData(
                                                          post:
                                                              createPostStruct(
                                                            fieldValues: {
                                                              'netVotes':
                                                                  FieldValue
                                                                      .increment(
                                                                          -(1)),
                                                              'downVoters':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                currentUserUid
                                                              ]),
                                                            },
                                                            clearUnsetFields:
                                                                false,
                                                          ),
                                                        ));
                                                  }

                                                  return;
                                                }
                                              } finally {
                                                await firestoreBatch.commit();
                                              }
                                            },
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        if (responsiveVisibility(
          context: context,
          phone: false,
          tablet: false,
        ))
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.goNamed(
                      'singlePost',
                      queryParameters: {
                        'posts': serializeParam(
                          widget.post,
                          ParamType.Document,
                        ),
                      }.withoutNulls,
                      extra: <String, dynamic>{
                        'posts': widget.post,
                      },
                    );
                  },
                  onLongPress: () async {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      useSafeArea: true,
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: HomeCompWidget(
                            post: widget.post!,
                          ),
                        );
                      },
                    ).then((value) => safeSetState(() {}));
                  },
                  child: Container(
                    width: 600.0,
                    height: 600.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 600.0,
                          child: PageView(
                            controller: _model.pageViewController2 ??=
                                PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: OctoImage(
                                  placeholderBuilder: OctoPlaceholder.blurHash(
                                    widget.post!.post.images[0].blurHash,
                                  ),
                                  image: NetworkImage(
                                    widget.post!.post.images[0].image,
                                  ),
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if ((widget.post?.post?.isSpoiler == true) &&
                            (functions.stringInArr(
                                    currentUserUid,
                                    widget.post!.post.spoilerClickers
                                        .toList()) ==
                                false))
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await widget.post!.reference
                                  .update(createPostsRecordData(
                                post: createPostStruct(
                                  fieldValues: {
                                    'spoilerClickers':
                                        FieldValue.arrayUnion([currentUserUid]),
                                  },
                                  clearUnsetFields: false,
                                ),
                              ));
                            },
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFD14181B),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ol4goelh' /* Spoiler */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 20.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.00),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 3.0, 3.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onDoubleTap: () async {
                                    context.pushNamed(
                                      'singlePost',
                                      queryParameters: {
                                        'posts': serializeParam(
                                          widget.post,
                                          ParamType.Document,
                                        ),
                                      }.withoutNulls,
                                      extra: <String, dynamic>{
                                        'posts': widget.post,
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 65.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x6E000000),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 2.0, 2.0, 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 400.0,
                                            height: 60.0,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(1.0, 0.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.00, -1.00),
                                                        child: Container(
                                                          height: 32.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            minWidth: 90.0,
                                                            maxWidth: 200.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x40000000),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        300.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: StreamBuilder<
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
                                                                          .post!
                                                                          .post
                                                                          .isStealth
                                                                      ? 'anon'
                                                                      : widget
                                                                          .post
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<UsersRecord>
                                                                    rowUsersRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                final rowUsersRecord =
                                                                    rowUsersRecordList
                                                                            .isNotEmpty
                                                                        ? rowUsersRecordList
                                                                            .first
                                                                        : null;
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    if (widget
                                                                        .post!
                                                                        .post
                                                                        .isStealth) {
                                                                      return;
                                                                    }

                                                                    context
                                                                        .pushNamed(
                                                                      'Profile',
                                                                      queryParameters:
                                                                          {
                                                                        'userID':
                                                                            serializeParam(
                                                                          rowUsersRecord
                                                                              ?.uid,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            1.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              25.0,
                                                                          height:
                                                                              25.0,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              rowUsersRecord?.photoUrl,
                                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/surf-1-0-7-65fnd5/assets/9cs0t43k77pp/agents.png',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              2.0,
                                                                              0.0,
                                                                              15.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            '@${valueOrDefault<String>(
                                                                              rowUsersRecord?.displayName,
                                                                              'Anonymous',
                                                                            )}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  color: Colors.white,
                                                                                  fontSize: 15.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.00, -1.00),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Container(
                                                            width: 32.0,
                                                            height: 32.0,
                                                            constraints:
                                                                BoxConstraints(
                                                              minWidth: 40.0,
                                                              maxWidth: 90.0,
                                                            ),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x3F000000),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30.0),
                                                            ),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    '${widget.post!.post.netVotes > 0 ? '+' : ' '}${widget.post?.post?.netVotes?.toString()}',
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: valueOrDefault<
                                                                            Color>(
                                                                          () {
                                                                            if (widget.post?.post?.netVotes ==
                                                                                0) {
                                                                              return Colors.white;
                                                                            } else if (widget.post!.post.netVotes >
                                                                                0) {
                                                                              return Color(0xFF21E744);
                                                                            } else {
                                                                              return Color(0xFFE5200B);
                                                                            }
                                                                          }(),
                                                                          Colors
                                                                              .white,
                                                                        ),
                                                                        fontSize:
                                                                            15.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Stack(
                                                    children: [
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        tabletLandscape: false,
                                                        desktop: false,
                                                      ))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      2.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            widget.post!.post
                                                                .caption
                                                                .maybeHandleOverflow(
                                                                    maxChars:
                                                                        50),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      if (responsiveVisibility(
                                                        context: context,
                                                        phone: false,
                                                        tablet: false,
                                                      ))
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      2.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            widget.post!.post
                                                                .caption
                                                                .maybeHandleOverflow(
                                                                    maxChars:
                                                                        50),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      15.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 20.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                if (responsiveVisibility(
                                                  context: context,
                                                  tabletLandscape: false,
                                                  desktop: false,
                                                ))
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 20.0,
                                                      borderWidth: 1.0,
                                                      buttonSize: 40.0,
                                                      icon: Icon(
                                                        Icons.comment_rounded,
                                                        color: Colors.white,
                                                        size: 30.0,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                  ),
                                                FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 20.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.thumb_up,
                                                    color: functions
                                                            .stringInArr(
                                                                currentUserUid,
                                                                widget
                                                                    .post!
                                                                    .post
                                                                    .upVoters
                                                                    .toList())
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : Colors.white,
                                                    size: 30.0,
                                                  ),
                                                  onPressed: () async {
                                                    final firestoreBatch =
                                                        FirebaseFirestore
                                                            .instance
                                                            .batch();
                                                    try {
                                                      if (functions.stringInArr(
                                                          currentUserUid,
                                                          widget.post!.post
                                                              .upVoters
                                                              .toList())) {
                                                        firestoreBatch.update(
                                                            widget.post!
                                                                .reference,
                                                            createPostsRecordData(
                                                              post:
                                                                  createPostStruct(
                                                                fieldValues: {
                                                                  'upVoters':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    currentUserUid
                                                                  ]),
                                                                  'netVotes': FieldValue
                                                                      .increment(
                                                                          -(1)),
                                                                },
                                                                clearUnsetFields:
                                                                    false,
                                                              ),
                                                            ));
                                                      } else {
                                                        if (functions
                                                            .stringInArr(
                                                                currentUserUid,
                                                                widget
                                                                    .post!
                                                                    .post
                                                                    .downVoters
                                                                    .toList())) {
                                                          firestoreBatch.update(
                                                              widget.post!
                                                                  .reference,
                                                              createPostsRecordData(
                                                                post:
                                                                    createPostStruct(
                                                                  fieldValues: {
                                                                    'upVoters':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      currentUserUid
                                                                    ]),
                                                                    'netVotes':
                                                                        FieldValue
                                                                            .increment(2),
                                                                    'downVoters':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      currentUserUid
                                                                    ]),
                                                                  },
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                        } else {
                                                          firestoreBatch.update(
                                                              widget.post!
                                                                  .reference,
                                                              createPostsRecordData(
                                                                post:
                                                                    createPostStruct(
                                                                  fieldValues: {
                                                                    'upVoters':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      currentUserUid
                                                                    ]),
                                                                    'netVotes':
                                                                        FieldValue
                                                                            .increment(1),
                                                                  },
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                        }

                                                        return;
                                                      }
                                                    } finally {
                                                      await firestoreBatch
                                                          .commit();
                                                    }
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.thumb_down,
                                                      color: functions
                                                              .stringInArr(
                                                                  currentUserUid,
                                                                  widget
                                                                      .post!
                                                                      .post
                                                                      .downVoters
                                                                      .toList())
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : Colors.white,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      final firestoreBatch =
                                                          FirebaseFirestore
                                                              .instance
                                                              .batch();
                                                      try {
                                                        if (functions
                                                            .stringInArr(
                                                                currentUserUid,
                                                                widget
                                                                    .post!
                                                                    .post
                                                                    .downVoters
                                                                    .toList())) {
                                                          firestoreBatch.update(
                                                              widget.post!
                                                                  .reference,
                                                              createPostsRecordData(
                                                                post:
                                                                    createPostStruct(
                                                                  fieldValues: {
                                                                    'netVotes':
                                                                        FieldValue
                                                                            .increment(1),
                                                                    'downVoters':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      currentUserUid
                                                                    ]),
                                                                  },
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ));
                                                        } else {
                                                          if (functions.stringInArr(
                                                              currentUserUid,
                                                              widget.post!.post
                                                                  .upVoters
                                                                  .toList())) {
                                                            firestoreBatch
                                                                .update(
                                                                    widget.post!
                                                                        .reference,
                                                                    createPostsRecordData(
                                                                      post:
                                                                          createPostStruct(
                                                                        fieldValues: {
                                                                          'upVoters':
                                                                              FieldValue.arrayRemove([
                                                                            currentUserUid
                                                                          ]),
                                                                          'netVotes':
                                                                              FieldValue.increment(-(2)),
                                                                          'downVoters':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserUid
                                                                          ]),
                                                                        },
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                          } else {
                                                            firestoreBatch
                                                                .update(
                                                                    widget.post!
                                                                        .reference,
                                                                    createPostsRecordData(
                                                                      post:
                                                                          createPostStruct(
                                                                        fieldValues: {
                                                                          'netVotes':
                                                                              FieldValue.increment(-(1)),
                                                                          'downVoters':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserUid
                                                                          ]),
                                                                        },
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                    ));
                                                          }

                                                          return;
                                                        }
                                                      } finally {
                                                        await firestoreBatch
                                                            .commit();
                                                      }
                                                    },
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (widget.isComment)
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                  child: Container(
                    width: 350.0,
                    height: 600.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: StreamBuilder<List<CommentsRecord>>(
                              stream: queryCommentsRecord(
                                queryBuilder: (commentsRecord) =>
                                    commentsRecord.where(
                                  'comment.idReplyTo',
                                  isEqualTo: widget.post?.post?.id,
                                ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<CommentsRecord> columnCommentsRecordList =
                                    snapshot.data!;
                                return SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                            columnCommentsRecordList.length,
                                            (columnIndex) {
                                      final columnCommentsRecord =
                                          columnCommentsRecordList[columnIndex];
                                      return CommentWidget(
                                        key: Key(
                                            'Key6jq_${columnIndex}_of_${columnCommentsRecordList.length}'),
                                        comment: columnCommentsRecord.comment,
                                      );
                                    })
                                        .divide(SizedBox(height: 10.0))
                                        .addToEnd(SizedBox(height: 50.0)),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Divider(
                              thickness: 2.0,
                              indent: 5.0,
                              endIndent: 5.0,
                              color: FlutterFlowTheme.of(context).accent1,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 0.0, 0.0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Container(
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
                                          5.0, 0.0, 0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              valueOrDefault(
                                                  currentUserDocument?.realName,
                                                  ''),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                          AuthUserStreamWidget(
                                            builder: (context) => Text(
                                              '@${currentUserDisplayName}',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
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
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 10.0, 5.0, 5.0),
                                    child: TextFormField(
                                      controller: _model.textController,
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'esfrv6rg' /* Type comment... */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                10.0, 10.0, 10.0, 10.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 14.0,
                                          ),
                                      maxLines: 7,
                                      minLines: 2,
                                      validator: _model.textControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                  if (_model.uploadedFileUrl != null &&
                                      _model.uploadedFileUrl != '')
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 0.0, 5.0, 5.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 240.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Visibility(
                                          visible:
                                              _model.uploadedFileUrl != null &&
                                                  _model.uploadedFileUrl != '',
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: FlutterFlowMediaDisplay(
                                              path: _model.uploadedFileUrl,
                                              imageBuilder: (path) => ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                child: Image.network(
                                                  path,
                                                  width: double.infinity,
                                                  height: 250.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              videoPlayerBuilder: (path) =>
                                                  FlutterFlowVideoPlayer(
                                                path: path,
                                                width: double.infinity,
                                                height: double.infinity,
                                                autoPlay: false,
                                                looping: true,
                                                showControls: true,
                                                allowFullScreen: true,
                                                allowPlaybackSpeedMenu: false,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 5.0, 5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            borderRadius: 20.0,
                                            borderWidth: 3.0,
                                            buttonSize: 35.0,
                                            icon: Icon(
                                              Icons.add,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              size: 20.0,
                                            ),
                                            onPressed: () async {
                                              final selectedMedia =
                                                  await selectMediaWithSourceBottomSheet(
                                                context: context,
                                                allowPhoto: true,
                                                includeBlurHash: true,
                                              );
                                              if (selectedMedia != null &&
                                                  selectedMedia.every((m) =>
                                                      validateFileFormat(
                                                          m.storagePath,
                                                          context))) {
                                                setState(() => _model
                                                    .isDataUploading = true);
                                                var selectedUploadedFiles =
                                                    <FFUploadedFile>[];

                                                var downloadUrls = <String>[];
                                                try {
                                                  selectedUploadedFiles =
                                                      selectedMedia
                                                          .map((m) =>
                                                              FFUploadedFile(
                                                                name: m
                                                                    .storagePath
                                                                    .split('/')
                                                                    .last,
                                                                bytes: m.bytes,
                                                                height: m
                                                                    .dimensions
                                                                    ?.height,
                                                                width: m
                                                                    .dimensions
                                                                    ?.width,
                                                                blurHash:
                                                                    m.blurHash,
                                                              ))
                                                          .toList();

                                                  downloadUrls =
                                                      (await Future.wait(
                                                    selectedMedia.map(
                                                      (m) async =>
                                                          await uploadData(
                                                              m.storagePath,
                                                              m.bytes),
                                                    ),
                                                  ))
                                                          .where(
                                                              (u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                } finally {
                                                  _model.isDataUploading =
                                                      false;
                                                }
                                                if (selectedUploadedFiles
                                                            .length ==
                                                        selectedMedia.length &&
                                                    downloadUrls.length ==
                                                        selectedMedia.length) {
                                                  setState(() {
                                                    _model.uploadedLocalFile =
                                                        selectedUploadedFiles
                                                            .first;
                                                    _model.uploadedFileUrl =
                                                        downloadUrls.first;
                                                  });
                                                } else {
                                                  setState(() {});
                                                  return;
                                                }
                                              }
                                            },
                                          ),
                                        ),
                                        StreamBuilder<List<UsersRecord>>(
                                          stream: queryUsersRecord(
                                            queryBuilder: (usersRecord) =>
                                                usersRecord.where(
                                              'uid',
                                              isEqualTo:
                                                  widget.post?.post?.author,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<UsersRecord>
                                                buttonUsersRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final buttonUsersRecord =
                                                buttonUsersRecordList.isNotEmpty
                                                    ? buttonUsersRecordList
                                                        .first
                                                    : null;
                                            return FFButtonWidget(
                                              onPressed: () async {
                                                final firestoreBatch =
                                                    FirebaseFirestore.instance
                                                        .batch();
                                                try {
                                                  firestoreBatch.update(
                                                      widget.post!.reference,
                                                      createPostsRecordData(
                                                        post: createPostStruct(
                                                          fieldValues: {
                                                            'comments':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              getCommentFirestoreData(
                                                                createCommentStruct(
                                                                  isPostComment:
                                                                      true,
                                                                  idReplyTo:
                                                                      widget
                                                                          .post
                                                                          ?.post
                                                                          ?.id,
                                                                  text: _model
                                                                      .textController
                                                                      .text,
                                                                  authorid:
                                                                      currentUserUid,
                                                                  id: 'C${currentUserUid}RT${widget.post?.post?.id}${widget.post?.post?.comments?.length?.toString()}',
                                                                  timestamp:
                                                                      getCurrentTimestamp,
                                                                  imageHash:
                                                                      createImageHashStruct(
                                                                    image: _model
                                                                        .uploadedFileUrl,
                                                                    blurHash: _model
                                                                        .uploadedLocalFile
                                                                        .blurHash,
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  isStealth: valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isStealth,
                                                                      false),
                                                                  isAuthorStealth: valueOrDefault<
                                                                          bool>(
                                                                      currentUserDocument
                                                                          ?.isStealth,
                                                                      false),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                                true,
                                                              )
                                                            ]),
                                                          },
                                                          clearUnsetFields:
                                                              false,
                                                        ),
                                                      ));

                                                  firestoreBatch.set(
                                                      CommentsRecord.collection
                                                          .doc(),
                                                      createCommentsRecordData(
                                                        comment:
                                                            createCommentStruct(
                                                          isPostComment: true,
                                                          idReplyTo: widget
                                                              .post?.post?.id,
                                                          text: _model
                                                              .textController
                                                              .text,
                                                          authorid:
                                                              currentUserUid,
                                                          timestamp:
                                                              getCurrentTimestamp,
                                                          id: 'C${currentUserUid}RT${widget.post?.post?.id}${widget.post?.post?.comments?.length?.toString()}',
                                                          imageHash:
                                                              createImageHashStruct(
                                                            image: _model
                                                                .uploadedFileUrl,
                                                            blurHash: _model
                                                                .uploadedLocalFile
                                                                .blurHash,
                                                            clearUnsetFields:
                                                                false,
                                                            create: true,
                                                          ),
                                                          isStealth: valueOrDefault<
                                                                  bool>(
                                                              currentUserDocument
                                                                  ?.isStealth,
                                                              false),
                                                          isAuthorStealth:
                                                              valueOrDefault<
                                                                      bool>(
                                                                  currentUserDocument
                                                                      ?.isStealth,
                                                                  false),
                                                          clearUnsetFields:
                                                              false,
                                                          create: true,
                                                        ),
                                                      ));
                                                  if (widget
                                                          .post?.post?.author ==
                                                      currentUserUid) {
                                                    return;
                                                  }

                                                  if (valueOrDefault<bool>(
                                                      currentUserDocument
                                                          ?.isStealth,
                                                      false)) {
                                                    return;
                                                  }

                                                  firestoreBatch.update(
                                                      buttonUsersRecord!
                                                          .reference,
                                                      {
                                                        ...mapToFirestore(
                                                          {
                                                            'notifications':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              getNotificationFirestoreData(
                                                                createNotificationStruct(
                                                                  category: 1,
                                                                  itemID: widget
                                                                      .post
                                                                      ?.post
                                                                      ?.id,
                                                                  time:
                                                                      getCurrentTimestamp,
                                                                  userID:
                                                                      currentUserUid,
                                                                  isMarkedAsRead:
                                                                      false,
                                                                  notifID:
                                                                      'NP${buttonUsersRecord?.notifications?.length?.toString()}',
                                                                  iDUserFrom:
                                                                      currentUserUid,
                                                                  clearUnsetFields:
                                                                      false,
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
                                                        .textController.text,
                                                    notificationImageUrl:
                                                        _model.uploadedFileUrl !=
                                                                    null &&
                                                                _model.uploadedFileUrl !=
                                                                    ''
                                                            ? _model
                                                                .uploadedFileUrl
                                                            : 'null',
                                                    userRefs: [
                                                      buttonUsersRecord!
                                                          .reference
                                                    ],
                                                    initialPageName:
                                                        'singlePost',
                                                    parameterData: {
                                                      'posts': widget.post,
                                                    },
                                                  );
                                                  return;
                                                } finally {
                                                  await firestoreBatch.commit();
                                                }
                                              },
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '80vjetix' /* Post */,
                                              ),
                                              options: FFButtonOptions(
                                                height: 35.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
