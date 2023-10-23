import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';

String? converjsontobase64(dynamic json) {
  // convert json to base64 encoded
  String jsonString = jsonEncode(json);
  String base64String = base64.encode(utf8.encode(jsonString));
  return base64String;
}

dynamic createjson(
  String merchantId,
  String merchantTransactionId,
  double amount,
  String merchantUserId,
  String redirectUrl,
  String redirectMode,
  String callbackUrl,
  String? mobileNumber,
) {
  // create json from given argument and note that paymentInstrument have type as enum
  return {
    "merchantId": merchantId,
    "merchantTransactionId": merchantTransactionId,
    "amount": amount,
    "merchantUserId": merchantUserId,
    "redirectUrl": redirectUrl,
    "redirectMode": redirectMode,
    "callbackUrl": callbackUrl,
    "mobileNumber": mobileNumber,
    "paymentInstrument": {"type": "PAY_PAGE"}
  };
}
