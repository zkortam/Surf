import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/beautified_text_widget.dart';
import '/components/bottom_bar_error_widget.dart';
import '/components/bottom_notif_widget.dart';
import '/components/select_space_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'thread_create_model.dart';
export 'thread_create_model.dart';

class ThreadCreateWidget extends StatefulWidget {
  const ThreadCreateWidget({
    super.key,
    bool? isPostingPage,
    bool? isPrivate,
    bool? isCommentAllowed,
    bool? isStealthSetting,
  })  : isPostingPage = isPostingPage ?? false,
        isPrivate = isPrivate ?? false,
        isCommentAllowed = isCommentAllowed ?? true,
        isStealthSetting = isStealthSetting ?? false;

  final bool isPostingPage;
  final bool isPrivate;
  final bool isCommentAllowed;
  final bool isStealthSetting;

  @override
  _ThreadCreateWidgetState createState() => _ThreadCreateWidgetState();
}

class _ThreadCreateWidgetState extends State<ThreadCreateWidget>
    with TickerProviderStateMixin {
  late ThreadCreateModel _model;

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
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadCreateModel());

    _model.titleController ??= TextEditingController();
    _model.titleFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController3 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController4 ??= TextEditingController();
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.option3Controller ??= TextEditingController();
    _model.option3FocusNode ??= FocusNode();

    _model.option4Controller ??= TextEditingController();
    _model.option4FocusNode ??= FocusNode();

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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Container(
            width: widget.isPostingPage ? 600.0 : 500.0,
            constraints: const BoxConstraints(
              minHeight: 150.0,
              maxHeight: 700.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  15.0, 10.0, 8.0, 0.0),
                              child: TextFormField(
                                controller: _model.titleController,
                                focusNode: _model.titleFocusNode,
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                      ),
                                  hintText: FFLocalizations.of(context).getText(
                                    'o6cgtphw' /* Title */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 18.0,
                                    ),
                                minLines: 1,
                                maxLength: 50,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                buildCounter: (context,
                                        {required currentLength,
                                        required isFocused,
                                        maxLength}) =>
                                    null,
                                validator: _model.titleControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            if (!_model.isPoll)
                              Container(
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 8.0, 10.0),
                                  child: TextFormField(
                                    controller: _model.textController2,
                                    focusNode: _model.textFieldFocusNode1,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 15.0,
                                          ),
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'e581z8uy' /* What's happening? */,
                                      ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedErrorBorder: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 10.0, 0.0, 10.0),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    maxLines: 10,
                                    minLines: 1,
                                    maxLength: 2000,
                                    maxLengthEnforcement:
                                        MaxLengthEnforcement.enforced,
                                    validator: _model.textController2Validator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            if (_model.isPoll == true)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Container(
                                      width: double.infinity,
                                      constraints: const BoxConstraints(
                                        minHeight: 160.0,
                                        maxHeight: 227.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 5.0, 5.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 3.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController3,
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
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        'wqon8761' /* Option 1 */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      focusedErrorBorder:
                                                          InputBorder.none,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                    validator: _model
                                                        .textController3Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsetsDirectional
                                                  .fromSTEB(5.0, 5.0, 5.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    width: 3.0,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 8.0, 0.0),
                                                  child: TextFormField(
                                                    controller:
                                                        _model.textController4,
                                                    focusNode: _model
                                                        .textFieldFocusNode3,
                                                    autofocus: true,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      hintText:
                                                          FFLocalizations.of(
                                                                  context)
                                                              .getText(
                                                        '3rlxh29z' /* Option 2 */,
                                                      ),
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      focusedErrorBorder:
                                                          InputBorder.none,
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium,
                                                    validator: _model
                                                        .textController4Validator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (_model.option3)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 5.0, 5.0, 0.0),
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
                                                    setState(() {
                                                      _model.addToOptions(_model
                                                          .option3Controller
                                                          .text);
                                                    });
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 3.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .option3Controller,
                                                        focusNode: _model
                                                            .option3FocusNode,
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
                                                            '5srinp0x' /* Option 3 */,
                                                          ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        validator: _model
                                                            .option3ControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation1']!,
                                                    hasBeenTriggered:
                                                        hasContainerTriggered1),
                                              ),
                                            if (_model.option4)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 5.0, 5.0, 0.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                    border: Border.all(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      width: 3.0,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                0.0, 0.0),
                                                    child: SizedBox(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          0.9,
                                                      child: TextFormField(
                                                        controller: _model
                                                            .option4Controller,
                                                        focusNode: _model
                                                            .option4FocusNode,
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
                                                            'zqujcaum' /* Option 4 */,
                                                          ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelMedium,
                                                          enabledBorder:
                                                              InputBorder.none,
                                                          focusedBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        validator: _model
                                                            .option4ControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                ).animateOnActionTrigger(
                                                    animationsMap[
                                                        'containerOnActionTriggerAnimation2']!,
                                                    hasBeenTriggered:
                                                        hasContainerTriggered2),
                                              ),
                                            if (_model.isMorePressed != 2)
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 5.0, 5.0, 0.0),
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
                                                    if (_model.isMorePressed ==
                                                        0) {
                                                      setState(() {
                                                        _model.option3 = true;
                                                        _model.isMorePressed =
                                                            1;
                                                      });
                                                      if (animationsMap[
                                                              'containerOnActionTriggerAnimation1'] !=
                                                          null) {
                                                        setState(() =>
                                                            hasContainerTriggered1 =
                                                                true);
                                                        SchedulerBinding
                                                            .instance
                                                            .addPostFrameCallback((_) async =>
                                                                await animationsMap[
                                                                        'containerOnActionTriggerAnimation1']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0));
                                                      }
                                                    } else {
                                                      if (_model
                                                              .isMorePressed ==
                                                          1) {
                                                        setState(() {
                                                          _model.option4 = true;
                                                        });
                                                        if (animationsMap[
                                                                'containerOnActionTriggerAnimation2'] !=
                                                            null) {
                                                          setState(() =>
                                                              hasContainerTriggered2 =
                                                                  true);
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback((_) async =>
                                                                  await animationsMap[
                                                                          'containerOnActionTriggerAnimation2']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                        }
                                                      }
                                                    }
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: 50.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        width: 3.0,
                                                      ),
                                                    ),
                                                    child: Row(
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
                                                            '5fqivt69' /* More options */,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
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
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        children: [
                          if (_model.option3 && _model.option4)
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  _model.isMorePressed = 0;
                                  _model.option3 = false;
                                  _model.option4 = false;
                                });
                                setState(() {
                                  _model.option3Controller?.clear();
                                  _model.option4Controller?.clear();
                                });
                              },
                              text: FFLocalizations.of(context).getText(
                                'j3razwci' /* -  3 & 4 */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.transparent,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: const Color(0xFFCF1414),
                                    ),
                                borderSide: const BorderSide(
                                  color: Color(0xFFCF1414),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          if (_model.option3 && !_model.option4)
                            FFButtonWidget(
                              onPressed: () async {
                                setState(() {
                                  _model.isMorePressed = 0;
                                  _model.option3 = false;
                                });
                                setState(() {
                                  _model.option3Controller?.clear();
                                });
                              },
                              text: FFLocalizations.of(context).getText(
                                'wfkvlu10' /* - 3 */,
                              ),
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Colors.transparent,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: const Color(0xFFCF1414),
                                    ),
                                borderSide: const BorderSide(
                                  color: Color(0xFFCF1414),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: _model.isPoll
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).primaryText,
                          borderRadius: 20.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.stacked_bar_chart_rounded,
                            color: _model.isPoll
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            if (_model.isPoll) {
                              setState(() {
                                _model.isPoll = false;
                              });
                            } else {
                              setState(() {
                                _model.isPoll = true;
                              });
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primaryText,
                          borderRadius: 20.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          icon: FaIcon(
                            FontAwesomeIcons.broom,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 15.0,
                          ),
                          onPressed: () async {
                            if (functions.getStringLength(
                                    _model.textController2.text) >
                                50) {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const BottomNotifWidget(
                                      text: 'Beautifying',
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              _model.gptOut = await actions.chatGPT(
                                '4',
                                '${_model.textController2.text}Fix all of the grammar and spelling mistakes in this prompt.',
                                1500,
                                0.05,
                              );
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: BeautifiedTextWidget(
                                      text: functions
                                          .substringerGPT(_model.gptOut!),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            } else {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const BottomBarErrorWidget(
                                      text:
                                          'Please write at least 50 characters',
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }

                            setState(() {});
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
                          borderColor: FlutterFlowTheme.of(context).primaryText,
                          borderRadius: 20.0,
                          borderWidth: 2.0,
                          buttonSize: 40.0,
                          icon: Icon(
                            Icons.grain,
                            color: FFAppState().selectedSpace != ''
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                          onPressed: () async {
                            if (FFAppState().selectedSpace != '') {
                              setState(() {
                                FFAppState().selectedSpace = '';
                              });
                            } else {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: const SelectSpaceWidget(),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));
                            }
                          },
                        ),
                      ),
                      if (widget.isPostingPage)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowIconButton(
                            borderColor:
                                FlutterFlowTheme.of(context).primaryText,
                            borderRadius: 20.0,
                            borderWidth: 2.0,
                            buttonSize: 40.0,
                            icon: Icon(
                              Icons.settings_sharp,
                              color: _model.isSettings
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).primaryText,
                              size: 20.0,
                            ),
                            onPressed: () async {
                              if (_model.isSettings) {
                                setState(() {
                                  _model.isSettings = false;
                                });
                              } else {
                                setState(() {
                                  _model.isSettings = true;
                                });
                              }
                            },
                          ),
                        ),
                      Align(
                        alignment: const AlignmentDirectional(1.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 10.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final firestoreBatch =
                                  FirebaseFirestore.instance.batch();
                              try {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: BottomNotifWidget(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'mbi8v1fn' /* Posting */,
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));

                                setState(() {
                                  _model.options = functions
                                      .stringsToList(
                                          _model.textController3.text,
                                          _model.textController4.text,
                                          _model.option3Controller.text,
                                          _model.option4Controller.text)
                                      .toList()
                                      .cast<String>();
                                });
                                setState(() {
                                  _model.thread = ThreadStruct(
                                    timestamp: getCurrentTimestamp,
                                    author: currentUserUid,
                                    title: _model.titleController.text,
                                    text: functions.threadTextStripper(
                                        _model.textController2.text),
                                    netVotes: 0,
                                    id: 'T$currentUserUid${(currentUserDocument?.threads.toList() ?? []).length.toString()}',
                                    isPoll: _model.isPoll,
                                    isStealth: valueOrDefault<bool>(
                                            currentUserDocument?.isStealth,
                                            false) ||
                                        (_model.stealthThreadValue == 'On'),
                                    hashtags: functions.extractHashtags(
                                        _model.textController2.text),
                                    link: functions.cutURL(_model
                                                    .textController2.text) !=
                                                ''
                                        ? functions
                                            .cutURL(_model.textController2.text)
                                        : null,
                                    poll: _model.isPoll
                                        ? PollStruct(
                                            options: _model.options,
                                            totalVotes: 0,
                                          )
                                        : PollStruct(),
                                    space: FFAppState().selectedSpace,
                                    commentsAllowed:
                                        _model.enableCommentValue == 'On'
                                            ? true
                                            : false,
                                    isPrivate: _model.privateThreadValue == 'On'
                                        ? true
                                        : false,
                                  );
                                });
                                if (!_model.isPoll) {
                                  if (functions.getStringLength(
                                          _model.textController2.text) >
                                      1499) {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: BottomNotifWidget(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'mbi8v1fn' /* Starting Surf AI */,
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    _model.threadSummary =
                                        await actions.chatGPT(
                                      _model.apiKey,
                                      'Please summarize the following prompt in 2 sentences max. Make the summary clear and concise. Do not repeat anything. Make it good gramatically, have good spelling, and structure.  FULL SENTENCES. NO CUT OFFS. Additionally, do not use any markdown notations.Here\'s the prompt.${functions.stringClipper(_model.textController2.text, 0, 500)}',
                                      2000,
                                      0.05,
                                    );
                                    _model.isPolitical = await actions.chatGPT(
                                      _model.apiKey,
                                      'Is this thread political? Answer 0 if it isn\'t. 1 if it is. Being political means being related to any political topic. I only want you to declare 0 or 1. nothing else. Here\'s the thread: ${functions.stringClipper(_model.textController2.text, 0, 500)}',
                                      2000,
                                      0.1,
                                    );
                                    if (functions
                                            .stringToInt(_model.isPolitical!)
                                            .toString() ==
                                        '1') {
                                      _model.threadPolitical =
                                          await actions.chatGPT(
                                        _model.apiKey,
                                        'If the following prompt is a conservative bias, reply 1. liberal bias reply -1. If it\'s politically neutral, reply 0. I only want your answer to be that. NO OTHER TEXT.${functions.stringClipper(_model.textController2.text, 0, 500)}',
                                        1500,
                                        0.1,
                                      );
                                      setState(() {
                                        _model.updateThreadStruct(
                                          (e) => e
                                            ..isPolitical = true
                                            ..politicalPosition =
                                                functions.stringToInt(
                                                    _model.threadPolitical!)
                                            ..summary =
                                                functions.substringerGPT(
                                                    _model.threadSummary!),
                                        );
                                      });
                                    } else {
                                      setState(() {
                                        _model.updateThreadStruct(
                                          (e) => e
                                            ..isPolitical = false
                                            ..summary =
                                                functions.substringerGPT(
                                                    _model.threadSummary!),
                                        );
                                      });
                                    }
                                  } else {
                                    setState(() {
                                      _model.updateThreadStruct(
                                        (e) => e..isPolitical = false,
                                      );
                                    });
                                  }
                                }
                                if (currentUserDocument
                                        ?.threadSettings.autoBeautification ==
                                    'On') {
                                  _model.fixed = await actions.chatGPT(
                                    _model.apiKey,
                                    'Fix all of the grammar and spelling mistakes in this prompt. Do not say anything. Just send me the fixed version: ${functions.threadTextStripper(_model.textController2.text)}',
                                    1500,
                                    0.05,
                                  );
                                  setState(() {
                                    _model.updateThreadStruct(
                                      (e) => e
                                        ..text = functions
                                            .substringerGPT(_model.fixed!),
                                    );
                                  });
                                }
                                if (currentUserDocument
                                        ?.threadSettings.autoHashtag ==
                                    'On') {
                                  _model.autoHashtag = await actions.chatGPT(
                                    _model.apiKey,
                                    'Please make me a list of 10 Hashtags that most accurately represent the following text. Seperate each one with a space. Do not out anything else except for those hashtags.  Here\'s the text: ${functions.threadTextStripper(_model.textController2.text)}',
                                    350,
                                    0.1,
                                  );
                                  setState(() {
                                    _model.updateThreadStruct(
                                      (e) => e
                                        ..hashtags = functions
                                            .extractHashtags(
                                                functions.substringerGPT(
                                                    _model.autoHashtag!))
                                            .toList(),
                                    );
                                  });
                                }

                                firestoreBatch.set(
                                    ThreadRecord.collection.doc(),
                                    createThreadRecordData(
                                      thread: updateThreadStruct(
                                        _model.thread,
                                        clearUnsetFields: false,
                                        create: true,
                                      ),
                                      title: _model.titleController.text,
                                      text: _model.textController2.text,
                                    ));

                                firestoreBatch.update(currentUserReference!, {
                                  ...mapToFirestore(
                                    {
                                      'threads': FieldValue.arrayUnion([
                                        getThreadFirestoreData(
                                          updateThreadStruct(
                                            _model.thread,
                                            clearUnsetFields: false,
                                          ),
                                          true,
                                        )
                                      ]),
                                    },
                                  ),
                                });
                                setState(() {
                                  FFAppState().selectedSpace = '';
                                });

                                context.goNamed(
                                  'Threads',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: const TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                    ),
                                  },
                                );
                              } finally {
                                await firestoreBatch.commit();
                              }

                              setState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              '86t2joha' /* Post */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
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
        if (valueOrDefault<bool>(currentUserDocument?.isStealth, false) ||
            (_model.stealthThreadValue == 'On'))
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
            child: AuthUserStreamWidget(
              builder: (context) => Container(
                width: widget.isPostingPage ? 600.0 : 500.0,
                decoration: const BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 100.0,
                      height: 40.0,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF1861A0), Color(0xFF1A105D)],
                          stops: [0.0, 1.0],
                          begin: AlignmentDirectional(1.0, 0.0),
                          end: AlignmentDirectional(-1.0, 0),
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              'hngyj0ho' /* Stealth On */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
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
        if (_model.isSettings && widget.isPostingPage)
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(10.0, 30.0, 10.0, 0.0),
            child: Container(
              width: widget.isPostingPage ? 600.0 : 500.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ymhifisk' /* Auto-Beautification */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 16.0,
                                    ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        FlutterFlowChoiceChips(
                                      options: [
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'tk46shxz' /* On */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'lh1dir3l' /* Off */,
                                        ))
                                      ],
                                      onChanged: (val) async {
                                        setState(() =>
                                            _model.abpcValue = val?.first);
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          threadSettings:
                                              createThreadSettingsStruct(
                                            autoBeautification:
                                                _model.abpcValue,
                                            clearUnsetFields: false,
                                          ),
                                        ));
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                            ),
                                        iconColor: Colors.white,
                                        iconSize: 18.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 10.0, 0.0),
                                        elevation: 4.0,
                                        borderWidth: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 10.0, 0.0),
                                        elevation: 0.0,
                                        borderWidth: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      chipSpacing: 5.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      initialized: _model.abpcValue != null,
                                      alignment: WrapAlignment.start,
                                      controller: _model.abpcValueController ??=
                                          FormFieldController<List<String>>(
                                        [
                                          currentUserDocument!
                                              .threadSettings.autoBeautification
                                        ],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '4ol9o14n' /* Auto Hashtags */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 16.0,
                                    ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        FlutterFlowChoiceChips(
                                      options: [
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'o0idwq5t' /* On */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'yg25t80m' /* Off */,
                                        ))
                                      ],
                                      onChanged: (val) async {
                                        setState(() =>
                                            _model.ahpcValue = val?.first);
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          threadSettings:
                                              createThreadSettingsStruct(
                                            autoHashtag: _model.ahpcValue,
                                            clearUnsetFields: false,
                                          ),
                                        ));
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                            ),
                                        iconColor: Colors.white,
                                        iconSize: 18.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 10.0, 0.0),
                                        elevation: 4.0,
                                        borderWidth: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 10.0, 0.0),
                                        elevation: 0.0,
                                        borderWidth: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      chipSpacing: 5.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      initialized: _model.ahpcValue != null,
                                      alignment: WrapAlignment.start,
                                      controller: _model.ahpcValueController ??=
                                          FormFieldController<List<String>>(
                                        [
                                          currentUserDocument!
                                              .threadSettings.autoHashtag
                                        ],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 10.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  '9y4fer17' /* Enable AI Features */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Outfit',
                                      fontSize: 16.0,
                                    ),
                              ),
                              Container(
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        FlutterFlowChoiceChips(
                                      options: [
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'so18hcs3' /* On */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'fixc1zy8' /* Off */,
                                        ))
                                      ],
                                      onChanged: (val) async {
                                        setState(() =>
                                            _model.eaifpcValue = val?.first);
                                        await currentUserReference!
                                            .update(createUsersRecordData(
                                          threadSettings:
                                              createThreadSettingsStruct(
                                            aiFeatures: _model.eaifpcValue,
                                            clearUnsetFields: false,
                                          ),
                                        ));
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                            ),
                                        iconColor: Colors.white,
                                        iconSize: 18.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 10.0, 0.0),
                                        elevation: 4.0,
                                        borderWidth: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 10.0, 0.0),
                                        elevation: 0.0,
                                        borderWidth: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      chipSpacing: 5.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      initialized: _model.eaifpcValue != null,
                                      alignment: WrapAlignment.start,
                                      controller:
                                          _model.eaifpcValueController ??=
                                              FormFieldController<List<String>>(
                                        [
                                          currentUserDocument!
                                              .threadSettings.aiFeatures
                                        ],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '13zrbiju' /* Enable Commenting */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                      ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: [
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'b6mepheg' /* On */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'm99mug78' /* Off */,
                                        ))
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .enableCommentValue = val?.first),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                            ),
                                        iconColor: Colors.white,
                                        iconSize: 18.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 10.0, 0.0),
                                        elevation: 4.0,
                                        borderWidth: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 10.0, 0.0),
                                        elevation: 0.0,
                                        borderWidth: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      chipSpacing: 5.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      initialized:
                                          _model.enableCommentValue != null,
                                      alignment: WrapAlignment.start,
                                      controller: _model
                                              .enableCommentValueController ??=
                                          FormFieldController<List<String>>(
                                        [
                                          FFLocalizations.of(context).getText(
                                            'omixd328' /* On */,
                                          )
                                        ],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'nhc9zyeo' /* Private */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                      ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: FlutterFlowChoiceChips(
                                      options: [
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'f0ikd7nd' /* On */,
                                        )),
                                        ChipData(
                                            FFLocalizations.of(context).getText(
                                          'f04e2gjs' /* Off */,
                                        ))
                                      ],
                                      onChanged: (val) => setState(() => _model
                                          .privateThreadValue = val?.first),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color: Colors.white,
                                            ),
                                        iconColor: Colors.white,
                                        iconSize: 18.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 10.0, 0.0),
                                        elevation: 4.0,
                                        borderWidth: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        labelPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                10.0, 0.0, 10.0, 0.0),
                                        elevation: 0.0,
                                        borderWidth: 4.0,
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                      chipSpacing: 5.0,
                                      rowSpacing: 12.0,
                                      multiselect: false,
                                      initialized:
                                          _model.privateThreadValue != null,
                                      alignment: WrapAlignment.start,
                                      controller: _model
                                              .privateThreadValueController ??=
                                          FormFieldController<List<String>>(
                                        [
                                          FFLocalizations.of(context).getText(
                                            'iwzcy8qd' /* Off */,
                                          )
                                        ],
                                      ),
                                      wrapped: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 10.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'lfsj18vz' /* Stealth  */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 16.0,
                                      ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 5.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) =>
                                          FlutterFlowChoiceChips(
                                        options: [
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            '72vmn2fg' /* On */,
                                          )),
                                          ChipData(FFLocalizations.of(context)
                                              .getText(
                                            'z916kuh3' /* Off */,
                                          ))
                                        ],
                                        onChanged: (val) => setState(() =>
                                            _model.stealthThreadValue =
                                                val?.first),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Colors.white,
                                                  ),
                                          iconColor: Colors.white,
                                          iconSize: 18.0,
                                          labelPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          elevation: 4.0,
                                          borderWidth: 4.0,
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          iconSize: 18.0,
                                          labelPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 10.0, 0.0),
                                          elevation: 0.0,
                                          borderWidth: 4.0,
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                        ),
                                        chipSpacing: 5.0,
                                        rowSpacing: 12.0,
                                        multiselect: false,
                                        initialized:
                                            _model.stealthThreadValue != null,
                                        alignment: WrapAlignment.start,
                                        controller: _model
                                                .stealthThreadValueController ??=
                                            FormFieldController<List<String>>(
                                          [
                                            valueOrDefault<bool>(
                                                    currentUserDocument
                                                        ?.isStealth,
                                                    false)
                                                ? 'On'
                                                : 'Off'
                                          ],
                                        ),
                                        wrapped: true,
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
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
