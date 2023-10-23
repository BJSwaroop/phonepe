import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PhonepayAPICall {
  static Future<ApiCallResponse> call({
    String? xVerify = '',
    String? requestBase64 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "request": "${requestBase64}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Phonepay API',
      apiUrl: 'https://api.phonepe.com/apis/hermes/pg/v1/pay',
      callType: ApiCallType.POST,
      headers: {
        'X-VERIFY': '${xVerify}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.data.instrumentResponse.redirectInfo.url''',
      );
  static dynamic code(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic datamerchantId(dynamic response) => getJsonField(
        response,
        r'''$.data.merchantId''',
      );
  static dynamic datamerchantTransactionId(dynamic response) => getJsonField(
        response,
        r'''$.data.merchantTransactionId''',
      );
  static dynamic success(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  static dynamic datainstrumentResponsetype(dynamic response) => getJsonField(
        response,
        r'''$.data.instrumentResponse.type''',
      );
}

class CheckStatusCall {
  static Future<ApiCallResponse> call({
    String? merchantId = '',
    String? transactionId = '',
    String? xVerify = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Check status',
      apiUrl:
          'https://mercury-t2.phonepe.com/v3/transaction/${merchantId}/${transactionId}/status',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type\t': 'application/json',
        'X-VERIFY': '${xVerify}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic code(dynamic response) => getJsonField(
        response,
        r'''$.code''',
      );
  static dynamic datapayResponseCode(dynamic response) => getJsonField(
        response,
        r'''$.data.payResponseCode''',
      );
  static dynamic datapaymentState(dynamic response) => getJsonField(
        response,
        r'''$.data.paymentState''',
      );
  static dynamic datapaidAmount(dynamic response) => getJsonField(
        response,
        r'''$.data.paidAmount''',
      );
  static dynamic datatransactionId(dynamic response) => getJsonField(
        response,
        r'''$.data.transactionId''',
      );
  static dynamic datamerchantId(dynamic response) => getJsonField(
        response,
        r'''$.data.merchantId''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
