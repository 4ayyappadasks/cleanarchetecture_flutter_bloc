import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Common/authservice/authservice.dart';
import 'Presentation/spalsh_screen/ui/splash_screen_ui.dart';

void main()  async {
  await Hive.initFlutter();
  await Hive.openBox('authBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  static var height = 0.0;
  static var  width = 0.00;
  final accessToken = AuthService.getAccessToken();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreenUiWrapper(),
    );
  }
}
