import 'package:cleanarchetectureflutterguy/Common/authservice/authservice.dart';
import 'package:cleanarchetectureflutterguy/Presentation/home_screen/ui/homepage.dart';
import 'package:cleanarchetectureflutterguy/Presentation/log_in/ui/login_Screen_ui.dart';
import 'package:cleanarchetectureflutterguy/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/splash_screen_bloc.dart';

class SplashScreenUiWrapper extends StatelessWidget {
  const SplashScreenUiWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenBloc()..add(LoadSplashscreen()),
      child: const SplashScreenUi(),
    );
  }
}

class SplashScreenUi extends StatelessWidget {
  const SplashScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashScreenBloc, SplashScreenState>(
      listener: (context, state) {
        if (state is SplashScreenLoaded) {
          final authtoken = AuthService.getAccessToken();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                authtoken != null ? const Homepagewrappwer() : const LoginScreenUiWrapper(),
          ));
        }
      },
      child: Scaffold(
        body: Center(
          child: Container(
            height: MyApp.height,
            width: MyApp.width,
            color: const Color(0xFFFFFFFF),
            child: Image.asset("assets/images/splashimage.png"),
          ),
        ),
      ),
    );
  }
}
