import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'edit_thread_model.dart';
export 'edit_thread_model.dart';

class EditThreadWidget extends StatefulWidget {
  const EditThreadWidget({
    super.key,
    required this.thread,
  });

  final ThreadRecord? thread;

  @override
  _EditThreadWidgetState createState() => _EditThreadWidgetState();
}

class _EditThreadWidgetState extends State<EditThreadWidget> {
  late EditThreadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditThreadModel());

    _model.textController ??=
        TextEditingController(text: widget.thread?.thread.text);
    _model.textFieldFocusNode ??= FocusNode();

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

    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(
          minHeight: 90.0,
          maxHeight: 340.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF0F66E2), Color(0xFF541BE3)],
                    stops: [0.0, 1.0],
                    begin: AlignmentDirectional(1.0, 0.0),
                    end: AlignmentDirectional(-1.0, 0),
                  ),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 5.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.white,
                        borderRadius: 20.0,
                        borderWidth: 3.0,
                        buttonSize: 30.0,
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 15.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '225iljg9' /* Edit Thread */,
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 5.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.white,
                        borderRadius: 20.0,
                        borderWidth: 3.0,
                        buttonSize: 30.0,
                        icon: const FaIcon(
                          FontAwesomeIcons.check,
                          color: Colors.white,
                          size: 14.0,
                        ),
                        onPressed: () async {
                          await widget.thread!.reference
                              .update(createThreadRecordData(
                            thread: createThreadStruct(
                              text: _model.textController.text,
                              clearUnsetFields: false,
                            ),
                          ));
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Outfit',
                        fontSize: 13.0,
                      ),
                  hintStyle: FlutterFlowTheme.of(context).labelMedium,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Outfit',
                      fontSize: 13.0,
                    ),
                validator: _model.textControllerValidator.asValidator(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
