// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:crypto/crypto.dart';

Future<String> statusSHA(
  String merchantid,
  String transactionId,
  String saltkey,
) async {
  // genrate SHA256("/v3/transaction/{merchantId}/{transactionId}/status" +saltKey)
  String message = "/v3/transaction/$merchantid/$transactionId/status$saltkey";
  var bytes = utf8.encode(message);
  var digest = await sha256.convert(bytes);
  return digest.toString() + "###1";
}
