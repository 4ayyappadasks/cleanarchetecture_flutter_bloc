import 'dart:convert';
import 'dart:developer';

import 'package:cleanarchetectureflutterguy/Presentation/home_screen/ui/homepage.dart';
import 'package:cleanarchetectureflutterguy/Presentation/log_in/widgets/passwordfield/ui/passwordfield.dart';
import 'package:cleanarchetectureflutterguy/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import '../../../Common/authservice/authservice.dart';
import '../bloc/login_screen_bloc.dart';

class LoginScreenUiWrapper extends StatelessWidget {
  const LoginScreenUiWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginScreenBloc(),
      child: LoginScreenUi(),
    );
  }
}

class LoginScreenUi extends StatelessWidget {
  LoginScreenUi({super.key});

  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Welcome Back!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Please login to your account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      hintText: 'Email Address',
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 20),
                  PasswordfieldWrapper(passwordcontroller: password),
                  const SizedBox(height: 30),
                  BlocListener<LoginScreenBloc, LoginScreenState>(
                    listener: (context, state) {
                      if (state is LoginScreenLoaded) {
                        AuthService.saveAccessToken(state.loginEntity.accessToken);
                        Fluttertoast.showToast(
                          msg: "Logged in as ${state.loginEntity.username}",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                        );
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Homepagewrappwer(),));
                      } else if (state is LoginScreenError) {
                        log("API Error: ${state.msg}");
                        Fluttertoast.showToast(
                          msg: state.msg,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                        );
                      }
                    },
                    child: ElevatedButton(
                      onPressed: () {
                        if (email.text.isNotEmpty && password.text.isNotEmpty) {
                          context.read<LoginScreenBloc>().add(LoginEvent(
                            email: email.text,
                            password: password.text,
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
