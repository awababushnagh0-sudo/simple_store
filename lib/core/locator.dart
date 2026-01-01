import 'package:get_it/get_it.dart';
import 'package:simple_store/core/services/app_services.dart';
import 'package:simple_store/features/products/data/product_repo.dart';

GetIt getit = GetIt.instance;

void setupLocator() {
  getit.registerSingleton<AppServices>(
    AppServices(url: '69562f1db9b81bad7af25783.mockapi.io'),
  );
  getit.registerLazySingleton<ProductRepo>(() => ProductRepo());
}
