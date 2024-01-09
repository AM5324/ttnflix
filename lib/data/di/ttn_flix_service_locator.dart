import 'package:get_it/get_it.dart';
import 'package:ttn_flix/data/di/ttn_flix_service_locator_imple.dart';


abstract class TTNFlixServiceLocator {
  void initialise();

  static final TTNFlixServiceLocator ttnFlixServiceLocator = TTNFlixServiceLocatorImpl();

  bool isRegistered<T extends Object>({Object? instance, String? instanceName});

  void registerLazySingleton<T extends Object>(
      FactoryFunc<T> factoryFunc, {
        String? instanceName,
        DisposingFunc<T>? dispose,
      });

  void registerLazySingletonAsync<T extends Object>(
      FactoryFuncAsync<T> factoryFunc, {
        String? instanceName,
        DisposingFunc<T>? dispose,
      });

  void registerSingleton<T extends Object>(
      T instance, {
        String? instanceName,
        bool? signalsReady,
        DisposingFunc<T>? dispose,
      });

  void registerSingletonWithDependencies<T extends Object>(
      FactoryFunc<T> factoryFunc, {
        String? instanceName,
        Iterable<Type>? dependsOn,
        bool? signalsReady,
        DisposingFunc<T>? dispose,
      });

  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  });

  Future<T> getAsync<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  });

  Future<void> isReady<T extends Object>({
    Object? instance,
    String? instanceName,
    Duration? timeout,
    Object? callee,
  });

  bool isReadySync<T extends Object>({
    Object? instance,
    String? instanceName,
  });
}

class TTNFlixSL {
  static T get<T extends Object>([T? instance]) {
    return instance ?? TTNFlixServiceLocator.ttnFlixServiceLocator.get<T>();
  }
}