// Services
import 'package:dio/dio.dart';
import 'package:ttn_flix/data/di/ttn_flix_service_locator.dart';

import 'dio_service.dart';
import '../network/helper/typedefs.dart';
import 'api_interface.dart';
import 'dio_custom_exception.dart';

/// A service class implementing methods for basic API requests.
class DioApiClient implements ApiInterface {
  /// An instance of [DioService] for network requests
  /// A public constructor that is used to initialize the API service
  /// and setup the underlying [_dioService].
   final DioService _dioService = TTNFlixSL.get<DioService>();
  /// An implementation of the base method for cancelling
  /// requests pre-maturely using the [cancelToken].
  ///
  /// If null, the **default** [cancelToken] inside [DioService] is used.
  @override
  void cancelRequests({CancelToken? cancelToken}) {
    _dioService.cancelRequests(cancelToken: cancelToken);
  }

  @override
  Future<T> getDataFromApi<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    required T Function(JSON responseBody) converter,
  }) async {
    Object? body;
    try {
      // Entire map of response
      final data = await _dioService.get<Object?>(
        endpoint: endpoint,
        queryParams: queryParams,
        cancelToken: cancelToken,
      );

      // Items of table as json
      body = data.body;
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }
    return getDeserializedObject(converter, body!);
  }

  @override
  Future<T> postDataFromApi<T>({
    required String endpoint,
    required Map<String, dynamic>? queryParam,
    CancelToken? cancelToken,
    required T Function(JSON responseBody) converter,
  }) async {
    Object? body;
    try {
      // Entire map of response
      final data = await _dioService.post<Object?>(
        endpoint: endpoint,
        queryParams: queryParam,
        cancelToken: cancelToken,
      );

      // Items of table as json
      body = data.body;
    } on Exception catch (ex) {
      throw CustomException.fromDioException(ex);
    }
    return getDeserializedObject(converter, body!);
  }

  getDeserializedObject(Function(JSON responseBody) converter, Object body) {
    try {
      // Returning the deserialized objects
      return converter(body as JSON);
    } on Exception catch (ex) {
      throw CustomException.fromParsingException(ex);
    }
  }
}
