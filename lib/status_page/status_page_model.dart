import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'status_page_widget.dart' show StatusPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class StatusPageModel extends FlutterFlowModel<StatusPageWidget> {
  ///  Local state fields for this page.

  bool success = false;

  String? sha256Status = '';

  String? paymentStatus = 'PAYMENT_PENDING';

  String? xverify = '';

  String? sha256New = '';

  String? base64 = '';

  String? newPS = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - sha256New] action in StatusPage widget.
  String? sh256;
  // Stores action output result for [Backend Call - API (Phonepay API)] action in StatusPage widget.
  ApiCallResponse? apiResult1c7;
  // Stores action output result for [Custom Action - newSHA256] action in StatusPage widget.
  String? sHAStatus;
  // Stores action output result for [Backend Call - API (Check status)] action in StatusPage widget.
  ApiCallResponse? apiResult7zn;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
