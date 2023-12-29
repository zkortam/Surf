import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'bottom_bar_error_model.dart';
export 'bottom_bar_error_model.dart';

class BottomBarErrorWidget extends StatefulWidget {
  const BottomBarErrorWidget({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  _BottomBarErrorWidgetState createState() => _BottomBarErrorWidgetState();
}

class _BottomBarErrorWidgetState extends State<BottomBarErrorWidget> {
  late BottomBarErrorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BottomBarErrorModel());

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
          width: 600.0,
          height: 50.0,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFF93333), Color(0xFFDA940A)],
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
