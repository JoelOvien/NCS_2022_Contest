// ignore_for_file: prefer_typing_uninitialized_variables, avoid_dynamic_calls, parameter_assignments

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:validators/sanitizers.dart';

import '../../utilities/helpers.dart';

class ApiClient {
  late http.Client client;
  String? accessToken;
  String baseUrl = "https://";

  bool showError = false;

  ApiClient({
    http.Client? client,
    this.showError = true,
  }) : client = client ?? http.Client();

  Future<dynamic> get(String url, {Map<String, dynamic>? queries}) async {
    if (queries != null) {
      url += queries.keys.fold(
        '?',
        (previousValue, key) => '$previousValue$key=${queries[key]}&',
      );
      url = trim(url, '&');
    }
    Helpers.log("Url: $url");

    var responseJson;
    try {
      final response = await client.get(
        Uri.parse(baseUrl + url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          'Authorization': 'Bearer $accessToken ',
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> delete(String url, {Map<String, dynamic>? queries}) async {
    if (queries != null) {
      url += queries.keys.fold(
        '?',
        (previousValue, key) => '$previousValue$key=${queries[key]}&',
      );
      url = trim(url, '&');
    }
    Helpers.log("Url: $url");

    var responseJson;
    try {
      final response = await client.delete(
        Uri.parse(baseUrl + url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          'Authorization': 'Bearer $accessToken',
        },
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? data}) async {
    Helpers.logc(baseUrl + url);
    Helpers.logc(data.toString());

    var responseJson;
    try {
      final response = await client.post(
        Uri.parse(baseUrl + url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          'Authorization': 'Bearer $accessToken',
        },
        body: json.encode(data),
      );
      log(response.body);

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, {Map<String, dynamic>? data}) async {
    var responseJson;
    try {
      final response = await client.put(
        Uri.parse(baseUrl + url),
        headers: {
          'Content-type': 'application/json',
          "Accept": "application/json",
          'Authorization': 'Bearer $accessToken',
        },
        body: json.encode(data),
      );
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future upload(String url, {required Map<String, dynamic> data}) async {
    final request = http.MultipartRequest('POST', Uri.parse(baseUrl + url));

    data.forEach((key, value) async {
      Helpers.log("$key $value");
      if (value.runtimeType != Null &&
          value.runtimeType != int &&
          value.runtimeType != bool &&
          value.runtimeType != String &&
          value.runtimeType != double) {
        Helpers.logc(":::${value.runtimeType.toString()}");
        request.files.add(
          http.MultipartFile.fromBytes(
            key,
            (value as File).readAsBytesSync(),
            filename: value.path.split('/').last,
          ),
        );
      } else {
        request.fields.putIfAbsent(
          key,
          () => value.runtimeType == bool ? json.encode(value) : value.toString(),
        );
      }
    });

    Helpers.logc(data.values.runtimeType.toString());
    Helpers.logc(data.values.length.toString());
    request.headers.addAll({
      'Content-type': 'application/json',
      "Accept": "application/json",
      'Authorization': 'Bearer $accessToken',
    });
    var responseJson;

    try {
      final res = await client.send(request);
      responseJson = _returnResponse(await http.Response.fromStream(res));
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    try {
      return _getResponse(response);
    } on AppException catch (e) {
      log(">>>>> error is $e");
      if (showError) {}
      rethrow;
    }
  }

  dynamic _getResponse(http.Response response) {
    Helpers.log(json.decode(response.body).toString());
    final code = response.statusCode;
    if (response.body.contains("authenticate")) {
      // UI.showErrorSnack(navigatorKey.currentState!.context, "Session Expired");
      // locator.get<AuthRepository>().logout(navigatorKey.currentState!.context);
    }

    try {
      switch (code) {
        case 400:
          throw BadRequestException(processError(response));
        case 401:
          // if (locator.get<Application>().user.apiToken == null) {}
          throw InvalidTokenException(processError(response));
        case 402:
          throw GeneralErrorException(processError(response));
        case 403:
          throw UnauthorisedException(json.decode(processError(response)));
        case 404:
          throw GeneralErrorException(processError(response));
        case 405:
          throw GeneralErrorException(processError(response));
        case 406:
          throw GeneralErrorException(processError(response));
        case 408:
          throw GeneralErrorException(processError(response));
        case 409:
          throw GeneralErrorException(processError(response));
        case 410:
          throw GeneralErrorException(processError(response));
        case 421:
          throw GeneralErrorException(processError(response));
        case 422:
          throw BadRequestException(processError(response));
        case 423:
          throw GeneralErrorException(processError(response));
        case 424:
          throw GeneralErrorException(processError(response));
        case 425:
          throw GeneralErrorException(processError(response));
        case 426:
          throw GeneralErrorException(processError(response));
        case 429:
          throw GeneralErrorException(processError(response));

        // 500 CASES
        case 500:
          throw ServerErrorException(processError(response));
        case 501:
          throw GeneralErrorException(processError(response));
        case 502:
          throw GeneralErrorException(processError(response));
        case 503:
          throw GeneralErrorException(processError(response));
        case 504:
          throw GeneralErrorException(processError(response));
        case 505:
          throw GeneralErrorException(processError(response));
        case 506:
          throw GeneralErrorException(processError(response));
        case 507:
          throw GeneralErrorException(processError(response));
        case 508:
          throw GeneralErrorException(processError(response));
        case 509:
          throw GeneralErrorException(processError(response));
        case 510:
          throw GeneralErrorException(processError(response));
        case 511:
          throw GeneralErrorException(processError(response));

        default:
          if (!isResponseOk(response.statusCode)) {
            throw FetchDataException('\n StatusCode : ${response.statusCode}.'
                '\n Response: ${response.body}');
          }
          final responseJson = json.decode(response.body);
          return responseJson;
      }
    } catch (e) {
      throw BadRequestException(processError(response));
    }
  }

  bool isResponseOk(int statusCode) {
    return statusCode >= 200 && statusCode <= 299;
  }

  dynamic processError(http.Response response) {
    return json.decode(response.body)["message"] ??
        json.decode(response.body)['error']["message"] ??
        json.decode(response.body)['error']["fields"] ??
        json.decode(response.body)['error']["code"] ??
        json.decode(response.body)["amount"][0];
  }
}

class AppException implements Exception {
  AppException([this.message, this._prefix]);
  final String? message;
  final _prefix;
  @override
  String toString() {
    Helpers.logc(_prefix);
    return "$message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String message = ""]) : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidTokenException extends AppException {
  InvalidTokenException([message]) : super(message, "Invalid Token: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String message = ""]) : super(message, "Invalid Input: ");
}

class ServerErrorException extends AppException {
  ServerErrorException([
    String message =
        "Oh no! Something bad happened but our technical staff have been automatically notified and will be looking into this with the utmost urgency",
  ]) : super(message, "Notice");
}

class GeneralErrorException extends AppException {
  GeneralErrorException([
    String message =
        "Oh no! Something bad happened but our technical staff have been automatically notified and will be looking into this with the utmost urgency",
  ]) : super(message, "Notice");
}
