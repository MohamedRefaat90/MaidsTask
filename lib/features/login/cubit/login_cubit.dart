import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maids_task/core/di/dependency_injection.dart';
import 'package:maids_task/core/networking/api_error_handler.dart';
import 'package:maids_task/features/home/cubit/home_cubit.dart';
import 'package:maids_task/features/login/data/repo/login_repo.dart';

import '../../../core/helpers/functions/snakbar.dart';
import '../../../core/routing/app_routing.dart';
import '../../../core/services/sharedprefs.dart';
import '../../home/presentation/screen/home_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginRepo _repo;

  LoginCubit(this._repo) : super(LoginInitial());

  loginByEmailandPass(BuildContext context) async {
    emit(LoginLoading());
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      // var response = await _repo.login({
      //   "username": emailController.text.trim(),
      //   "password": passwordController.text
      // });
      var response = await _repo.login({
        "username": "kminchelle",
        "password": "0lelplR",
        "expiresInMins": 10000
      });

      response.when(success: (data) {
        SharedPreferencesService.saveUserID(data.id!);
        emit(LoginSuccess());
        Future.delayed(
          const Duration(seconds: 2),
          () {
            resetLoginFields();
            return pushReplacement(BlocProvider(
              create: (context) => HomeCubit(getIt()),
              child: const HomeScreen(),
            ));
          },
        );
      }, failure: (error) {
        emit(LoginFailure());
        if (!context.mounted) return;
        showSnackBar(context, error.apiErrorModel.message!);
      });
    } else {
      showSnackBar(context, "Fields Must Not be Empty");
      emit(LoginFailure());
    }
  }

  logout() async {
    SharedPreferencesService.deleteUserID();
    popAndPushNamed('/Login');
  }

  resetLoginFields() {
    emailController.clear();
    passwordController.clear();
    emit(LoginInitial());
  }
}
