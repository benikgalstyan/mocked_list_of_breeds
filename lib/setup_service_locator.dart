import 'package:get_it/get_it.dart';
import 'package:mocked_list_of_breeds/data/repository/repository.dart';
import 'package:mocked_list_of_breeds/data/repository/repository_impl.dart';
import 'package:mocked_list_of_breeds/data/services/network_service.dart';
import 'package:mocked_list_of_breeds/data/services/network_service_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  NetworkService service = NetworkServiceImpl();
  getIt.registerSingleton<NetworkService>(service);
  getIt.registerSingleton<Repository>(RepositoryImpl(service));
}
