import 'package:get_it/get_it.dart';
import 'package:ttn_flix/data/di/ttn_flix_service_locator.dart';

class TTNFlixServiceLocatorImpl implements TTNFlixServiceLocator {
  static final _ttnFlixServiceLocator = GetIt.instance;

  @override
  void initialise() {
    if (!isRegistered<TTNFlixServiceLocator>()) {
      _ttnFlixServiceLocator.registerSingleton<TTNFlixServiceLocator>(
          TTNFlixServiceLocator.ttnFlixServiceLocator);
    }
  }

  @override
  bool isRegistered<T extends Object>(
      {Object? instance, String? instanceName}) {
    return _ttnFlixServiceLocator.isRegistered<T>(instance: instance);
  }

  @override
  void registerLazySingleton<T extends Object>(
      FactoryFunc<T> factoryFunc, {
        String? instanceName,
        DisposingFunc<T>? dispose,
      }) {
    _ttnFlixServiceLocator.registerLazySingleton<T>(factoryFunc,
        instanceName: instanceName, dispose: dispose);
  }

  @override
  void registerLazySingletonAsync<T extends Object>(
      FactoryFuncAsync<T> factoryFunc, {
        String? instanceName,
        DisposingFunc<T>? dispose,
      }) {
    _ttnFlixServiceLocator.registerLazySingletonAsync<T>(factoryFunc,
        instanceName: instanceName, dispose: dispose);
  }

  @override
  void registerSingleton<T extends Object>(
      T instance, {
        String? instanceName,
        bool? signalsReady,
        DisposingFunc<T>? dispose,
      }) {
    _ttnFlixServiceLocator.registerSingleton<T>(instance,
        instanceName: instanceName,
        signalsReady: signalsReady,
        dispose: dispose);
  }

  @override
  void registerSingletonWithDependencies<T extends Object>(
      FactoryFunc<T> factoryFunc, {
        String? instanceName,
        Iterable<Type>? dependsOn,
        bool? signalsReady,
        DisposingFunc<T>? dispose,
      }) {
    _ttnFlixServiceLocator.registerSingletonWithDependencies<T>(factoryFunc,
        instanceName: instanceName,
        dependsOn: dependsOn,
        signalsReady: signalsReady,
        dispose: dispose);
  }

  @override
  T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return _ttnFlixServiceLocator.get<T>(
        instanceName: instanceName, param1: param1, param2: param2);
  }

  @override
  Future<T> getAsync<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
  }) {
    return _ttnFlixServiceLocator.getAsync<T>(
        instanceName: instanceName, param1: param1, param2: param2);
  }

  @override
  Future<void> isReady<T extends Object>({
    Object? instance,
    String? instanceName,
    Duration? timeout,
    Object? callee,
  }) {
    return _ttnFlixServiceLocator.isReady<T>(
        instance: instance,
        instanceName: instanceName,
        timeout: timeout,
        callee: callee);
  }

  @override
  bool isReadySync<T extends Object>({
    Object? instance,
    String? instanceName,
  }) {
    return _ttnFlixServiceLocator.isReadySync<T>(
        instance: instance, instanceName: instanceName);
  }
}