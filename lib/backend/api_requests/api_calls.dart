import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ConsultaHashCall {
  static Future<ApiCallResponse> call({
    String? licensePlate = '',
    String? uf = '',
    String? renavam = '',
  }) async {
    final ffApiRequestBody = '''
{
  "uf": "${uf}",
  "renavam": "${renavam}",
  "license_plate": "${licensePlate}",
  "callback_url": "http://www.suaurl.com/callback?transaction_id=123"
}''';
    debugPrint('[API] ConsultaHashCall body:\n$ffApiRequestBody');
    return ApiManager.instance.makeApiCall(
      callName: 'ConsultaHash',
      apiUrl:
          'https://integrador.pinpag.com.br/web-despachantes/debits',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'pBnuGMgIO5aevXGbVonf75K7O7KRrvjK4Z4Zj7CL',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? consultid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.consult_id''',
      ));
}

class ConsultaDebitosCall {
  static Future<ApiCallResponse> call({
    String? codTemporario = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ConsultaDebitos',
      apiUrl:
          'https://integrador.pinpag.com.br/web-despachantes/debits',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'pBnuGMgIO5aevXGbVonf75K7O7KRrvjK4Z4Zj7CL',
      },
      params: {
        'consult_id': codTemporario,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? proprietario(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.vehicle.owner_name''',
      ));
  static List? debits(dynamic response) => getJsonField(
        response,
        r'''$['debits']''',
        true,
      ) as List?;
  static List<String>? descricaoInfracaoDetalhada(dynamic response) =>
      (getJsonField(
        response,
        r'''$['debits'][*]['ticket_description']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<int>? valorInfracao(dynamic response) => (getJsonField(
        response,
        r'''$['debits'][*]['value']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  static List<String>? descricaoInfracao(dynamic response) => (getJsonField(
        response,
        r'''$['debits'][*]['ticket_agency']''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? tipoInfracao(dynamic response) => (getJsonField(
        response,
        r'''$['debits'][*].type''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? documento(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.vehicle.owner_document''',
      ));
  static String? placa(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.vehicle.license_plate''',
      ));
  static String? renavam(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.vehicle.renavam''',
      ));
  static String? uf(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.vehicle.uf''',
      ));
  static List<String>? local(dynamic response) => (getJsonField(
        response,
        r'''$.debits[:].ticket_county''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? debitid(dynamic response) => (getJsonField(
        response,
        r'''$.debits[:].debit_id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class PagamentoDebitosCall {
  static Future<ApiCallResponse> call({
    String? codTemporario = '',
    String? name = '',
    String? document = '',
    String? debits = '',       // já vem formatado como ["id1","id2"] via aspasDuplas()
    int? totalAmount,
    int? serviceAmount,
    String? intermediaryDocument = '',
    String? callbackUrl = '',
    String? redirectUrl = '',
    dynamic? stringJSONJson,
  }) async {
    // total_amount e service_amount DEVEM ser integers (sem aspas) no JSON.
    // debits DEVE ser um array JSON real — o valor já vem pré-formatado como ["id1","id2"].
    final ffApiRequestBody = '''
{
  "consult_id": "${codTemporario}",
  "name": "${name}",
  "document": "${document}",
  "debits": ${debits},
  "service_amount": ${serviceAmount},
  "total_amount": ${totalAmount},
  "intermediary_document": "${intermediaryDocument}",
  "callback_url": "${callbackUrl}",
  "redirect_url": "${redirectUrl}"
}''';
    debugPrint('[API] PagamentoDebitosCall body:\n$ffApiRequestBody');
    return ApiManager.instance.makeApiCall(
      callName: 'PagamentoDebitos',
      apiUrl:
          'https://integrador.pinpag.com.br/web-despachantes/calculate-installments',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-api-key': 'pBnuGMgIO5aevXGbVonf75K7O7KRrvjK4Z4Zj7CL',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? uuid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uuid''',
      ));
  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.url''',
      ));
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
