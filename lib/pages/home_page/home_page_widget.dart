import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 70.0),
                child: SelectionArea(
                    child: Text(
                  _model.url!,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                )),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 70.0),
                child: SelectionArea(
                    child: Text(
                  valueOrDefault<String>(
                    functions.converjsontobase64(functions.createjson(
                        'M1RKGWGYZ1PD',
                        'UID889896',
                        100.0,
                        'UIDN834gjhg',
                        'phonepay://phonepay.com${GoRouter.of(context).location}',
                        'REDIRECT',
                        'phonepay://phonepay.com${GoRouter.of(context).location}',
                        '945838429')),
                    'null',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                )),
              ),
              SelectionArea(
                  child: Text(
                _model.sha56NEW!,
                style: FlutterFlowTheme.of(context).bodyMedium,
              )),
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: FFButtonWidget(
                  onPressed: () async {
                    var _shouldSetState = false;
                    _model.sha256 = await actions.sha256New(
                      '8a292621-5ce5-4444-8a71-a43fdb05ed77',
                      functions.converjsontobase64(functions.createjson(
                          'M1RKGWGYZ1PD',
                          'UID8gh7g6',
                          100.0,
                          'UIDN83764gjhg',
                          'phonepay://phonepay.com${GoRouter.of(context).location}',
                          'REDIRECT',
                          'phonepay://phonepay.com${GoRouter.of(context).location}',
                          '945838429'))!,
                    );
                    _shouldSetState = true;
                    setState(() {
                      _model.sha56NEW = _model.sha256;
                    });
                    await Future.delayed(const Duration(milliseconds: 1000));
                    _model.apiResultsg2 = await PayAPICall.call(
                      xVerify: _model.sha56NEW,
                      base64: functions.converjsontobase64(functions.createjson(
                          'M1RKGWGYZ1PD',
                          'UID8gh7g6',
                          100.0,
                          'UIDN83764gjhg',
                          'phonepay://phonepay.com${GoRouter.of(context).location}',
                          'REDIRECT',
                          'phonepay://phonepay.com${GoRouter.of(context).location}',
                          '945838429')),
                    );
                    _shouldSetState = true;
                    if ((_model.apiResultsg2?.succeeded ?? true)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            PayAPICall.url(
                              (_model.apiResultsg2?.jsonBody ?? ''),
                            ).toString(),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      setState(() {
                        _model.url = PayAPICall.url(
                          (_model.apiResultsg2?.jsonBody ?? ''),
                        ).toString();
                      });
                      await launchURL(PayAPICall.url(
                        (_model.apiResultsg2?.jsonBody ?? ''),
                      ).toString());
                      if (_shouldSetState) setState(() {});
                      return;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            (_model.apiResultsg2?.statusCode ?? 200).toString(),
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondary,
                        ),
                      );
                      if (_shouldSetState) setState(() {});
                      return;
                    }

                    if (_shouldSetState) setState(() {});
                  },
                  text: 'Generate SHA256',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
