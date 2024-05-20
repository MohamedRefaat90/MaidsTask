import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:maids_task/features/login/cubit/login_cubit.dart';
import 'package:maids_task/features/login/data/repo/login_repo.dart';

import '../../features/home/cubit/home_cubit.dart';
import '../../features/home/data/repo/home_repo.dart';
import '../networking/api_services.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;
Future<void> setUpGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  getIt.registerLazySingleton<loginRepo>(() => loginRepo(getIt()));

  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));

  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
