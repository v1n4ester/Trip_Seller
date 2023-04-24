import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_seller/cubit/app_cubit_states.dart';
import 'package:trip_seller/cubit/app_cubits.dart';

import '../pages/detail_page.dart';
import '../pages/nav_pages/main_page.dart';
import '../pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is WelcomeState) {
        return const WelcomePage();
      } else if (state is LoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is LoadedState) {
        return const MainPage();
      } else if (state is DetailState) {
        return const DetailPage();
      }
      return const SizedBox.shrink();
    }));
  }
}
