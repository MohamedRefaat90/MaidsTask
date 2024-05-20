import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maids_task/core/di/dependency_injection.dart';
import 'package:maids_task/core/helpers/functions/snakbar.dart';
import 'package:maids_task/core/routing/app_routing.dart';
import 'package:maids_task/core/services/sharedprefs.dart';
import 'package:maids_task/core/themes/app_pallete.dart';
import 'package:maids_task/core/widgets/custom_btn.dart';
import 'package:maids_task/features/home/cubit/home_cubit.dart';
import 'package:maids_task/features/home/data/data_sources/db_helper.dart';
import 'package:maids_task/features/home/data/models/task_model.dart';
import 'package:maids_task/features/home/presentation/screen/home_screen.dart';

import '../widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 50),
              InputField(
                title: 'Task',
                hint: 'Enter Task',
                txtController: _taskController,
              ),
              const SizedBox(height: 40),
              BlocConsumer<HomeCubit, HomeState>(
                listener: (context, state) async {
                  if (state is HomeSuccess) {
                    pushAndRemoveUntil(BlocProvider<HomeCubit>(
                      create: (context) => getIt(),
                      child: const HomeScreen(),
                    ));
                  }
                },
                builder: (context, state) {
                  return CustomBTN(
                      widget: state is HomeLoading
                          ? const SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                  color: AppPalette.white),
                            )
                          : const Text("Add Task"),
                      width: 200,
                      color: Colors.amber,
                      press: () {
                        if (_taskController.text.isEmpty) {
                          showSnackBar(context, 'Field Must Not Be Empty!!');
                        } else {
                          context.read<HomeCubit>().addNewTask(TaskModel(
                                  completed: false,
                                  userId: SharedPreferencesService.getUserID(),
                                  task: _taskController.text)
                              .toJson());
                          DBHelper.insert(TaskModel(
                            task: _taskController.text,
                            completed: 0,
                            userId: SharedPreferencesService.getUserID(),
                          ).toJson());
                        }
                      });
                },
              )
            ],
          )),
    );
  }
}
