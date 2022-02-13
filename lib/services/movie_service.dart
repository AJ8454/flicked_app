import 'package:flicked_app/services/api_services.dart';
import 'package:get_it/get_it.dart';

class MovieService {
  final getIt = GetIt.instance;

  ApiServices? _apiServices;

  MovieService() {
    _apiServices = getIt.get<ApiServices>();
  }
}
