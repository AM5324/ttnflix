import 'package:dio/dio.dart';

import '../network/helper/typedefs.dart';

abstract class ApiInterface {
  const ApiInterface();

  ///
  /// If null, the **default** [cancelToken] inside [DioService] is used.
  void cancelRequests({CancelToken? cancelToken});

  Future<T> getDataFromApi<T>({
    required String endpoint,
    JSON? queryParams,
    CancelToken? cancelToken,
    required T Function(JSON responseBody) converter,
  });

  Future<T> postDataFromApi<T>(
      {required String endpoint,
        required Map<String, dynamic>? queryParam,
        CancelToken? cancelToken,
        required T Function(JSON responseBody) converter});
}