import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() {
  getIt.registerLazySingleton<Dio>(
      () => Dio(BaseOptions(baseUrl: 'https://tour-de-france-be-de8b48397b33.herokuapp.com')));
  getIt.init();
}