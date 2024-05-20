import 'package:dio/dio.dart';
import 'package:maids_task/features/home/data/models/task_model.dart';
import 'package:maids_task/features/login/data/model/user_model.dart';
import 'package:retrofit/http.dart';

import 'package:maids_task/core/networking/api_constant.dart';
import 'package:retrofit/retrofit.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseURL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<UserModel> login(@Body() Map<String, dynamic> userInfo);

  @GET("${ApiConstants.allTasks}{id}")
  Future getAllTasks(
      @Path('id') int id, @Query('limit') int limit, @Query('skip') int skip);

  @POST(ApiConstants.addTasks)
  Future addTask(@Body() Map<String, dynamic> newTask);

  @PUT("${ApiConstants.tasks}{id}")
  Future updateTask(@Path('id') int id, @Body() Map<String, dynamic> newTask);

  @DELETE("${ApiConstants.tasks}{id}")
  Future deleteTask(@Path('id') int id);
}
