import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/bottom_bar_error_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_profile_model.dart';
export 'edit_profile_model.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key? key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget>
    with TickerProviderStateMixin {
  late EditProfileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 700.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProfileModel());

    _model.nameController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.realName, ''));
    _model.usernameController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.bioController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.bio, ''));

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'EditProfile',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF9F1CFA), Color(0xFF0D28A2)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.87, -1.0),
                          end: AlignmentDirectional(-0.87, 1.0),
                        ),
                      ),
                      alignment: AlignmentDirectional(0.00, -1.00),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 16.0, 16.0),
                            child: Container(
                              width: double.infinity,
                              constraints: BoxConstraints(
                                maxWidth: 570.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 2.0),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(0.00, 0.00),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 32.0, 20.0, 32.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'jfw13s59' /* Edit Profile */,
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 24.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            '68b685qn' /* Please fill the following info... */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge,
                                        ),
                                      ),
                                      AuthUserStreamWidget(
                                        builder: (context) => InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final selectedMedia =
                                                await selectMediaWithSourceBottomSheet(
                                              context: context,
                                              allowPhoto: true,
                                              includeDimensions: true,
                                              includeBlurHash: true,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isDataUploading1 = true);
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
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                              } finally {
                                                _model.isDataUploading1 = false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFile1 =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl1 =
                                                      downloadUrls.first;
                                                });
                                              } else {
                                                setState(() {});
                                                return;
                                              }
                                            }
                                          },
                                          child: Container(
                                            width: double.infinity,
                                            height: 120.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image:
                                                    CachedNetworkImageProvider(
                                                  _model.uploadedFileUrl1 !=
                                                              null &&
                                                          _model.uploadedFileUrl1 !=
                                                              ''
                                                      ? _model.uploadedFileUrl1
                                                      : valueOrDefault(
                                                          currentUserDocument
                                                              ?.banner,
                                                          ''),
                                                ),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.00, 0.00),
                                              child: Container(
                                                width: 120.0,
                                                height: 120.0,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 10.0, 0.0, 10.0),
                                                  child: InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      final selectedMedia =
                                                          await selectMediaWithSourceBottomSheet(
                                                        context: context,
                                                        allowPhoto: true,
                                                        includeDimensions: true,
                                                        includeBlurHash: true,
                                                      );
                                                      if (selectedMedia !=
                                                              null &&
                                                          selectedMedia.every((m) =>
                                                              validateFileFormat(
                                                                  m.storagePath,
                                                                  context))) {
                                                        setState(() => _model
                                                                .isDataUploading2 =
                                                            true);
                                                        var selectedUploadedFiles =
                                                            <FFUploadedFile>[];

                                                        var downloadUrls =
                                                            <String>[];
                                                        try {
                                                          selectedUploadedFiles =
                                                              selectedMedia
                                                                  .map((m) =>
                                                                      FFUploadedFile(
                                                                        name: m
                                                                            .storagePath
                                                                            .split('/')
                                                                            .last,
                                                                        bytes: m
                                                                            .bytes,
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
                                                              (await Future
                                                                      .wait(
                                                            selectedMedia.map(
                                                              (m) async =>
                                                                  await uploadData(
                                                                      m.storagePath,
                                                                      m.bytes),
                                                            ),
                                                          ))
                                                                  .where((u) =>
                                                                      u != null)
                                                                  .map(
                                                                      (u) => u!)
                                                                  .toList();
                                                        } finally {
                                                          _model.isDataUploading2 =
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
                                                          setState(() {
                                                            _model.uploadedLocalFile2 =
                                                                selectedUploadedFiles
                                                                    .first;
                                                            _model.uploadedFileUrl2 =
                                                                downloadUrls
                                                                    .first;
                                                          });
                                                        } else {
                                                          setState(() {});
                                                          return;
                                                        }
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 120.0,
                                                      height: 120.0,
                                                      clipBehavior:
                                                          Clip.antiAlias,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    500),
                                                        imageUrl: _model.uploadedFileUrl2 !=
                                                                    null &&
                                                                _model.uploadedFileUrl2 !=
                                                                    ''
                                                            ? _model
                                                                .uploadedFileUrl2
                                                            : currentUserPhoto,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 5.0, 0.0),
                                              child: Stack(
                                                children: [
                                                  if ((_model.uploadedFileUrl2 !=
                                                              null &&
                                                          _model.uploadedFileUrl2 !=
                                                              '') ||
                                                      (currentUserPhoto !=
                                                              null &&
                                                          currentUserPhoto !=
                                                              ''))
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Icon(
                                                        Icons.check_circle,
                                                        color:
                                                            Color(0xFF39C727),
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                  if ((_model.uploadedFileUrl2 ==
                                                              null ||
                                                          _model.uploadedFileUrl2 ==
                                                              '') &&
                                                      (currentUserPhoto ==
                                                              null ||
                                                          currentUserPhoto ==
                                                              ''))
                                                    AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Icon(
                                                        Icons.not_interested,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'kvqnbxcp' /* Profile Picture */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                            Stack(
                                              children: [
                                                if ((_model.uploadedFileUrl1 !=
                                                            null &&
                                                        _model.uploadedFileUrl1 !=
                                                            '') ||
                                                    (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.banner,
                                                                '') !=
                                                            null &&
                                                        valueOrDefault(
                                                                currentUserDocument
                                                                    ?.banner,
                                                                '') !=
                                                            ''))
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Icon(
                                                      Icons.check_circle,
                                                      color: Color(0xFF39C727),
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                if ((_model.uploadedFileUrl1 ==
                                                            null ||
                                                        _model.uploadedFileUrl1 ==
                                                            '') &&
                                                    (valueOrDefault(
                                                                currentUserDocument
                                                                    ?.banner,
                                                                '') ==
                                                            null ||
                                                        valueOrDefault(
                                                                currentUserDocument
                                                                    ?.banner,
                                                                '') ==
                                                            ''))
                                                  AuthUserStreamWidget(
                                                    builder: (context) => Icon(
                                                      Icons.not_interested,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      5.0, 0.0, 10.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'pa771gqt' /* Banner */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 16.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller: _model.nameController,
                                              onFieldSubmitted: (_) async {
                                                if (functions.getStringLength(
                                                        _model.nameController
                                                            .text) >
                                                    30) {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => FocusScope
                                                                .of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BottomBarErrorWidget(
                                                            text:
                                                                'Name may only be up to 30 characters.',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                }
                                              },
                                              autofocus: true,
                                              autofillHints: [
                                                AutofillHints.email
                                              ],
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  't8htnffm' /* Name */,
                                                ),
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 1.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge,
                                              keyboardType: TextInputType.name,
                                              validator: _model
                                                  .nameControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) =>
                                              FutureBuilder<List<UsersRecord>>(
                                            future: UsersRecord.search(
                                              term: _model
                                                  .usernameController.text,
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
                                                              .primary,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<UsersRecord>
                                                  usernameUsersRecordList =
                                                  snapshot.data!;
                                              return Container(
                                                width: double.infinity,
                                                child: TextFormField(
                                                  controller:
                                                      _model.usernameController,
                                                  onChanged: (_) =>
                                                      EasyDebounce.debounce(
                                                    '_model.usernameController',
                                                    Duration(
                                                        milliseconds: 2000),
                                                    () async {
                                                      if (functions
                                                              .isUsernameCharValid(
                                                                  _model
                                                                      .usernameController
                                                                      .text) ==
                                                          true) {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => FocusScope
                                                                      .of(
                                                                          context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    BottomBarErrorWidget(
                                                                  text:
                                                                      'Only Letters, Numbers, and Underscores allowed.',
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));

                                                        setState(() {
                                                          _model.usernameController
                                                                  ?.text =
                                                              functions.usernameStripper(
                                                                  _model
                                                                      .usernameController
                                                                      .text);
                                                        });
                                                      }
                                                      if (functions.getStringLength(
                                                              _model
                                                                  .usernameController
                                                                  .text) >
                                                          15) {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => FocusScope
                                                                      .of(
                                                                          context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    BottomBarErrorWidget(
                                                                  text:
                                                                      'Username must be less than 15 characters.',
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));

                                                        setState(() {
                                                          _model.usernameController
                                                                  ?.text =
                                                              functions.usernameStripper(
                                                                  _model
                                                                      .usernameController
                                                                      .text);
                                                        });
                                                      }
                                                      if (functions.getStringLength(
                                                              _model
                                                                  .usernameController
                                                                  .text) <
                                                          1) {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => FocusScope
                                                                      .of(
                                                                          context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    BottomBarErrorWidget(
                                                                  text:
                                                                      'Username must have at least 1 character.',
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));

                                                        setState(() {
                                                          _model.usernameController
                                                                  ?.text =
                                                              functions
                                                                  .usernameStripper(
                                                                      '${_model.usernameController.text}${random_data.randomString(
                                                            3,
                                                            10,
                                                            true,
                                                            false,
                                                            false,
                                                          )}');
                                                        });
                                                      }
                                                      if (usernameUsersRecordList
                                                              .where((e) =>
                                                                  e.displayName ==
                                                                  _model
                                                                      .usernameController
                                                                      .text)
                                                              .toList()
                                                              .length >
                                                          0) {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => FocusScope
                                                                      .of(
                                                                          context)
                                                                  .requestFocus(
                                                                      _model
                                                                          .unfocusNode),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    BottomBarErrorWidget(
                                                                  text:
                                                                      'Username already taken.',
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            setState(() {}));

                                                        setState(() {
                                                          _model.usernameController
                                                                  ?.text =
                                                              functions
                                                                  .usernameStripper(
                                                                      '${_model.usernameController.text}${random_data.randomInteger(1, 10000000).toString()}');
                                                        });
                                                        if (usernameUsersRecordList
                                                                .where((e) =>
                                                                    e.displayName ==
                                                                    _model
                                                                        .usernameController
                                                                        .text)
                                                                .toList()
                                                                .length >
                                                            0) {
                                                          await showModalBottomSheet(
                                                            isScrollControlled:
                                                                true,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            context: context,
                                                            builder: (context) {
                                                              return GestureDetector(
                                                                onTap: () => FocusScope.of(
                                                                        context)
                                                                    .requestFocus(
                                                                        _model
                                                                            .unfocusNode),
                                                                child: Padding(
                                                                  padding: MediaQuery
                                                                      .viewInsetsOf(
                                                                          context),
                                                                  child:
                                                                      BottomBarErrorWidget(
                                                                    text:
                                                                        'Username already taken.',
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ).then((value) =>
                                                              setState(() {}));

                                                          setState(() {
                                                            _model.usernameController
                                                                    ?.text =
                                                                functions
                                                                    .usernameStripper(
                                                                        '${_model.usernameController.text}${random_data.randomInteger(1, 1000000000).toString()}');
                                                          });
                                                          setState(() {
                                                            _model.isUsernameValid =
                                                                false;
                                                          });
                                                        } else {
                                                          setState(() {
                                                            _model.isUsernameValid =
                                                                true;
                                                          });
                                                        }
                                                      } else {
                                                        setState(() {
                                                          _model.isUsernameValid =
                                                              true;
                                                        });
                                                      }
                                                    },
                                                  ),
                                                  autofocus: true,
                                                  autofillHints: [
                                                    AutofillHints.email
                                                  ],
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText:
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                      'nw64d14a' /* Username */,
                                                    ),
                                                    labelStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color: valueOrDefault<
                                                            Color>(
                                                          _model.isUsernameValid
                                                              ? (currentUserDisplayName !=
                                                                          null &&
                                                                      currentUserDisplayName !=
                                                                          ''
                                                                  ? Color(
                                                                      0xFF17A617)
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground)
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .error,
                                                          Color(0xFF757575),
                                                        ),
                                                        width: 1.5,
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
                                                        width: 1.5,
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
                                                        width: 1.5,
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
                                                        width: 1.5,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    filled: true,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryBackground,
                                                    suffixIcon: Icon(
                                                      Icons.check_circle,
                                                      color:
                                                          valueOrDefault<Color>(
                                                        _model.isUsernameValid
                                                            ? Color(0xFF39C727)
                                                            : Color(0xFF757575),
                                                        Color(0xFF757575),
                                                      ),
                                                      size: 22.0,
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyLarge
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                      ),
                                                  validator: _model
                                                      .usernameControllerValidator
                                                      .asValidator(context),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Container(
                                            width: double.infinity,
                                            child: TextFormField(
                                              controller: _model.bioController,
                                              onFieldSubmitted: (_) async {
                                                if (functions.getStringLength(
                                                        _model.bioController
                                                            .text) >
                                                    200) {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    enableDrag: false,
                                                    context: context,
                                                    builder: (context) {
                                                      return GestureDetector(
                                                        onTap: () => FocusScope
                                                                .of(context)
                                                            .requestFocus(_model
                                                                .unfocusNode),
                                                        child: Padding(
                                                          padding: MediaQuery
                                                              .viewInsetsOf(
                                                                  context),
                                                          child:
                                                              BottomBarErrorWidget(
                                                            text:
                                                                'Bio may only be up to 200 characters.',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      setState(() {}));
                                                }
                                              },
                                              autofocus: true,
                                              autofillHints: [
                                                AutofillHints.email
                                              ],
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'no2dnmgw' /* Bio */,
                                                ),
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLarge,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    width: 1.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.5,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                filled: true,
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyLarge,
                                              maxLines: 3,
                                              validator: _model
                                                  .bioControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await currentUserReference!
                                                .update(createUsersRecordData(
                                              realName: _model.nameController
                                                              .text !=
                                                          null &&
                                                      _model.nameController
                                                              .text !=
                                                          ''
                                                  ? functions.nameClipper(_model
                                                      .nameController.text)
                                                  : valueOrDefault(
                                                      currentUserDocument
                                                          ?.realName,
                                                      ''),
                                              bio: _model.bioController.text !=
                                                          null &&
                                                      _model.bioController
                                                              .text !=
                                                          ''
                                                  ? _model.bioController.text
                                                  : valueOrDefault(
                                                      currentUserDocument?.bio,
                                                      ''),
                                              pfpBlurHash: _model
                                                              .uploadedFileUrl2 !=
                                                          null &&
                                                      _model.uploadedFileUrl2 !=
                                                          ''
                                                  ? _model.uploadedFileUrl2
                                                  : valueOrDefault(
                                                      currentUserDocument
                                                          ?.pfpBlurHash,
                                                      ''),
                                              photoUrl: _model.uploadedFileUrl2 !=
                                                          null &&
                                                      _model.uploadedFileUrl2 !=
                                                          ''
                                                  ? _model.uploadedFileUrl2
                                                  : currentUserPhoto,
                                              banner: _model.uploadedFileUrl1 !=
                                                          null &&
                                                      _model.uploadedFileUrl1 !=
                                                          ''
                                                  ? _model.uploadedFileUrl1
                                                  : valueOrDefault(
                                                      currentUserDocument
                                                          ?.banner,
                                                      ''),
                                              displayName:
                                                  _model.isUsernameValid
                                                      ? _model
                                                          .usernameController
                                                          .text
                                                      : currentUserDisplayName,
                                            ));

                                            context.pushNamed(
                                              'Profile',
                                              extra: <String, dynamic>{
                                                kTransitionInfoKey:
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                ),
                                              },
                                            );
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '5clto9rn' /* Confirm */,
                                          ),
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 44.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
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
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['containerOnPageLoadAnimation']!),
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
  }
}
