import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:maids_task/features/home/cubit/home_cubit.dart';
import 'package:maids_task/features/home/data/models/task_model.dart';

import 'notask.dart';
import 'task_bottom_sheet.dart';
import 'task_tile.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return context.read<HomeCubit>().taskList.isEmpty
        ? const Notask()
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: context.read<HomeCubit>().taskList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              TaskModel task =
                  TaskModel.fromJson(context.read<HomeCubit>().taskList[index]);

              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(seconds: 1),
                child: SlideAnimation(
                  horizontalOffset: 500,
                  child: FadeInAnimation(
                    child: GestureDetector(
                      onTap: () => taskActions(context, task),
                      child: TaskTile(task),
                    ),
                  ),
                ),
              );
            });
  }
}
