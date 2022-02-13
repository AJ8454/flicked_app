import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flicked_app/models/app_config.dart';

class ApiServices {
  final dio = Dio();
  final getIt = GetIt.instance;

  String? _baseUrl;
  String? _apiKey;

  ApiServices() {
    AppConfig _config = getIt.get<AppConfig>();
    _baseUrl = _config.baseApiUrl;
    _apiKey = _config.apiKey;
  }

  Future<Response?> getData(String? _path,
      {Map<String, dynamic>? query}) async {
    try {
      String url = '$_baseUrl/$_path!';
      Map<String, dynamic> _query = {
        "api_key": _apiKey,
        "language": 'en-US',
      };
      if (query != null) {
        _query.addAll(query);
      }
      return await dio.get(url, queryParameters: _query);
    } on DioError catch (e) {
      log("DioError -> $e");
    }
  }
}
