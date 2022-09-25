import 'package:check_internet/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<InternetCubit>(
      create: (context) => InternetCubit()..checkInternet(),
      child: BlocListener<InternetCubit, InternetState>(
        listener: (BuildContext context, state) {
          BlocProvider.of<InternetCubit>(context);
          if (state is InternetConnect) {
            return showToast(state.text.toString());
          } else if (state is InternetNotConnect) {
            return showToast(state.text.toString(), color: Colors.red);
          }
        },
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
        ),
      ),
    );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('CHECK INTERNET'),
          centerTitle: true,
        ),
      );
}

void showToast(String msg, {Color? color, ToastGravity? gravity}) =>
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      msg: msg,
      backgroundColor: color ?? Colors.green,
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
