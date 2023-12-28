import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'threads_bar_copy_model.dart';
export 'threads_bar_copy_model.dart';

class ThreadsBarCopyWidget extends StatefulWidget {
  const ThreadsBarCopyWidget({
    super.key,
    required this.name,
  });

  final String? name;

  @override
  _ThreadsBarCopyWidgetState createState() => _ThreadsBarCopyWidgetState();
}

class _ThreadsBarCopyWidgetState extends State<ThreadsBarCopyWidget> {
  late ThreadsBarCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThreadsBarCopyModel());

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

    return StreamBuilder<List<SpacesRecord>>(
      stream: querySpacesRecord(
        queryBuilder: (spacesRecord) => spacesRecord.where(
          'name',
          isEqualTo: widget.name,
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
        List<SpacesRecord> columnSpacesRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final columnSpacesRecord = columnSpacesRecordList.isNotEmpty
            ? columnSpacesRecordList.first
            : null;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 500.0,
              constraints: const BoxConstraints(
                minHeight: 150.0,
                maxHeight: 200.0,
              ),
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.network(
                    columnSpacesRecord!.banner,
                  ).image,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: SizedBox(
                width: 500.0,
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 115.0,
                          decoration: const BoxDecoration(
                            color: Color(0xB1000000),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    widget.name,
                                    'Name',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 500.0,
                          constraints: const BoxConstraints(
                            maxHeight: 150.0,
                          ),
                          decoration: const BoxDecoration(
                            color: Color(0xDC000000),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(15.0),
                              bottomRight: Radius.circular(15.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              valueOrDefault<String>(
                                columnSpacesRecord.rules,
                                'rules',
                              ),
                              maxLines: 3,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
