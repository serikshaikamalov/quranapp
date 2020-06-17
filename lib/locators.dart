import 'package:get_it/get_it.dart';
import 'package:quranapp/core/services/localstorage.service.dart';
import 'package:quranapp/core/services/navigation.service.dart';

GetIt locator = GetIt.instance;

Future setupLocators() async {
  // Services
  locator.registerLazySingleton(() => NavigationService());

  // Register our object
  final instance = await LocalStorageService.getInstance();
  locator.registerSingleton(instance);

  // Providers
}
