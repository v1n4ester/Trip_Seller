import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_seller/cubit/app_cubit_logics.dart';
import 'package:trip_seller/cubit/app_cubits.dart';
import 'package:trip_seller/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (_) => AppCubits(data: DataServices()),
          child: const AppCubitLogics()
          ),
    );
  }
}
