import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'bottom_notif_model.dart';
export 'bottom_notif_model.dart';

class BottomNotifWidget extends StatefulWidget {
  const BottomNotifWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  _BottomNotifWidgetState createState() => _BottomNotifWidgetState();
}

class _BottomNotifWidgetState extends State<BottomNotifWidget> {
  late BottomNotifModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomNotifModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 2000));
      Navigator.pop(context);
    });

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

    return Align(
      alignment: const AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
        child: Container(
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF0F66E2), Color(0xFF541BE3)],
              stops: [0.0, 1.0],
              begin: AlignmentDirectional(1.0, 0.0),
              end: AlignmentDirectional(-1.0, 0),
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.text!,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
