import 'package:get_it/get_it.dart';
import 'package:smart_jtj/service/navigation_service.dart';
import 'package:smart_jtj/view/home_screen_view_model.dart';
import 'package:smart_jtj/view/smart_light_view_model.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerFactory(() => HomeScreenViewModel());
  getIt.registerFactory(() => SmartLightViewModel());
}
