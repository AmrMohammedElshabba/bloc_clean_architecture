import 'dart:convert';
import 'dart:io';

import 'package:bloc_clean_architecture/core/api_client/remote_response.dart';
import 'package:dio/dio.dart';

/// A Base Remote Service for all the app.
///
/// Has all the methods needed to comunicate with the server.
///
/// Handles [Error]s and [Exception]s respectfully.
///
/// Returns a sailed union of type [RemoteResponse] that contains:
///  * [RemoteResponse.data]
///  * [RemoteResponse.failure]
///  * [RemoteResponse.noConnection]
class RemoteService {
  final Dio _dio;

  /// A Base Remote Service for all the app.
  ///
  /// Has all the methods needed to comunicate with the server.
  ///
  /// Handles [Error]s and [Exception]s respectfully.
  ///
  /// Returns a sailed union of type [RemoteResponse] that contains:
  ///  * [RemoteResponse.data]
  ///  * [RemoteResponse.failure]
  ///  * [RemoteResponse.noConnection]
  ///
  ///
  static var shared = RemoteService(Dio());

  RemoteService(this._dio) {
    _dio
      ..options.connectTimeout = 10000
      ..options.headers.addAll({'Accept': 'text/plain'})
      ..options.responseType = ResponseType.plain
      ..options.validateStatus =
          (int? statusCode) => statusCode == 200 || statusCode == 400;
  }

  /// Perform a POST request.
  Future<RemoteResponse<dynamic>> httpPost(
    String api,
    dynamic body, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.post(
        api,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      final dynamic responseData = jsonDecode(response.data);
      if (response.statusCode == 200) {
        return RemoteResponse.data(
          responseData,
        );
      } else if (response.statusCode == 400) {
        return RemoteResponse.failure(response.data['message']);
      } else {
        return RemoteResponse.failure(response.data['message']);
      }
    } on DioError catch (e) {
      if (e.isNoInternet) {
        return const RemoteResponse.noConnection();
      } else {
        return RemoteResponse.failure(e.message);
      }
    }
  }

  /// Perform a PATCH request.
  Future<RemoteResponse<dynamic>> httpPatch(
    String api,
    dynamic body, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.patch(
        api,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      final dynamic responseData = jsonDecode(response.data);

      if (response.statusCode == 200) {
        return RemoteResponse.data(
          responseData,
        );
      } else if (response.statusCode == 400) {
        return RemoteResponse.failure(response.data['message']);
      } else {
        return RemoteResponse.failure(response.data['message']);
      }
    } on DioError catch (e) {
      if (e.isNoInternet) {
        return const RemoteResponse.noConnection();
      } else {
        return RemoteResponse.failure(e.message);
      }
    }
  }

  /// Perform a PATCH request.
  Future<RemoteResponse<dynamic>> httpPut(
    String api,
    dynamic body, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.put(
        api,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      final dynamic responseData = jsonDecode(response.data);

      if (response.statusCode == 200) {
        return RemoteResponse.data(
          responseData,
        );
      } else if (response.statusCode == 400) {
        return RemoteResponse.failure(response.data['message']);
      } else {
        return RemoteResponse.failure(response.data['message']);
      }
    } on DioError catch (e) {
      if (e.isNoInternet) {
        return const RemoteResponse.noConnection();
      } else {
        return RemoteResponse.failure(e.message);
      }
    }
  }

  /// Perform a GET request.
  Future<RemoteResponse<dynamic>> httpGet(
    String api, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.get(
        api,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      final  responseData = jsonDecode(response.data);

      if (response.statusCode == 200) {
        print(responseData);
        return RemoteResponse.data(
          responseData,
        );

      } else if (response.statusCode == 400) {
        return RemoteResponse.failure(response.data['message']);
      } else {
        return RemoteResponse.failure(response.data['message']);
      }
    } on DioError catch (e) {
      if (e.isNoInternet) {
        return const RemoteResponse.noConnection();
      } else {
        return RemoteResponse.failure(e.message);
      }
    }
  }

  /// Perform a DELETE request.
  Future<RemoteResponse<dynamic>> httpDelete(
    String api, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await _dio.delete(
        api,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      final dynamic responseData = jsonDecode(response.data);

      if (response.statusCode == 200) {
        return RemoteResponse.data(
          responseData,
        );
      } else if (response.statusCode == 400) {
        return RemoteResponse.failure(response.data['message']);
      } else {
        return RemoteResponse.failure(response.data['message']);
      }
    } on DioError catch (e) {
      if (e.isNoInternet) {
        return const RemoteResponse.noConnection();
      } else {
        return RemoteResponse.failure(e.message);
      }
    }
  }
}

extension NoInternet on DioError {
  /// Returns `true` if the error is [SocketException].
  bool get isNoInternet =>
      type == DioErrorType.other && error is SocketException;
}
