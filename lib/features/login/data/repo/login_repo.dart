import 'package:maids_task/core/networking/api_error_handler.dart';
import 'package:maids_task/core/networking/api_result.dart';
import 'package:maids_task/core/networking/api_services.dart';
import 'package:maids_task/features/login/data/model/user_model.dart';

class loginRepo {
  final ApiService _apiService;

  loginRepo(this._apiService);

  Future<ApiResult<UserModel>> login(Map<String, dynamic> userInfo) async {
    try {
      var response = await _apiService.login(userInfo);

      return ApiResult.success(response);
    } on Exception catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
