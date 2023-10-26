import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PayAPICall {
  static Future<ApiCallResponse> call({
    String? xVerify = '',
    String? base64 = '',
  }) async {
    final ffApiRequestBody = '''
{
  "request": "${base64}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pay API',
      apiUrl: 'https://api.phonepe.com/apis/hermes/pg/v1/pay',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'X-VERIFY': '${xVerify}',
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

  static dynamic success(dynamic response) => getJsonField(
        response,
        r'''$.success''',
      );
  static dynamic url(dynamic response) => getJsonField(
        response,
        r'''$.data.instrumentResponse.redirectInfo.url''',
      );
  static dynamic merchantTransactionId(dynamic response) => getJsonField(
        response,
        r'''$.data.merchantTransactionId''',
      );
  static dynamic merchantId(dynamic response) => getJsonField(
        response,
        r'''$.data.merchantId''',
      );
  static dynamic message(dynamic response) => getJsonField(
        response,
        r'''$.message''',
      );
  static dynamic code(dynamic response) => getJsonField(
        response,
        r'''$.code''',
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
