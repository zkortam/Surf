import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notification_model.dart';
export 'notification_model.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({
    Key? key,
    required this.notification,
  }) : super(key: key);

  final NotificationStruct? notification;

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  late NotificationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationModel());

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

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                child: StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(
                    queryBuilder: (usersRecord) => usersRecord.where(
                      'uid',
                      isEqualTo: widget.notification?.iDUserFrom,
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
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    List<UsersRecord> circleImageUsersRecordList =
                        snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final circleImageUsersRecord =
                        circleImageUsersRecordList.isNotEmpty
                            ? circleImageUsersRecordList.first
                            : null;
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          'Profile',
                          queryParameters: {
                            'userID': serializeParam(
                              circleImageUsersRecord?.uid,
                              ParamType.String,
                            ),
                          }.withoutNulls,
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                            ),
                          },
                        );
                      },
                      child: Container(
                        width: 45.0,
                        height: 45.0,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          circleImageUsersRecord!.photoUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StreamBuilder<List<UsersRecord>>(
                      stream: queryUsersRecord(
                        queryBuilder: (usersRecord) => usersRecord.where(
                          'uid',
                          isEqualTo: widget.notification?.iDUserFrom,
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
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<UsersRecord> textUsersRecordList = snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        final textUsersRecord = textUsersRecordList.isNotEmpty
                            ? textUsersRecordList.first
                            : null;
                        return InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.goNamed(
                              'Profile',
                              queryParameters: {
                                'userID': serializeParam(
                                  textUsersRecord?.uid,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.fade,
                                ),
                              },
                            );
                          },
                          child: Text(
                            '@${textUsersRecord?.displayName} ${() {
                              if (widget.notification?.category == 0) {
                                return (functions.getFirstletter(
                                            widget.notification!.itemID) ==
                                        'P'
                                    ? 'liked your Post'
                                    : 'liked your Thread');
                              } else if (widget.notification?.category == 1) {
                                return (functions.getFirstletter(
                                            widget.notification!.itemID) ==
                                        'P'
                                    ? 'commented on your Post'
                                    : 'commented on your Thread');
                              } else if (widget.notification?.category == 2) {
                                return 'followed you';
                              } else {
                                return 'unknown';
                              }
                            }()}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  fontSize: 12.0,
                                ),
                          ),
                        );
                      },
                    ),
                    Text(
                      dateTimeFormat(
                        'M/d h:mm a',
                        widget.notification!.time!,
                        locale: FFLocalizations.of(context).languageCode,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Outfit',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 11.0,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          StreamBuilder<List<ThreadRecord>>(
            stream: queryThreadRecord(
              queryBuilder: (threadRecord) => threadRecord.where(
                'thread.id',
                isEqualTo: widget.notification?.itemID,
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
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 50.0,
                    ),
                  ),
                );
              }
              List<ThreadRecord> stackThreadRecordList = snapshot.data!;
              final stackThreadRecord = stackThreadRecordList.isNotEmpty
                  ? stackThreadRecordList.first
                  : null;
              return Stack(
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: FutureBuilder<List<PostsRecord>>(
                      future: queryPostsRecordOnce(
                        queryBuilder: (postsRecord) => postsRecord.where(
                          'post.id',
                          isEqualTo: widget.notification?.itemID,
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
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<PostsRecord> iconButtonPostsRecordList =
                            snapshot.data!;
                        final iconButtonPostsRecord =
                            iconButtonPostsRecordList.isNotEmpty
                                ? iconButtonPostsRecordList.first
                                : null;
                        return FlutterFlowIconButton(
                          borderRadius: 30.0,
                          borderWidth: 0.0,
                          buttonSize: 35.0,
                          fillColor: FlutterFlowTheme.of(context).primary,
                          icon: Icon(
                            Icons.navigate_next,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            if (widget.notification?.category == 0) {
                              return;
                            }

                            if (widget.notification?.category == 1) {
                              if (functions.getFirstletter(
                                      widget.notification!.itemID) ==
                                  'P') {
                                context.pushNamed(
                                  'singlePost',
                                  queryParameters: {
                                    'posts': serializeParam(
                                      iconButtonPostsRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'posts': iconButtonPostsRecord,
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              } else {
                                context.pushNamed(
                                  'singleThread',
                                  queryParameters: {
                                    'thread': serializeParam(
                                      stackThreadRecord,
                                      ParamType.Document,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    'thread': stackThreadRecord,
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              }

                              return;
                            } else {
                              if (widget.notification?.category == 2) {
                                context.pushNamed(
                                  'Profile',
                                  queryParameters: {
                                    'userID': serializeParam(
                                      widget.notification?.itemID,
                                      ParamType.String,
                                    ),
                                  }.withoutNulls,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              }
                              return;
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
