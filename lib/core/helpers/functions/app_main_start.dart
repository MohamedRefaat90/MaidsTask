import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maids_task/core/di/dependency_injection.dart';
import 'package:maids_task/core/services/sharedprefs.dart';
import 'package:maids_task/features/home/cubit/home_cubit.dart';
import 'package:maids_task/features/home/presentation/screen/home_screen.dart';
import 'package:maids_task/features/login/presentation/screen/login_screen.dart';

Widget appMainStart() {
  if (SharedPreferencesService.getUserID() == null) {
    return const LoginScreen();
  } else {
    return BlocProvider<HomeCubit>(
      create: (context) => getIt(),
      child: const HomeScreen(),
    );
  }
}
