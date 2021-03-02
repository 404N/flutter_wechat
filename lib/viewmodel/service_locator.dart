import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // services
  // serviceLocator.registerLazySingleton<WebApi>(() => WebApiImpl());
  // serviceLocator.registerLazySingleton<StorageService>(() => StorageServiceImpl());
  // serviceLocator.registerLazySingleton<CurrencyService>(() => CurrencyServiceImpl());
  //
  // // You can replace the actual services above with fake implementations during development.
  //
  // // view models
  // serviceLocator.registerFactory<HomeIndexViewModel>(() => HomeIndexViewModel());
  // serviceLocator.registerFactory<NoteViewModel>(() => NoteViewModel());
  // serviceLocator.registerFactory<CalculateScreenViewModel>(() => CalculateScreenViewModel());
  // serviceLocator.registerFactory<ChooseFavoritesViewModel>(() => ChooseFavoritesViewModel());
  // serviceLocator.registerFactory<ColorsTransformViewModel>(() => ColorsTransformViewModel());
}