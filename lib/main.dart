import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maids_task/core/di/dependency_injection.dart';
import 'package:maids_task/core/networking/api_services.dart';
import 'package:maids_task/core/networking/dio_factory.dart';
import 'package:maids_task/core/themes/app_theme.dart';
import 'package:maids_task/features/home/cubit/home_cubit.dart';
import 'package:maids_task/features/home/data/repo/home_repo.dart';
import 'package:maids_task/features/home/presentation/screen/home_screen.dart';
import 'package:maids_task/features/login/cubit/login_cubit.dart';
import 'package:maids_task/features/login/presentation/screen/login_screen.dart';

import 'core/services/initServices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppServices.init();
  runApp(const TaskManager());
}

final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

class TaskManager extends StatelessWidget {
  const TaskManager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt()),
      // create: (context) => HomeCubit(HomeRepo(ApiService(DioFactory.getDio()))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTthemeMode,
        navigatorKey: navigator,
        // home: const HomeScreen(),
        home: const LoginScreen(),
      ),
    );
  }
}
