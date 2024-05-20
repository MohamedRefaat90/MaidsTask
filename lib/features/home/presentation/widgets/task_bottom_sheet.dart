import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maids_task/core/helpers/functions/snakbar.dart';
import 'package:maids_task/core/themes/app_pallete.dart';
import 'package:maids_task/core/widgets/custom_btn.dart';

import '../../cubit/home_cubit.dart';
import '../../data/models/task_model.dart';

PersistentBottomSheetController taskActions(
    BuildContext context, TaskModel task) {
  return showBottomSheet(
    context: context,
    enableDrag: false,
    builder: (context) => Container(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Color.fromARGB(255, 47, 47, 47)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Task ID : ${task.id}",
            style: const TextStyle(
                color: AppPalette.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          const SizedBox(height: 20),
          BlocListener<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is HomeSuccess) {
                Navigator.pop(context);
                showSnackBar(
                    context,
                    "Task ${task.id} Status Change Succssfully",
                    AppPalette.greenColor);
              }
            },
            child: CustomBTN(
                widget: Text(task.completed! ? "TODO" : "Compelete"),
                width: 250,
                color: AppPalette.violet,
                press: () => context.read<HomeCubit>().markTaskComplete(
                    task.id!, task.completed! ? false : true)),
          ),
          const SizedBox(height: 10),
          BlocListener<HomeCubit, HomeState>(
            listener: (context, state) {
              if (state is HomeSuccess) {
                showSnackBar(context, "Task ${task.id} Deleted Succssfully",
                    AppPalette.homeBG);
              }
            },
            child: CustomBTN(
                widget: const Text('Delete Task'),
                color: AppPalette.errorColor,
                width: 250,
                press: () => context.read<HomeCubit>().deleteTask(task.id!)),
          ),
          const Divider(
              height: 20,
              thickness: 3,
              color: AppPalette.white,
              indent: 100,
              endIndent: 100),
          CustomBTN(
              widget: const Text('Cancel'),
              color: AppPalette.lightGreyColor,
              width: 250,
              press: () => Navigator.pop(context))
        ],
      ),
    ),
  );
}
