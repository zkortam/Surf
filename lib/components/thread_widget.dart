import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/pcomment_widget.dart';
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
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'thread_model.dart';
export 'thread_model.dart';

class ThreadWidget extends StatefulWidget {
  const ThreadWidget({
    Key? key,
    required this.thread,
    bool? isComment,
    this.isCommentAllowed,
  })  : this.isComment = isComment ?? false,
        super(key: key);

  final ThreadRecord? thread;
  final bool isComment;
  final bool? isCommentAllowed;

  @override
  _ThreadWidgetState createState() => _ThreadWidgetState();
}

class _ThreadWidgetState extends State<ThreadWidget> {
  late ThreadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadModel());

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onLongPress: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              useSafeArea: true,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: ThreadsCompWidget(
                    thread: widget.thread!,
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          child: Container(
            width: 500.0,
            child: Stack(
              children: [
                if (widget.thread?.thread?.isPoll ?? true)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight: 170.0,
                        maxHeight: 1000.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                5.0, 5.0, 5.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: StreamBuilder<List<UsersRecord>>(
                                stream: queryUsersRecord(
                                  queryBuilder: (usersRecord) =>
                                      usersRecord.where(
                                    'uid',
                                    isEqualTo: widget.thread!.thread.isStealth
                                        ? 'anon'
                                        : widget.thread?.thread?.author,
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
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<UsersRecord> rowUsersRecordList =
                                      snapshot.data!;
                                  final rowUsersRecord =
                                      rowUsersRecordList.isNotEmpty
                                          ? rowUsersRecordList.first
                                          : null;
                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              width: 50.0,
                                              height: 50.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  rowUsersRecord?.photoUrl,
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/surf-1-0-7-65fnd5/assets/9cs0t43k77pp/agents.png',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    rowUsersRecord?.realName,
                                                    'Anonymous User',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 16.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                                Text(
                                                  valueOrDefault<String>(
                                                    '${valueOrDefault<String>(
                                                      widget.thread?.thread
                                                                  ?.isStealth ==
                                                              true
                                                          ? '@Anonymous'
                                                          : '@${rowUsersRecord?.displayName}',
                                                      '@Anonymous',
                                                    )}',
                                                    '@Anonymous',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 16.0,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 20.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            '${widget.thread!.thread.netVotes > 0 ? '+' : ' '}${widget.thread?.thread?.netVotes?.toString()}',
                                            '0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color: valueOrDefault<Color>(
                                                  () {
                                                    if (widget.thread?.thread
                                                            ?.netVotes ==
                                                        0) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primaryText;
                                                    } else if (widget.thread!
                                                            .thread.netVotes >
                                                        0) {
                                                      return Color(0xFF21E744);
                                                    } else {
                                                      return Color(0xFFE5200B);
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                                ),
                                                fontSize: 20.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 10.0, 0.0, 0.0),
                              child: Text(
                                widget.thread!.thread.title,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 0.0, 0.0, 0.0),
                              child: Text(
                                dateTimeFormat(
                                  'relative',
                                  widget.thread!.thread.timestamp!,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 13.0,
                                    ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: 500.0,
                              constraints: BoxConstraints(
                                minHeight: 100.0,
                                maxHeight: 400.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                              child: wrapWithModel(
                                model: _model.threadPollModel,
                                updateCallback: () => setState(() {}),
                                updateOnChange: true,
                                child: ThreadPollWidget(
                                  thrad: widget.thread,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 10.0, 5.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.thumb_up,
                                          color: functions.stringInArr(
                                                  currentUserUid,
                                                  widget.thread!.thread.upVoters
                                                      .toList())
                                              ? FlutterFlowTheme.of(context)
                                                  .primary
                                              : FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          size: 28.0,
                                        ),
                                        onPressed: () async {
                                          if (functions.stringInArr(
                                              currentUserUid,
                                              widget.thread!.thread.upVoters
                                                  .toList())) {
                                            await widget.thread!.reference
                                                .update(createThreadRecordData(
                                              thread: createThreadStruct(
                                                fieldValues: {
                                                  'upVoters':
                                                      FieldValue.arrayRemove(
                                                          [currentUserUid]),
                                                  'netVotes':
                                                      FieldValue.increment(
                                                          -(1)),
                                                },
                                                clearUnsetFields: false,
                                              ),
                                            ));
                                            return;
                                          } else {
                                            if (functions.stringInArr(
                                                currentUserUid,
                                                widget.thread!.thread.downVoters
                                                    .toList())) {
                                              await widget.thread!.reference
                                                  .update(
                                                      createThreadRecordData(
                                                thread: createThreadStruct(
                                                  fieldValues: {
                                                    'downVoters':
                                                        FieldValue.arrayRemove(
                                                            [currentUserUid]),
                                                    'upVoters':
                                                        FieldValue.arrayUnion(
                                                            [currentUserUid]),
                                                    'netVotes':
                                                        FieldValue.increment(2),
                                                  },
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            } else {
                                              await widget.thread!.reference
                                                  .update(
                                                      createThreadRecordData(
                                                thread: createThreadStruct(
                                                  fieldValues: {
                                                    'upVoters':
                                                        FieldValue.arrayUnion(
                                                            [currentUserUid]),
                                                    'netVotes':
                                                        FieldValue.increment(1),
                                                  },
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                            }

                                            return;
                                          }
                                        },
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.thumb_down,
                                            color: functions.stringInArr(
                                                    currentUserUid,
                                                    widget.thread!.thread
                                                        .downVoters
                                                        .toList())
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            size: 28.0,
                                          ),
                                          onPressed: () async {
                                            if (functions.stringInArr(
                                                currentUserUid,
                                                widget.thread!.thread.downVoters
                                                    .toList())) {
                                              await widget.thread!.reference
                                                  .update(
                                                      createThreadRecordData(
                                                thread: createThreadStruct(
                                                  fieldValues: {
                                                    'netVotes':
                                                        FieldValue.increment(1),
                                                    'downVoters':
                                                        FieldValue.arrayRemove(
                                                            [currentUserUid]),
                                                  },
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                              return;
                                            } else {
                                              if (functions.stringInArr(
                                                  currentUserUid,
                                                  widget.thread!.thread.upVoters
                                                      .toList())) {
                                                await widget.thread!.reference
                                                    .update(
                                                        createThreadRecordData(
                                                  thread: createThreadStruct(
                                                    fieldValues: {
                                                      'downVoters':
                                                          FieldValue.arrayUnion(
                                                              [currentUserUid]),
                                                      'upVoters': FieldValue
                                                          .arrayRemove(
                                                              [currentUserUid]),
                                                      'netVotes':
                                                          FieldValue.increment(
                                                              -(2)),
                                                    },
                                                    clearUnsetFields: false,
                                                  ),
                                                ));
                                              } else {
                                                await widget.thread!.reference
                                                    .update(
                                                        createThreadRecordData(
                                                  thread: createThreadStruct(
                                                    fieldValues: {
                                                      'netVotes':
                                                          FieldValue.increment(
                                                              -(1)),
                                                      'downVoters':
                                                          FieldValue.arrayUnion(
                                                              [currentUserUid]),
                                                    },
                                                    clearUnsetFields: false,
                                                  ),
                                                ));
                                              }

                                              return;
                                            }
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 0.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.insert_comment,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 28.0,
                                          ),
                                          onPressed: () async {
                                            context.pushNamed(
                                              'singleThread',
                                              queryParameters: {
                                                'thread': serializeParam(
                                                  widget.thread,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'thread': widget.thread,
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if ((widget.isCommentAllowed ?? true) &&
                              responsiveVisibility(
                                context: context,
                                phone: false,
                              ))
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [],
                                  ),
                                ),
                                Divider(
                                  thickness: 3.0,
                                  indent: 5.0,
                                  endIndent: 5.0,
                                  color: FlutterFlowTheme.of(context).accent4,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'vusih4yw' /* Comments */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 5.0, 10.0, 5.0),
                                      child:
                                          StreamBuilder<List<CommentsRecord>>(
                                        stream: queryCommentsRecord(
                                          queryBuilder: (commentsRecord) =>
                                              commentsRecord.where(
                                            'comment.idReplyTo',
                                            isEqualTo:
                                                widget.thread?.thread?.id,
                                          ),
                                          limit: 3,
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
                                          List<CommentsRecord>
                                              columnCommentsRecordList =
                                              snapshot.data!;
                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: List.generate(
                                                  columnCommentsRecordList
                                                      .length, (columnIndex) {
                                                final columnCommentsRecord =
                                                    columnCommentsRecordList[
                                                        columnIndex];
                                                return PcommentWidget(
                                                  key: Key(
                                                      'Keyeuz_${columnIndex}_of_${columnCommentsRecordList.length}'),
                                                  comment: columnCommentsRecord
                                                      .comment,
                                                );
                                              }).divide(SizedBox(height: 4.0)),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    if (widget
                                            .thread?.thread?.comments?.length ==
                                        0)
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 15.0, 10.0, 15.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'zdr888a8' /* No Comments */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                                if (widget.thread!.thread.comments.length > 3)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15.0, 0.0, 10.0, 10.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (widget.thread!.thread.comments
                                                .length >
                                            3)
                                          InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'singleThread',
                                                queryParameters: {
                                                  'thread': serializeParam(
                                                    widget.thread,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'thread': widget.thread,
                                                },
                                              );
                                            },
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ddy1lp3w' /* View More */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontWeight: FontWeight.w600,
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
                    ),
                  ),
                if (!widget.thread!.thread.isPoll)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        minHeight: 170.0,
                        maxHeight: 1000.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 5.0, 5.0, 0.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: StreamBuilder<List<UsersRecord>>(
                                      stream: queryUsersRecord(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.where(
                                          'uid',
                                          isEqualTo: widget
                                                  .thread!.thread.isStealth
                                              ? 'anon'
                                              : widget.thread?.thread?.author,
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
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<UsersRecord> rowUsersRecordList =
                                            snapshot.data!;
                                        final rowUsersRecord =
                                            rowUsersRecordList.isNotEmpty
                                                ? rowUsersRecordList.first
                                                : null;
                                        return Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (widget
                                                    .thread!.thread.isStealth) {
                                                  return;
                                                }

                                                context.pushNamed(
                                                  'Profile',
                                                  queryParameters: {
                                                    'userID': serializeParam(
                                                      rowUsersRecord?.uid,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Image.network(
                                                        valueOrDefault<String>(
                                                          rowUsersRecord
                                                              ?.photoUrl,
                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/surf-1-0-7-65fnd5/assets/9cs0t43k77pp/agents.png',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            rowUsersRecord
                                                                ?.realName,
                                                            'Anonymous ',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 16.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            widget
                                                                        .thread
                                                                        ?.thread
                                                                        ?.isStealth ==
                                                                    true
                                                                ? '@Anonymous'
                                                                : '@${rowUsersRecord?.displayName}',
                                                            '@Anonymous',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                fontSize: 15.0,
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
                                                      0.0, 0.0, 20.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  '${widget.thread!.thread.netVotes > 0 ? '+' : ' '}${widget.thread?.thread?.netVotes?.toString()}',
                                                  '0',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      fontFamily: 'Outfit',
                                                      color:
                                                          valueOrDefault<Color>(
                                                        () {
                                                          if (widget
                                                                  .thread
                                                                  ?.thread
                                                                  ?.netVotes ==
                                                              0) {
                                                            return FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText;
                                                          } else if (widget
                                                                  .thread!
                                                                  .thread
                                                                  .netVotes >
                                                              0) {
                                                            return Color(
                                                                0xFF21E744);
                                                          } else {
                                                            return Color(
                                                                0xFFE5200B);
                                                          }
                                                        }(),
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                      ),
                                                      fontSize: 20.0,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 4.0, 0.0, 0.0),
                                    child: Text(
                                      widget.thread!.thread.title,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 17.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 4.0),
                                    child: Text(
                                      dateTimeFormat(
                                        'relative',
                                        widget.thread!.thread.timestamp!,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 12.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Stack(
                                  children: [
                                    if (functions.getStringLength(
                                            widget.thread!.thread.text) <=
                                        750)
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.00, 0.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: SelectionArea(
                                              child: AutoSizeText(
                                            widget.thread!.thread.text
                                                .maybeHandleOverflow(
                                                    maxChars: 900),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 14.0,
                                                ),
                                          )),
                                        ),
                                      ),
                                    if (valueOrDefault<bool>(
                                      functions.getStringLength(
                                              widget.thread!.thread.text) >
                                          750,
                                      true,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 5.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height:
                                                      functions.getStringLength(
                                                                  widget
                                                                      .thread!
                                                                      .thread
                                                                      .summary) >
                                                              5
                                                          ? 154.0
                                                          : 250.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          widget.thread!.thread
                                                              .text,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              if (functions.getStringLength(
                                                      widget.thread!.thread
                                                          .summary) >
                                                  5)
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 85.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      3.0,
                                                                      3.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .auto_awesome_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 15.0,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Text(
                                                                  FFLocalizations.of(
                                                                          context)
                                                                      .getText(
                                                                    'imjvjmzx' /* Summary */,
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        fontSize:
                                                                            14.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height: 62.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                              child:
                                                                  SingleChildScrollView(
                                                                primary: false,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          3.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: SelectionArea(
                                                                          child: Text(
                                                                        widget
                                                                            .thread!
                                                                            .thread
                                                                            .summary,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              fontSize: 12.0,
                                                                            ),
                                                                      )),
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
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  3.0, 0.0, 5.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 160.0,
                                    height: 45.0,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2.0, 0.0, 5.0, 0.0),
                                          child: Stack(
                                            children: [
                                              if (widget.thread?.thread?.link !=
                                                      null &&
                                                  widget.thread?.thread?.link !=
                                                      '')
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                ThreadsLinkWidget(
                                                              link: widget
                                                                  .thread
                                                                  ?.thread
                                                                  ?.link,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'syqe9c88' /* Link */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 110.0,
                                                      height: 37.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFFDA721A),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                  ),
                                                ),
                                              if (widget.thread!.thread.hashtags
                                                      .length >
                                                  0)
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                ThreadsHashtagsWidget(
                                                              hashtags: functions
                                                                  .listToString(widget
                                                                      .thread!
                                                                      .thread
                                                                      .hashtags
                                                                      .toList()),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      '82dxbpkx' /* Hashtags */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 110.0,
                                                      height: 37.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFF284EFB),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                  ),
                                                ),
                                              if ((widget.thread?.thread
                                                              ?.link !=
                                                          null &&
                                                      widget.thread?.thread
                                                              ?.link !=
                                                          '') &&
                                                  (widget.thread!.thread
                                                          .hashtags.length >
                                                      0))
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.00, 0.00),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                ThreadsMoreWidget(
                                                              hashtags: functions
                                                                  .listToString(widget
                                                                      .thread!
                                                                      .thread
                                                                      .hashtags
                                                                      .toList()),
                                                              link: widget
                                                                  .thread!
                                                                  .thread
                                                                  .link,
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'g6zoo1sh' /* More */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 110.0,
                                                      height: 37.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25.0),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        if (widget
                                                .thread?.thread?.isPolitical ==
                                            true)
                                          Stack(
                                            children: [
                                              if (widget.thread?.thread
                                                      ?.politicalPosition ==
                                                  -1)
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 37.0,
                                                  fillColor: Color(0xFF284EFB),
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.dove,
                                                    color: Colors.white,
                                                    size: 17.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'Liberal pressed ...');
                                                  },
                                                ),
                                              if (widget.thread?.thread
                                                      ?.politicalPosition ==
                                                  0)
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  buttonSize: 37.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  icon: Icon(
                                                    Icons.center_focus_strong,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 17.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'Centrist pressed ...');
                                                  },
                                                ),
                                              if (widget.thread?.thread
                                                      ?.politicalPosition ==
                                                  1)
                                                FlutterFlowIconButton(
                                                  borderRadius: 20.0,
                                                  borderWidth: 0.0,
                                                  buttonSize: 37.0,
                                                  fillColor: Color(0xFFE5200B),
                                                  icon: Icon(
                                                    Icons
                                                        .local_fire_department_outlined,
                                                    color: Colors.white,
                                                    size: 17.0,
                                                  ),
                                                  onPressed: () {
                                                    print(
                                                        'Conservative pressed ...');
                                                  },
                                                ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 160.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.thumb_up,
                                            color: functions.stringInArr(
                                                    currentUserUid,
                                                    widget
                                                        .thread!.thread.upVoters
                                                        .toList())
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            size: 28.0,
                                          ),
                                          onPressed: () async {
                                            if (functions.stringInArr(
                                                currentUserUid,
                                                widget.thread!.thread.upVoters
                                                    .toList())) {
                                              await widget.thread!.reference
                                                  .update(
                                                      createThreadRecordData(
                                                thread: createThreadStruct(
                                                  fieldValues: {
                                                    'upVoters':
                                                        FieldValue.arrayRemove(
                                                            [currentUserUid]),
                                                    'netVotes':
                                                        FieldValue.increment(
                                                            -(1)),
                                                  },
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                              return;
                                            } else {
                                              if (functions.stringInArr(
                                                  currentUserUid,
                                                  widget
                                                      .thread!.thread.downVoters
                                                      .toList())) {
                                                await widget.thread!.reference
                                                    .update(
                                                        createThreadRecordData(
                                                  thread: createThreadStruct(
                                                    fieldValues: {
                                                      'downVoters': FieldValue
                                                          .arrayRemove(
                                                              [currentUserUid]),
                                                      'upVoters':
                                                          FieldValue.arrayUnion(
                                                              [currentUserUid]),
                                                      'netVotes':
                                                          FieldValue.increment(
                                                              2),
                                                    },
                                                    clearUnsetFields: false,
                                                  ),
                                                ));
                                              } else {
                                                await widget.thread!.reference
                                                    .update(
                                                        createThreadRecordData(
                                                  thread: createThreadStruct(
                                                    fieldValues: {
                                                      'upVoters':
                                                          FieldValue.arrayUnion(
                                                              [currentUserUid]),
                                                      'netVotes':
                                                          FieldValue.increment(
                                                              1),
                                                    },
                                                    clearUnsetFields: false,
                                                  ),
                                                ));
                                              }

                                              return;
                                            }
                                          },
                                        ),
                                        FlutterFlowIconButton(
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          icon: Icon(
                                            Icons.thumb_down,
                                            color: functions.stringInArr(
                                                    currentUserUid,
                                                    widget.thread!.thread
                                                        .downVoters
                                                        .toList())
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            size: 28.0,
                                          ),
                                          onPressed: () async {
                                            if (functions.stringInArr(
                                                currentUserUid,
                                                widget.thread!.thread.downVoters
                                                    .toList())) {
                                              await widget.thread!.reference
                                                  .update(
                                                      createThreadRecordData(
                                                thread: createThreadStruct(
                                                  fieldValues: {
                                                    'netVotes':
                                                        FieldValue.increment(1),
                                                    'downVoters':
                                                        FieldValue.arrayRemove(
                                                            [currentUserUid]),
                                                  },
                                                  clearUnsetFields: false,
                                                ),
                                              ));
                                              return;
                                            } else {
                                              if (functions.stringInArr(
                                                  currentUserUid,
                                                  widget.thread!.thread.upVoters
                                                      .toList())) {
                                                await widget.thread!.reference
                                                    .update(
                                                        createThreadRecordData(
                                                  thread: createThreadStruct(
                                                    fieldValues: {
                                                      'downVoters':
                                                          FieldValue.arrayUnion(
                                                              [currentUserUid]),
                                                      'upVoters': FieldValue
                                                          .arrayRemove(
                                                              [currentUserUid]),
                                                      'netVotes':
                                                          FieldValue.increment(
                                                              -(2)),
                                                    },
                                                    clearUnsetFields: false,
                                                  ),
                                                ));
                                              } else {
                                                await widget.thread!.reference
                                                    .update(
                                                        createThreadRecordData(
                                                  thread: createThreadStruct(
                                                    fieldValues: {
                                                      'netVotes':
                                                          FieldValue.increment(
                                                              -(1)),
                                                      'downVoters':
                                                          FieldValue.arrayUnion(
                                                              [currentUserUid]),
                                                    },
                                                    clearUnsetFields: false,
                                                  ),
                                                ));
                                              }

                                              return;
                                            }
                                          },
                                        ),
                                        if (!widget.isComment)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 3.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderRadius: 20.0,
                                              borderWidth: 1.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons.insert_comment,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 28.0,
                                              ),
                                              onPressed: () async {
                                                context.pushNamed(
                                                  'singleThread',
                                                  queryParameters: {
                                                    'thread': serializeParam(
                                                      widget.thread,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'thread': widget.thread,
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if ((widget.isCommentAllowed ?? true) &&
                                responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 3.0,
                                    indent: 5.0,
                                    endIndent: 5.0,
                                    color: FlutterFlowTheme.of(context).accent4,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'movuj9ci' /* Comments */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 5.0, 10.0, 5.0),
                                        child:
                                            StreamBuilder<List<CommentsRecord>>(
                                          stream: queryCommentsRecord(
                                            queryBuilder: (commentsRecord) =>
                                                commentsRecord.where(
                                              'comment.idReplyTo',
                                              isEqualTo:
                                                  widget.thread?.thread?.id,
                                            ),
                                            limit: 3,
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
                                            List<CommentsRecord>
                                                columnCommentsRecordList =
                                                snapshot.data!;
                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: List.generate(
                                                    columnCommentsRecordList
                                                        .length, (columnIndex) {
                                                  final columnCommentsRecord =
                                                      columnCommentsRecordList[
                                                          columnIndex];
                                                  return PcommentWidget(
                                                    key: Key(
                                                        'Keyt4v_${columnIndex}_of_${columnCommentsRecordList.length}'),
                                                    comment:
                                                        columnCommentsRecord
                                                            .comment,
                                                  );
                                                }).divide(
                                                    SizedBox(height: 4.0)),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      if (widget.thread?.thread?.comments
                                              ?.length ==
                                          0)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 15.0, 10.0, 15.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '7ctqfvsp' /* No Comments */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                  if (widget.thread!.thread.comments.length > 3)
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 10.0, 15.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (widget.thread!.thread.comments
                                                  .length >
                                              3)
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'singleThread',
                                                  queryParameters: {
                                                    'thread': serializeParam(
                                                      widget.thread,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'thread': widget.thread,
                                                  },
                                                );
                                              },
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'xn3i0ay4' /* View More */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
