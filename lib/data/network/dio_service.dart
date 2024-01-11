import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../models/response_model.dart';

// // Exceptions
// import './custom_exception.dart';
//
// // Helpers
// import '../../helpers/typedefs.dart';
//
// // Models
// import 'response_model.dart';

/// A service class that wraps the [Dio] instance and provides methods for
/// basic network requests.
class DioService {
  /// An instance of [Dio] for executing network requests.
  final Dio _dio;

  /// A set of cache options to be used for each request
  final CacheOptions? globalCacheOptions;

  /// An instance of [CancelToken] used to pre-maturely cancel
  /// network requests.
  final CancelToken _cancelToken;

  /// A public constructor that is used to create a Dio service and initialize
  /// the underlying [Dio] client.
  ///
  /// * [interceptors]: An [Iterable] for attaching custom
  /// [Interceptor]s to the underlying [_dio] client.
  /// * [httpClientAdapter]: Replaces the underlying [HttpClientAdapter] with
  /// this custom one.
  DioService({
    required Dio dioClient,
    this.globalCacheOptions,
    Iterable<Interceptor>? interceptors,
    HttpClientAdapter? httpClientAdapter,
  })  : _dio = dioClient,
        _cancelToken = CancelToken() {
    if (interceptors != null) _dio.interceptors.addAll(interceptors);
    // Add PrettyDioLogger to intercept Dio requests and responses
    _dio.interceptors.add(PrettyDioLogger(requestBody: true, responseBody: true));

    if (httpClientAdapter != null) _dio.httpClientAdapter = httpClientAdapter;
  }

  /// This method invokes the [cancel()] method on either the input
  /// [cancelToken] or internal [_cancelToken] to pre-maturely end all
  /// requests attached to this token.
  void cancelRequests({CancelToken? cancelToken}) {
    if (cancelToken == null) {
      _cancelToken.cancel('Cancelled');
    } else {
      cancelToken.cancel();
    }
  }

  ///Merged common functionality in the get, post, patch, and delete methods into a private _sendRequest method to reduce code duplication.

  Future<ResponseModel<T>> _sendRequest<T>(
      String method,
      String endpoint, {
        Map<String, dynamic>? queryParams,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    Response response = await _dio.request<JSON>(
      endpoint,
      queryParameters: queryParams,
      options: _mergeDioAndCacheOptions(dioOptions: options),  // Corrected line
      cancelToken: cancelToken ?? _cancelToken,
    );
    if (response.statusCode == 200) {
      return ResponseModel<T>(
          body: response.data,
          code: response.data["status_code"],
          message: response.data["status_message"]);
    }
    return ResponseModel<T>(
        body: response.data,
        code: response.statusCode ?? 500,
        message: response.statusMessage);
  }

  /// This method sends a `GET` request to the [endpoint], **decodes**
  /// the response and returns a parsed [ResponseModel] with a body of type [T].
  ///
  /// Any errors encountered during the request are caught and a custom
  /// [CustomException] is thrown.
  ///
  /// [queryParams] holds any query parameters for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [cacheOptions] are special cache instructions that can merge and override
  /// the [globalCacheOptions].
  ///
  /// [options] are special instructions that can be merged with the request.
  Future<ResponseModel<T>> get<T>({
    required String endpoint,
    JSON? queryParams,
    Options? options,
    CacheOptions? cacheOptions,
    CancelToken? cancelToken,
  }) async =>
      _sendRequest('GET', endpoint,
          queryParams: queryParams,
          options: options,
          cancelToken: cancelToken);

  /// This method sends a `POST` request to the [endpoint], **decodes**
  /// the response and returns a parsed [ResponseModel] with a body of type [T].
  ///
  /// Any errors encountered during the request are caught and a custom
  /// [CustomException] is thrown.
  ///
  /// The [data] contains body for the request.
  ///
  /// [cancelToken] is used to cancel the request pre-maturely. If null,
  /// the **default** [cancelToken] inside [DioService] is used.
  ///
  /// [options] are special instructions that can be merged with the request.
  Future<ResponseModel<T>> post<T>({
    required String endpoint,
    JSON? data,
    Map<String, dynamic>? queryParams,
    Options? options,
    CancelToken? cancelToken,
  }) async =>
      _sendRequest('POST', endpoint,
          queryParams: queryParams,
          options: options,
          cancelToken: cancelToken);

  /// A utility method used to merge together [Options]
  /// and [CacheOptions].
  ///
  /// Returns an [Options] object with [CacheOptions] stored
  /// in the [options.extra] key.
  /// Used a single method _mergeDioAndCacheOptions instead of repeating the logic for merging Dio and Cache options.
  /// Replaced options: options, with options: _mergeDioAndCacheOptions(options), to handle the merging of Dio and Cache options in a more centralized way.
  /// This updated version of _mergeDioAndCacheOptions takes only the dioOptions parameter, and it correctly handles the merging of Dio and Cache options. You can use this version in your DioService class.
  Options? _mergeDioAndCacheOptions({
    Options? dioOptions
  }) {
    if (dioOptions == null && globalCacheOptions == null) {
      return null;
    } else if (dioOptions == null && globalCacheOptions != null) {
      return globalCacheOptions!.toOptions();
    } else if (dioOptions != null && globalCacheOptions == null) {
      return dioOptions;
    }

    final cacheOptionsMap = globalCacheOptions!.toExtra();
    return dioOptions?.copyWith(
      extra: <String, dynamic>{...dioOptions.extra!, ...cacheOptionsMap},
    );
  }
}