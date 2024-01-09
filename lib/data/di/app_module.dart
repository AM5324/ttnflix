import 'package:dio/dio.dart';
import 'package:ttn_flix/data/di/ttn_flix_service_locator.dart';
import 'package:ttn_flix/data/di/ttn_flix_service_locator_imple.dart';

import '../network/dio_api_client.dart';
import '../network/dio_service.dart';

class AppModule {
  Future<void> initialise() async {
    // Initialise service provider
    TTNFlixServiceLocatorImpl().initialise();
    final serviceLocator = TTNFlixServiceLocator.ttnFlixServiceLocator;
    /**
     * use serviceLocator to register other dependencies as singleton like
     * if (!serviceLocator.isRegistered<LocalPersistence>()) {
     * serviceLocator.registerSingleton(localPersistence);
     * }
     * */

    // Dio Service
    if (!serviceLocator.isRegistered<DioService>()) {
      serviceLocator.registerSingleton(DioService(dioClient: Dio()));
    }

    // Dio Http Client
    if (!serviceLocator.isRegistered<DioApiClient>()) {
      serviceLocator.registerSingleton(DioApiClient());
    }
  }
}