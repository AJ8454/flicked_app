import 'dart:convert';

import 'package:flicked_app/models/app_config.dart';
import 'package:flicked_app/services/api_services.dart';
import 'package:flicked_app/services/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onInitializationComplete;
  const SplashScreen({Key? key, required this.onInitializationComplete})
      : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _setup(context).then(
      (value) => widget.onInitializationComplete(),
    );
  }

  Future<void> _setup(BuildContext context) async {
    final getIt = GetIt.instance;
    final configFile = await rootBundle.loadString("assets/config/main.json");
    final configData = json.decode(configFile);

    getIt.registerSingleton<AppConfig>(AppConfig(
      apiKey: configData['API_KEY'],
      baseApiUrl: configData['BASE_API_URL'],
      baseImageApiUrl: configData['BASE_IMAGE_API_URL'],
    ));

    getIt.registerSingleton<ApiServices>(ApiServices());
    getIt.registerSingleton<MovieService>(MovieService());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: const Color(0xFFFC6E51),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              width: 200,
              height: 200,
              image: AssetImage("assets/images/logo.jpg"),
            ),
            Text(
              "Loading...",
              style: TextStyle(fontSize: 18, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
