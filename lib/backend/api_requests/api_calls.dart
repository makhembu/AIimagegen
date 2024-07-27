import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LeonardoCall {
  static Future<ApiCallResponse> call({
    String? prompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "height": 512,
  "prompt": "$prompt",
  "modelId": "aa77f04e-3eec-4034-9c07-d0f619684628",
  "width": 512,
  "alchemy": true,
  "photoReal": true,
  "photoRealVersion":"v2",
  "presetStyle": "CINEMATIC"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'leonardo',
      apiUrl: 'https://cloud.leonardo.ai/api/rest/v1/generations',
      callType: ApiCallType.POST,
      headers: {
        'accept': 'application/json',
        'authorization': 'Bearer c767a347-672d-40a2-aa40-5c800d2ee927',
        'content-type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? generationId(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.sdGenerationJob.generationId''',
      ));
}

class LeonardoGetCall {
  static Future<ApiCallResponse> call({
    String? genid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'leonardo get',
      apiUrl: 'https://cloud.leonardo.ai/api/rest/v1/generations/$genid',
      callType: ApiCallType.GET,
      headers: {
        'accept': 'application/json',
        'authorization': 'Bearer c767a347-672d-40a2-aa40-5c800d2ee927',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? generatedimageurls(dynamic response) => (getJsonField(
        response,
        r'''$.generations_by_pk.generated_images[:].url''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
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

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
