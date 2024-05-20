import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:maids_task/features/home/data/models/task_model.dart';
import 'package:meta/meta.dart';

import '../../../core/services/sharedprefs.dart';
import '../data/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeInitial());
  final HomeRepo _homeRepo;
  ScrollController scrollController = ScrollController();
  List taskList = [];
  late int totalTasks;
  int limit = 6;
  int skip = 6;
  getAllTasks() async {
    emit(HomeLoading());
    var response = await _homeRepo.getAllTasks(
        SharedPreferencesService.getUserID()!, limit, 0);

    response.when(success: (data) {
      taskList = data['todos'];
      totalTasks = data['total'];

      emit(HomeSuccess());
    }, failure: (errorHandler) {
      emit(HomeFailure());
    });
  }

  addNewTask(Map<String, dynamic> newTask) async {
    emit(HomeLoading());
    await _homeRepo.addTasks(newTask);
    emit(HomeSuccess());
  }

  markTaskComplete(int taskID, bool taskStatus) async {
    emit(HomeLoading());
    await _homeRepo.updateTasks(taskID, {"completed": taskStatus});
    emit(HomeSuccess());
  }

  deleteTask(int taskID) async {
    _homeRepo.deleteTask(taskID);
    taskList.removeWhere((task) => task['id'] == taskID);
    emit(HomeSuccess());
  }

  loadMoreTasks() async {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        (limit <= totalTasks)) {
      emit(LoadingMoreTasks());
      limit += 6;

      var response = await _homeRepo.getAllTasks(
          SharedPreferencesService.getUserID()!, limit, skip);
      response.when(
        success: (data) {
          taskList.addAll(data['todos']);

          emit(HomeSuccess());
        },
        failure: (errorHandler) {},
      );
      emit(HomeSuccess());
    }
  }
}
