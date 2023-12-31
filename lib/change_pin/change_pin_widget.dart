import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/bottom_bar_error_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'change_pin_model.dart';
export 'change_pin_model.dart';

class ChangePinWidget extends StatefulWidget {
  const ChangePinWidget({super.key});

  @override
  _ChangePinWidgetState createState() => _ChangePinWidgetState();
}

class _ChangePinWidgetState extends State<ChangePinWidget>
    with TickerProviderStateMixin {
  late ChangePinModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered = false;
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.0, 140.0),
          end: const Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1.0, 1.0),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(-0.349, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      applyInitialState: true,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.0, 140.0),
          end: const Offset(0.0, 0.0),
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(0.9, 0.9),
          end: const Offset(1.0, 1.0),
        ),
        TiltEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 300.ms,
          begin: const Offset(-0.349, 0),
          end: const Offset(0, 0),
        ),
      ],
    ),
    'containerOnActionTriggerAnimation': AnimationInfo(
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
    _model = createModel(context, () => ChangePinModel());

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
        title: 'changePin',
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
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF6E09B3), Color(0xFF040F46)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(0.87, -1.0),
                          end: AlignmentDirectional(-0.87, 1.0),
                        ),
                      ),
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              if (!_model.isPinCorrect)
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 450.0,
                                    constraints: const BoxConstraints(
                                      maxWidth: 570.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF161A1D),
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -0.3),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'geh79vi7' /* Change Pin */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 35.0,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 8.0, 30.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'bktwfps2' /* Please enter your current pin */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: PinCodeTextField(
                                              autoDisposeControllers: false,
                                              appContext: context,
                                              length: 4,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              enableActiveFill: false,
                                              autoFocus: true,
                                              enablePinAutofill: true,
                                              errorTextSpace: 16.0,
                                              showCursor: true,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              obscureText: false,
                                              hintCharacter: '●',
                                              pinTheme: PinTheme(
                                                fieldHeight: 60.0,
                                                fieldWidth: 60.0,
                                                borderWidth: 2.0,
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(40.0),
                                                  bottomRight:
                                                      Radius.circular(40.0),
                                                  topLeft:
                                                      Radius.circular(40.0),
                                                  topRight:
                                                      Radius.circular(40.0),
                                                ),
                                                shape: PinCodeFieldShape.box,
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                inactiveColor:
                                                    const Color(0xFF1C2427),
                                                selectedColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                activeFillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                inactiveFillColor:
                                                    const Color(0xFF1C2427),
                                                selectedFillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              controller:
                                                  _model.pinCodeController1,
                                              onChanged: (_) async {
                                                if (_model.pinCodeController1!
                                                        .text ==
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.pincode,
                                                        '')) {
                                                  context.pushNamed(
                                                    'settings',
                                                    queryParameters: {
                                                      'settingsKey':
                                                          serializeParam(
                                                        true,
                                                        ParamType.bool,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                }
                                              },
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: _model
                                                  .pinCodeController1Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 150.0,
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      if (_model
                                                              .pinCodeController1!
                                                              .text ==
                                                          valueOrDefault(
                                                              currentUserDocument
                                                                  ?.pincode,
                                                              '')) {
                                                        setState(() {
                                                          _model.isPinCorrect =
                                                              true;
                                                        });
                                                      } else {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () => _model
                                                                      .unfocusNode
                                                                      .canRequestFocus
                                                                  ? FocusScope.of(
                                                                          context)
                                                                      .requestFocus(
                                                                          _model
                                                                              .unfocusNode)
                                                                  : FocusScope.of(
                                                                          context)
                                                                      .unfocus(),
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    const BottomBarErrorWidget(
                                                                  text:
                                                                      'Incorrect pin, please try again.',
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'ej3fzq6o' /* Confirm */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 240.0,
                                                      height: 48.0,
                                                      padding:
                                                          const EdgeInsets.all(0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: const Color(0xFFD82E2E),
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
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'containerOnPageLoadAnimation1']!),
                                ),
                              if (_model.isPinCorrect)
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 450.0,
                                    constraints: const BoxConstraints(
                                      maxWidth: 570.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF161A1D),
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4.0,
                                          color: Color(0x33000000),
                                          offset: Offset(0.0, 2.0),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Align(
                                      alignment:
                                          const AlignmentDirectional(0.0, -0.3),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'qxbrfvwh' /* Change Pin */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Colors.white,
                                                  fontSize: 35.0,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 8.0, 30.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '95j9oa4y' /* Please enter your new pin */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                      ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: PinCodeTextField(
                                              autoDisposeControllers: false,
                                              appContext: context,
                                              length: 4,
                                              textStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                      ),
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              enableActiveFill: false,
                                              autoFocus: true,
                                              enablePinAutofill: true,
                                              errorTextSpace: 16.0,
                                              showCursor: true,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              obscureText: false,
                                              hintCharacter: '●',
                                              pinTheme: PinTheme(
                                                fieldHeight: 60.0,
                                                fieldWidth: 60.0,
                                                borderWidth: 2.0,
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(40.0),
                                                  bottomRight:
                                                      Radius.circular(40.0),
                                                  topLeft:
                                                      Radius.circular(40.0),
                                                  topRight:
                                                      Radius.circular(40.0),
                                                ),
                                                shape: PinCodeFieldShape.box,
                                                activeColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                inactiveColor:
                                                    const Color(0xFF1C2427),
                                                selectedColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                activeFillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                inactiveFillColor:
                                                    const Color(0xFF1C2427),
                                                selectedFillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                              controller:
                                                  _model.pinCodeController2,
                                              onChanged: (_) {},
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: _model
                                                  .pinCodeController2Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 150.0,
                                            decoration: const BoxDecoration(),
                                            child: Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await currentUserReference!
                                                          .update(
                                                              createUsersRecordData(
                                                        pincode: _model
                                                            .pinCodeController2!
                                                            .text,
                                                      ));

                                                      context.goNamed(
                                                        'settings',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              const TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    text: FFLocalizations.of(
                                                            context)
                                                        .getText(
                                                      'xg6tg509' /* Confirm */,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 240.0,
                                                      height: 48.0,
                                                      padding:
                                                          const EdgeInsets.all(0.0),
                                                      iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: const Color(0xFFD82E2E),
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
                                                      borderSide: const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                      .animateOnPageLoad(animationsMap[
                                          'containerOnPageLoadAnimation2']!)
                                      .animateOnActionTrigger(
                                          animationsMap[
                                              'containerOnActionTriggerAnimation']!,
                                          hasBeenTriggered:
                                              hasContainerTriggered),
                                ),
                            ],
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
