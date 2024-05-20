import 'package:maids_task/core/networking/api_result.dart';
import 'package:maids_task/features/home/data/models/task_model.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_services.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<Map<String, dynamic>>> getAllTasks(
      int userID, int limit, int skip) async {
    try {
      var response = await _apiService.getAllTasks(userID, limit, skip);
      return ApiResult.success(response);
    } on Exception catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future addTasks(Map<String, dynamic> newTask) async {
    try {
      await _apiService.addTask(newTask);
    } on Exception catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  deleteTask(int taskID) async {
    await _apiService.deleteTask(taskID);
  }

  Future updateTasks(int taskID, Map<String, dynamic> updatedTask) async {
    try {
      await _apiService.updateTask(taskID, updatedTask);
    } on Exception catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
