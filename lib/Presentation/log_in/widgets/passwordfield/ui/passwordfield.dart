import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/passwordfiels_bloc.dart';

class PasswordfieldWrapper extends StatelessWidget {
  const PasswordfieldWrapper({super.key, required this.passwordcontroller});

  final TextEditingController passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordfielsBloc(),
      child: Passwordfield(passwordcontroller: passwordcontroller,),
    );
  }
}

class Passwordfield extends StatelessWidget {
  const Passwordfield({super.key, required this.passwordcontroller});

  final TextEditingController passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordfielsBloc, PasswordfielsState>(
      builder: (context, state) {
        return TextField(
          controller: passwordcontroller,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            hintText: 'Password',
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                state.hide?Icons.visibility:Icons.visibility_off,
              ),
              onPressed: () {
                context.read<PasswordfielsBloc>().add(Showpasswordevent());
              },
            ),
          ),
          obscureText: state.hide?true:false,
        );
      },
    );
  }
}

