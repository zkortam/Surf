import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/p_c_nav_bar_widget.dart';
import '/components/view_image_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chats_page_model.dart';
export 'chats_page_model.dart';

class ChatsPageWidget extends StatefulWidget {
  const ChatsPageWidget({
    Key? key,
    this.userName,
    this.email,
    this.chatUser,
    this.userRef,
    this.userProfile,
    required this.userb,
    required this.usera,
  }) : super(key: key);

  final String? userName;
  final String? email;
  final DocumentReference? chatUser;
  final DocumentReference? userRef;
  final String? userProfile;
  final DocumentReference? userb;
  final DocumentReference? usera;

  @override
  _ChatsPageWidgetState createState() => _ChatsPageWidgetState();
}

class _ChatsPageWidgetState extends State<ChatsPageWidget> {
  late ChatsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatsPageModel());

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

    return StreamBuilder<List<ChatsRecord>>(
      stream: queryChatsRecord(
        queryBuilder: (chatsRecord) => chatsRecord
            .where(
              'user_a',
              isEqualTo: widget.usera,
            )
            .where(
              'user_b',
              isEqualTo: widget.userb,
            )
            .orderBy('last_message_time'),
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
        List<ChatsRecord> chatsPageChatsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final chatsPageChatsRecord = chatsPageChatsRecordList.isNotEmpty
            ? chatsPageChatsRecordList.first
            : null;
        return Title(
            title: 'chatsPage',
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
                  child: StreamBuilder<List<UsersRecord>>(
                    stream: queryUsersRecord(
                      queryBuilder: (usersRecord) => usersRecord.where(
                        'uid',
                        isEqualTo: functions
                                    .detwhichchatuser(currentUserReference!,
                                        chatsPageChatsRecord!)
                                    .toString() ==
                                '1'
                            ? chatsPageChatsRecord?.userB?.id
                            : chatsPageChatsRecord?.userA?.id,
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
                      List<UsersRecord> rowUsersRecordList = snapshot.data!;
                      final rowUsersRecord = rowUsersRecordList.isNotEmpty
                          ? rowUsersRecordList.first
                          : null;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.pCNavBarModel,
                            updateCallback: () => setState(() {}),
                            child: PCNavBarWidget(
                              currentPage: 3,
                            ),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: StreamBuilder<List<ChatsRecord>>(
                                stream: queryChatsRecord(),
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
                                  List<ChatsRecord> containerChatsRecordList =
                                      snapshot.data!;
                                  return Container(
                                    width: 250.0,
                                    height: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'otbxcz7i' /* Recents */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        fontSize: 18.0,
                                                      ),
                                            ),
                                          ],
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 12.0, 20.0, 24.0),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Builder(
                                                    builder: (context) {
                                                      final userschats = functions
                                                          .decideChatstoLoad(
                                                              containerChatsRecordList
                                                                  .toList(),
                                                              currentUserReference!)
                                                          .toList();
                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            userschats.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 20.0),
                                                        itemBuilder: (context,
                                                            userschatsIndex) {
                                                          final userschatsItem =
                                                              userschats[
                                                                  userschatsIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: FutureBuilder<
                                                                List<
                                                                    UsersRecord>>(
                                                              future:
                                                                  queryUsersRecordOnce(
                                                                queryBuilder:
                                                                    (usersRecord) =>
                                                                        usersRecord
                                                                            .where(
                                                                  'uid',
                                                                  isEqualTo: functions
                                                                              .detwhichchatuser(currentUserReference!,
                                                                                  userschatsItem)
                                                                              .toString() ==
                                                                          '1'
                                                                      ? userschatsItem
                                                                          .userB
                                                                          ?.id
                                                                      : userschatsItem.userA?.id !=
                                                                              ''
                                                                          ? functions.detwhichchatuser(currentUserReference!, userschatsItem).toString() == '1'
                                                                              ? userschatsItem.userB?.id
                                                                              : userschatsItem.userA?.id
                                                                          : null,
                                                                  isNull: (functions.detwhichchatuser(currentUserReference!, userschatsItem).toString() ==
                                                                              '1'
                                                                          ? userschatsItem
                                                                              .userB
                                                                              ?.id
                                                                          : userschatsItem.userA?.id != ''
                                                                              ? functions.detwhichchatuser(currentUserReference!, userschatsItem).toString() == '1'
                                                                                  ? userschatsItem.userB?.id
                                                                                  : userschatsItem.userA?.id
                                                                              : null) ==
                                                                      null,
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
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
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
                                                                    context
                                                                        .goNamed(
                                                                      'chats_page',
                                                                      queryParameters:
                                                                          {
                                                                        'email':
                                                                            serializeParam(
                                                                          rowUsersRecord
                                                                              ?.email,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'chatUser':
                                                                            serializeParam(
                                                                          userschatsItem
                                                                              .reference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                        'userRef':
                                                                            serializeParam(
                                                                          currentUserReference,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                        'userProfile':
                                                                            serializeParam(
                                                                          rowUsersRecord
                                                                              ?.photoUrl,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'userName':
                                                                            serializeParam(
                                                                          '',
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'userb':
                                                                            serializeParam(
                                                                          userschatsItem
                                                                              .userB,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                        'usera':
                                                                            serializeParam(
                                                                          userschatsItem
                                                                              .userA,
                                                                          ParamType
                                                                              .DocumentReference,
                                                                        ),
                                                                      }.withoutNulls,
                                                                      extra: <String,
                                                                          dynamic>{
                                                                        kTransitionInfoKey:
                                                                            TransitionInfo(
                                                                          hasTransition:
                                                                              true,
                                                                          transitionType:
                                                                              PageTransitionType.fade,
                                                                        ),
                                                                      },
                                                                    );

                                                                    await userschatsItem
                                                                        .reference
                                                                        .update(
                                                                            createChatsRecordData(
                                                                      messageSeen:
                                                                          true,
                                                                    ));
                                                                  },
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
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                60.0,
                                                                            height:
                                                                                60.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              rowUsersRecord!.photoUrl,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  rowUsersRecord!.displayName,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    '${userschatsItem.lastMessageSenderId == currentUserUid ? 'You: ' : '‎'}${userschatsItem.lastMessage != null && userschatsItem.lastMessage != '' ? userschatsItem.lastMessage : 'sent a photo'}'.maybeHandleOverflow(
                                                                                      maxChars: 30,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    maxLines: 2,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: Color(0xFF828282),
                                                                                          fontSize: 12.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 5.0),
                                                                                  child: Text(
                                                                                    dateTimeFormat(
                                                                                      'relative',
                                                                                      userschatsItem.lastMessageTime!,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: Color(0xFF828282),
                                                                                          fontSize: 12.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          if (userschatsItem.messageSeen ==
                                                                              false)
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.check_sharp,
                                                                                color: Color(0xFFBDBDBD),
                                                                                size: 18.0,
                                                                              ),
                                                                            ),
                                                                          if (userschatsItem.messageSeen ==
                                                                              true)
                                                                            Icon(
                                                                              Icons.check_circle,
                                                                              color: Color(0xFF5780F7),
                                                                              size: 22.0,
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
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
                          Flexible(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Container(
                                      width: 800.0,
                                      height: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10.0, 15.0,
                                                          10.0, 0.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 60.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'chat_main',
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          kTransitionInfoKey:
                                                                              TransitionInfo(
                                                                            hasTransition:
                                                                                true,
                                                                            transitionType:
                                                                                PageTransitionType.fade,
                                                                          ),
                                                                        },
                                                                      );
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .arrow_back,
                                                                      color: Color(
                                                                          0xFFBDBDBD),
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          42.0,
                                                                      height:
                                                                          42.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        rowUsersRecord!
                                                                            .photoUrl,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              6.0),
                                                                          child:
                                                                              StreamBuilder<List<UsersRecord>>(
                                                                            stream:
                                                                                queryUsersRecord(
                                                                              queryBuilder: (usersRecord) => usersRecord.where(
                                                                                'uid',
                                                                                isEqualTo: chatsPageChatsRecord?.userB?.id,
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
                                                                                    child: SpinKitRipple(
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
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
                                                                              final textUsersRecord = textUsersRecordList.isNotEmpty ? textUsersRecordList.first : null;
                                                                              return InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
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
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    rowUsersRecord?.displayName,
                                                                                    'NA',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Outfit',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              6.0),
                                                                          child:
                                                                              Text(
                                                                            dateTimeFormat(
                                                                              'MMMMEEEEd',
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Outfit',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 11.0,
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
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 16.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          StreamBuilder<
                                                              List<
                                                                  ChatMessagesRecord>>(
                                                            stream: _model
                                                                .loadmessages(
                                                              requestFn: () =>
                                                                  queryChatMessagesRecord(
                                                                queryBuilder: (chatMessagesRecord) =>
                                                                    chatMessagesRecord
                                                                        .where(
                                                                          'chat_user',
                                                                          isEqualTo:
                                                                              widget.chatUser,
                                                                        )
                                                                        .orderBy(
                                                                            'timestamp'),
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        SpinKitRipple(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<ChatMessagesRecord>
                                                                  listViewChatMessagesRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              return ListView
                                                                  .builder(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listViewChatMessagesRecordList
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        listViewIndex) {
                                                                  final listViewChatMessagesRecord =
                                                                      listViewChatMessagesRecordList[
                                                                          listViewIndex];
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      if ((listViewChatMessagesRecord.user !=
                                                                              currentUserReference) &&
                                                                          (listViewChatMessagesRecord.image != null &&
                                                                              listViewChatMessagesRecord.image != ''))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                width: 36.0,
                                                                                height: 36.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  rowUsersRecord!.photoUrl,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: ViewImageWidget(
                                                                                            image: listViewChatMessagesRecord.image,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                },
                                                                                child: Stack(
                                                                                  children: [
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                    ))
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 330.0,
                                                                                          height: 230.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            image: DecorationImage(
                                                                                              fit: BoxFit.cover,
                                                                                              image: Image.network(
                                                                                                listViewChatMessagesRecord.image,
                                                                                              ).image,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(24.0),
                                                                                              bottomRight: Radius.circular(24.0),
                                                                                              topLeft: Radius.circular(3.0),
                                                                                              topRight: Radius.circular(24.0),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      tabletLandscape: false,
                                                                                      desktop: false,
                                                                                    ))
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          width: 260.0,
                                                                                          height: 180.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            image: DecorationImage(
                                                                                              fit: BoxFit.cover,
                                                                                              image: Image.network(
                                                                                                listViewChatMessagesRecord.image,
                                                                                              ).image,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(24.0),
                                                                                              bottomRight: Radius.circular(24.0),
                                                                                              topLeft: Radius.circular(3.0),
                                                                                              topRight: Radius.circular(24.0),
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
                                                                      if ((listViewChatMessagesRecord.user ==
                                                                              currentUserReference) &&
                                                                          (listViewChatMessagesRecord.image != null &&
                                                                              listViewChatMessagesRecord.image != ''))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  await showModalBottomSheet(
                                                                                    isScrollControlled: true,
                                                                                    backgroundColor: Colors.transparent,
                                                                                    enableDrag: false,
                                                                                    context: context,
                                                                                    builder: (context) {
                                                                                      return GestureDetector(
                                                                                        onTap: () => _model.unfocusNode.canRequestFocus ? FocusScope.of(context).requestFocus(_model.unfocusNode) : FocusScope.of(context).unfocus(),
                                                                                        child: Padding(
                                                                                          padding: MediaQuery.viewInsetsOf(context),
                                                                                          child: ViewImageWidget(
                                                                                            image: listViewChatMessagesRecord.image,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ).then((value) => safeSetState(() {}));
                                                                                },
                                                                                child: Stack(
                                                                                  children: [
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      phone: false,
                                                                                      tablet: false,
                                                                                    ))
                                                                                      Container(
                                                                                        width: 330.0,
                                                                                        height: 230.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          image: DecorationImage(
                                                                                            fit: BoxFit.cover,
                                                                                            image: Image.network(
                                                                                              listViewChatMessagesRecord.image,
                                                                                            ).image,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(24.0),
                                                                                            bottomRight: Radius.circular(24.0),
                                                                                            topLeft: Radius.circular(24.0),
                                                                                            topRight: Radius.circular(3.0),
                                                                                          ),
                                                                                        ),
                                                                                        child: Stack(
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.90, 0.85),
                                                                                              child: FaIcon(
                                                                                                FontAwesomeIcons.check,
                                                                                                color: Colors.white,
                                                                                                size: 16.0,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    if (responsiveVisibility(
                                                                                      context: context,
                                                                                      tabletLandscape: false,
                                                                                      desktop: false,
                                                                                    ))
                                                                                      Container(
                                                                                        width: 260.0,
                                                                                        height: 180.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          image: DecorationImage(
                                                                                            fit: BoxFit.cover,
                                                                                            image: Image.network(
                                                                                              listViewChatMessagesRecord.image,
                                                                                            ).image,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(24.0),
                                                                                            bottomRight: Radius.circular(24.0),
                                                                                            topLeft: Radius.circular(24.0),
                                                                                            topRight: Radius.circular(3.0),
                                                                                          ),
                                                                                        ),
                                                                                        child: Stack(
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.90, 0.85),
                                                                                              child: FaIcon(
                                                                                                FontAwesomeIcons.check,
                                                                                                color: Colors.white,
                                                                                                size: 16.0,
                                                                                              ),
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
                                                                      if ((listViewChatMessagesRecord.user !=
                                                                              currentUserReference) &&
                                                                          (listViewChatMessagesRecord.text != null &&
                                                                              listViewChatMessagesRecord.text != ''))
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Container(
                                                                                width: 36.0,
                                                                                height: 36.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  widget.userProfile!,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              Stack(
                                                                                children: [
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    phone: false,
                                                                                    tablet: false,
                                                                                  ))
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 310.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(24.0),
                                                                                            bottomRight: Radius.circular(24.0),
                                                                                            topLeft: Radius.circular(3.0),
                                                                                            topRight: Radius.circular(24.0),
                                                                                          ),
                                                                                          border: Border.all(
                                                                                            color: Color(0xFF828282),
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 160.0,
                                                                                                    constraints: BoxConstraints(
                                                                                                      maxWidth: 260.0,
                                                                                                    ),
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    ),
                                                                                                    child: Text(
                                                                                                      listViewChatMessagesRecord.text,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Outfit',
                                                                                                            color: Color(0xFF828282),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    dateTimeFormat(
                                                                                                      'jm',
                                                                                                      listViewChatMessagesRecord.timestamp!,
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Outfit',
                                                                                                          color: Color(0xFFE0E0E0),
                                                                                                          fontSize: 12.0,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    tabletLandscape: false,
                                                                                    desktop: false,
                                                                                  ))
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 260.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.only(
                                                                                            bottomLeft: Radius.circular(24.0),
                                                                                            bottomRight: Radius.circular(24.0),
                                                                                            topLeft: Radius.circular(3.0),
                                                                                            topRight: Radius.circular(24.0),
                                                                                          ),
                                                                                          border: Border.all(
                                                                                            color: Color(0xFF828282),
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 160.0,
                                                                                                    constraints: BoxConstraints(
                                                                                                      maxWidth: 260.0,
                                                                                                    ),
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    ),
                                                                                                    child: Text(
                                                                                                      listViewChatMessagesRecord.text,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Outfit',
                                                                                                            color: Color(0xFF828282),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    dateTimeFormat(
                                                                                                      'jm',
                                                                                                      listViewChatMessagesRecord.timestamp!,
                                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Outfit',
                                                                                                          color: Color(0xFFE0E0E0),
                                                                                                          fontSize: 12.0,
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
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      if (listViewChatMessagesRecord
                                                                              .user ==
                                                                          widget
                                                                              .userRef)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              24.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Stack(
                                                                                children: [
                                                                                  if ((listViewChatMessagesRecord.text != null && listViewChatMessagesRecord.text != '') &&
                                                                                      responsiveVisibility(
                                                                                        context: context,
                                                                                        phone: false,
                                                                                        tablet: false,
                                                                                      ))
                                                                                    Container(
                                                                                      width: 310.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFFEBF0FE),
                                                                                        borderRadius: BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(24.0),
                                                                                          bottomRight: Radius.circular(24.0),
                                                                                          topLeft: Radius.circular(24.0),
                                                                                          topRight: Radius.circular(3.0),
                                                                                        ),
                                                                                        border: Border.all(
                                                                                          color: Color(0xFF5780F7),
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                          children: [
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 160.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Text(
                                                                                                    listViewChatMessagesRecord.text,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Outfit',
                                                                                                          color: Color(0xFF5780F7),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      dateTimeFormat(
                                                                                                        'jm',
                                                                                                        listViewChatMessagesRecord.timestamp!,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Outfit',
                                                                                                            color: Color(0x9A5780F7),
                                                                                                            fontSize: 12.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      if (chatsPageChatsRecord?.messageSeen ?? true)
                                                                                                        FaIcon(
                                                                                                          FontAwesomeIcons.checkDouble,
                                                                                                          color: Color(0xFF5780F7),
                                                                                                          size: 16.0,
                                                                                                        ),
                                                                                                      if (!chatsPageChatsRecord!.messageSeen)
                                                                                                        FaIcon(
                                                                                                          FontAwesomeIcons.check,
                                                                                                          color: Color(0xFFBDBDBD),
                                                                                                          size: 16.0,
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
                                                                                  if ((listViewChatMessagesRecord.text != null && listViewChatMessagesRecord.text != '') &&
                                                                                      responsiveVisibility(
                                                                                        context: context,
                                                                                        tabletLandscape: false,
                                                                                        desktop: false,
                                                                                      ))
                                                                                    Container(
                                                                                      width: 260.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFFEBF0FE),
                                                                                        borderRadius: BorderRadius.only(
                                                                                          bottomLeft: Radius.circular(24.0),
                                                                                          bottomRight: Radius.circular(24.0),
                                                                                          topLeft: Radius.circular(24.0),
                                                                                          topRight: Radius.circular(3.0),
                                                                                        ),
                                                                                        border: Border.all(
                                                                                          color: Color(0xFF5780F7),
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                          children: [
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 160.0,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Text(
                                                                                                    listViewChatMessagesRecord.text,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: 'Outfit',
                                                                                                          color: Color(0xFF5780F7),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      dateTimeFormat(
                                                                                                        'jm',
                                                                                                        listViewChatMessagesRecord.timestamp!,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'Outfit',
                                                                                                            color: Color(0x9A5780F7),
                                                                                                            fontSize: 12.0,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      if (chatsPageChatsRecord?.messageSeen ?? true)
                                                                                                        FaIcon(
                                                                                                          FontAwesomeIcons.checkDouble,
                                                                                                          color: Color(0xFF5780F7),
                                                                                                          size: 16.0,
                                                                                                        ),
                                                                                                      if (!chatsPageChatsRecord!.messageSeen)
                                                                                                        FaIcon(
                                                                                                          FontAwesomeIcons.check,
                                                                                                          color: Color(0xFFBDBDBD),
                                                                                                          size: 16.0,
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
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    21.0, 0.0, 20.0, 24.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.00, 0.00),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              height: 45.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            50.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          TextFormField(
                                                                        controller:
                                                                            _model.textController,
                                                                        focusNode:
                                                                            _model.textFieldFocusNode,
                                                                        onFieldSubmitted:
                                                                            (_) async {
                                                                          if (_model.textController.text != null &&
                                                                              _model.textController.text != '') {
                                                                            await ChatMessagesRecord.collection.doc().set(createChatMessagesRecordData(
                                                                                  user: currentUserReference,
                                                                                  chatUser: widget.chatUser,
                                                                                  text: _model.textController.text,
                                                                                  timestamp: getCurrentTimestamp,
                                                                                  image: _model.uploadedFileUrl,
                                                                                ));

                                                                            await chatsPageChatsRecord!.reference.update(createChatsRecordData(
                                                                              lastMessage: _model.textController.text,
                                                                              lastMessageTime: getCurrentTimestamp,
                                                                              lastMessageSenderId: currentUserUid,
                                                                            ));
                                                                            setState(() {
                                                                              _model.textController?.clear();
                                                                            });
                                                                          }
                                                                        },
                                                                        autofocus:
                                                                            true,
                                                                        obscureText:
                                                                            false,
                                                                        decoration:
                                                                            InputDecoration(
                                                                          hintText:
                                                                              FFLocalizations.of(context).getText(
                                                                            'x8rf5unw' /* Type something... */,
                                                                          ),
                                                                          hintStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFFBDBDBD),
                                                                              ),
                                                                          enabledBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          focusedBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          errorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          focusedErrorBorder:
                                                                              UnderlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Color(0x00000000),
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              topLeft: Radius.circular(4.0),
                                                                              topRight: Radius.circular(4.0),
                                                                            ),
                                                                          ),
                                                                          contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium,
                                                                        validator: _model
                                                                            .textControllerValidator
                                                                            .asValidator(context),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          24.0,
                                                                      child:
                                                                          VerticalDivider(
                                                                        thickness:
                                                                            1.0,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          2.0,
                                                                          0.0,
                                                                          0.0,
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
                                                                          final firestoreBatch = FirebaseFirestore
                                                                              .instance
                                                                              .batch();
                                                                          try {
                                                                            final selectedMedia =
                                                                                await selectMedia(
                                                                              maxWidth: 300.00,
                                                                              maxHeight: 300.00,
                                                                              imageQuality: 50,
                                                                              mediaSource: MediaSource.photoGallery,
                                                                              multiImage: false,
                                                                            );
                                                                            if (selectedMedia != null &&
                                                                                selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                              setState(() => _model.isDataUploading = true);
                                                                              var selectedUploadedFiles = <FFUploadedFile>[];

                                                                              var downloadUrls = <String>[];
                                                                              try {
                                                                                showUploadMessage(
                                                                                  context,
                                                                                  'Uploading file...',
                                                                                  showLoading: true,
                                                                                );
                                                                                selectedUploadedFiles = selectedMedia
                                                                                    .map((m) => FFUploadedFile(
                                                                                          name: m.storagePath.split('/').last,
                                                                                          bytes: m.bytes,
                                                                                          height: m.dimensions?.height,
                                                                                          width: m.dimensions?.width,
                                                                                          blurHash: m.blurHash,
                                                                                        ))
                                                                                    .toList();

                                                                                downloadUrls = (await Future.wait(
                                                                                  selectedMedia.map(
                                                                                    (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                  ),
                                                                                ))
                                                                                    .where((u) => u != null)
                                                                                    .map((u) => u!)
                                                                                    .toList();
                                                                              } finally {
                                                                                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                _model.isDataUploading = false;
                                                                              }
                                                                              if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                setState(() {
                                                                                  _model.uploadedLocalFile = selectedUploadedFiles.first;
                                                                                  _model.uploadedFileUrl = downloadUrls.first;
                                                                                });
                                                                                showUploadMessage(context, 'Success!');
                                                                              } else {
                                                                                setState(() {});
                                                                                showUploadMessage(context, 'Failed to upload data');
                                                                                return;
                                                                              }
                                                                            }

                                                                            if ((_model.textController.text != null && _model.textController.text != '') ||
                                                                                (_model.uploadedFileUrl != null && _model.uploadedFileUrl != '')) {
                                                                              firestoreBatch.set(
                                                                                  ChatMessagesRecord.collection.doc(),
                                                                                  createChatMessagesRecordData(
                                                                                    user: currentUserReference,
                                                                                    chatUser: widget.chatUser,
                                                                                    timestamp: getCurrentTimestamp,
                                                                                    image: _model.uploadedFileUrl,
                                                                                  ));

                                                                              firestoreBatch.update(
                                                                                  chatsPageChatsRecord!.reference,
                                                                                  createChatsRecordData(
                                                                                    lastMessageTime: getCurrentTimestamp,
                                                                                    lastMessage: _model.textController.text,
                                                                                  ));
                                                                              setState(() {
                                                                                _model.textController?.clear();
                                                                              });
                                                                            } else {
                                                                              ScaffoldMessenger.of(context).showSnackBar(
                                                                                SnackBar(
                                                                                  content: Text(
                                                                                    'Please type something...',
                                                                                    style: TextStyle(
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                    ),
                                                                                  ),
                                                                                  duration: Duration(milliseconds: 4000),
                                                                                  backgroundColor: Color(0x00000000),
                                                                                ),
                                                                              );
                                                                            }
                                                                          } finally {
                                                                            await firestoreBatch.commit();
                                                                          }
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .photo_camera,
                                                                          color:
                                                                              Color(0xFF87939C),
                                                                          size:
                                                                              18.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final firestoreBatch =
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .batch();
                                                          try {
                                                            if (_model.textController
                                                                        .text !=
                                                                    null &&
                                                                _model.textController
                                                                        .text !=
                                                                    '') {
                                                              firestoreBatch
                                                                  .set(
                                                                      ChatMessagesRecord
                                                                          .collection
                                                                          .doc(),
                                                                      createChatMessagesRecordData(
                                                                        user:
                                                                            currentUserReference,
                                                                        chatUser:
                                                                            widget.chatUser,
                                                                        text: _model
                                                                            .textController
                                                                            .text,
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                        image: _model
                                                                            .uploadedFileUrl,
                                                                      ));

                                                              firestoreBatch
                                                                  .update(
                                                                      chatsPageChatsRecord!
                                                                          .reference,
                                                                      createChatsRecordData(
                                                                        lastMessage: _model
                                                                            .textController
                                                                            .text,
                                                                        lastMessageTime:
                                                                            getCurrentTimestamp,
                                                                        lastMessageSenderId:
                                                                            currentUserUid,
                                                                      ));
                                                              setState(() {
                                                                _model
                                                                    .textController
                                                                    ?.clear();
                                                              });
                                                            }
                                                          } finally {
                                                            await firestoreBatch
                                                                .commit();
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 45.0,
                                                          height: 45.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        400.0),
                                                          ),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .send_rounded,
                                                                  color: Color(
                                                                      0xFF87939C),
                                                                  size: 18.0,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ));
      },
    );
  }
}
