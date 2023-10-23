import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'status_page_model.dart';
export 'status_page_model.dart';

class StatusPageWidget extends StatefulWidget {
  const StatusPageWidget({Key? key}) : super(key: key);

  @override
  _StatusPageWidgetState createState() => _StatusPageWidgetState();
}

class _StatusPageWidgetState extends State<StatusPageWidget> {
  late StatusPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // base64
      setState(() {
        _model.base64 = functions.converjsontobase64(functions.createjson(
            'M1RKGWGYZ1PD',
            'UBIU2387',
            100.0,
            'gyf38834889898',
            'phonepay://phonepay.com${GoRouter.of(context).location}',
            'REDIRECT',
            'phonepay://phonepay.com${GoRouter.of(context).location}',
            '78789'));
      });
      await Future.delayed(const Duration(milliseconds: 2000));
      _model.sh256 = await actions.sha256New(
        '8a292621-5ce5-4444-8a71-a43fdb05ed77',
        _model.base64!,
      );
      await Future.delayed(const Duration(milliseconds: 3000));
      setState(() {
        _model.sha256New = _model.sh256;
      });
      await Future.delayed(const Duration(milliseconds: 1000));
      _model.apiResult1c7 = await PhonepayAPICall.call(
        xVerify: _model.sh256,
        requestBase64: _model.base64,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            (_model.apiResult1c7?.succeeded ?? true).toString(),
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 4000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );
      if ((_model.apiResult1c7?.succeeded ?? true)) {
        await launchURL(PhonepayAPICall.url(
          (_model.apiResult1c7?.jsonBody ?? ''),
        ).toString().toString());
        _model.sHAStatus = await actions.newSHA256(
          PhonepayAPICall.datamerchantId(
            (_model.apiResult1c7?.jsonBody ?? ''),
          ).toString().toString(),
          PhonepayAPICall.datamerchantTransactionId(
            (_model.apiResult1c7?.jsonBody ?? ''),
          ).toString().toString(),
          '8a292621-5ce5-4444-8a71-a43fdb05ed77',
        );
        setState(() {
          _model.xverify = _model.sHAStatus;
        });
        while (_model.success) {
          _model.apiResult7zn = await CheckStatusCall.call(
            merchantId: PhonepayAPICall.datamerchantId(
              (_model.apiResult1c7?.jsonBody ?? ''),
            ).toString().toString(),
            transactionId: PhonepayAPICall.datamerchantTransactionId(
              (_model.apiResult1c7?.jsonBody ?? ''),
            ).toString().toString(),
            xVerify: _model.sha256Status,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                (_model.apiResult7zn?.statusCode ?? 200).toString(),
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 4000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
          await Future.delayed(const Duration(milliseconds: 3000));
          setState(() {
            _model.paymentStatus = CheckStatusCall.code(
              (_model.apiResult7zn?.jsonBody ?? ''),
            ).toString().toString();
          });
          await Future.delayed(const Duration(milliseconds: 4000));
          if (_model.paymentStatus == 'PAYMENT_SUCCESS') {
            setState(() {
              _model.success = true;
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  CheckStatusCall.code(
                    (_model.apiResult7zn?.jsonBody ?? ''),
                  ).toString().toString(),
                  style: TextStyle(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                duration: Duration(milliseconds: 4000),
                backgroundColor: FlutterFlowTheme.of(context).secondary,
              ),
            );
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              PhonepayAPICall.message(
                (_model.apiResult1c7?.jsonBody ?? ''),
              ).toString().toString(),
              style: TextStyle(
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
            duration: Duration(milliseconds: 4000),
            backgroundColor: FlutterFlowTheme.of(context).secondary,
          ),
        );
        return;
      }
    });

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
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (_model.paymentStatus == 'PAYMENT_PENDING')
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          'Your Payment Is Still Pending',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 0.0),
                        child: Lottie.asset(
                          'assets/lottie_animations/Pending.json',
                          width: 338.0,
                          height: 363.0,
                          fit: BoxFit.cover,
                          animate: true,
                        ),
                      ),
                    ],
                  ),
                if (_model.paymentStatus == 'PAYMENT_CANCELLED')
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          'Your Payment Is Cancelled',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 0.0),
                        child: Lottie.asset(
                          'assets/lottie_animations/Cancel.json',
                          width: 338.0,
                          height: 363.0,
                          fit: BoxFit.cover,
                          animate: true,
                        ),
                      ),
                    ],
                  ),
                if (_model.paymentStatus == 'PAYMENT_DECLINED')
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          'Your Payment Is Declined',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 0.0),
                        child: Lottie.asset(
                          'assets/lottie_animations/Payment_Decline.json',
                          width: 338.0,
                          height: 363.0,
                          fit: BoxFit.cover,
                          animate: true,
                        ),
                      ),
                    ],
                  ),
                if (_model.paymentStatus == 'PAYMENT_SUCCESS')
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          'Your Payment Is Success',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 0.0),
                        child: Lottie.asset(
                          'assets/lottie_animations/Success.json',
                          width: 338.0,
                          height: 363.0,
                          fit: BoxFit.cover,
                          animate: true,
                        ),
                      ),
                    ],
                  ),
                if (_model.paymentStatus == 'PAYMENT_ERROR')
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.00, 0.00),
                        child: Text(
                          'Your Payment Is Success',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context).displaySmall,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 90.0, 0.0, 0.0),
                        child: Lottie.asset(
                          'assets/lottie_animations/Failed.json',
                          width: 338.0,
                          height: 363.0,
                          fit: BoxFit.cover,
                          animate: true,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
