import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maids_task/core/di/dependency_injection.dart';
import 'package:maids_task/core/themes/app_pallete.dart';
import 'package:maids_task/features/home/cubit/home_cubit.dart';
import 'package:maids_task/features/home/presentation/widgets/tasks_view.dart';

import '../../../../core/routing/app_routing.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../../data/data_sources/db_helper.dart';
import 'add_task_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tasks"),
        actions: [
          CustomBTN(
              widget: const Icon(Icons.clear_rounded, color: AppPalette.rose),
              press: () {
                DBHelper.deleteAll();
              })
        ],
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 10, 10),
        child: RefreshIndicator.adaptive(
          onRefresh: () => context.read<HomeCubit>().getAllTasks(),
          child: SingleChildScrollView(
            controller: context.read<HomeCubit>().scrollController,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomBTN(
                      widget: const Text('Add Task'),
                      width: double.infinity,
                      color: AppPalette.violet,
                      press: () {
                        push(BlocProvider<HomeCubit>(
                            create: (context) => getIt(),
                            child: const AddTaskPage()));
                        // _taskController.getTask();
                      }),
                  const SizedBox(height: 10),
                  BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeSuccess || state is LoadingMoreTasks) {
                        return Column(
                          children: [
                            TasksView(),
                            state is LoadingMoreTasks
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : const SizedBox()
                          ],
                        );
                      } else if (state is HomeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    context.read<HomeCubit>().getAllTasks();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<HomeCubit>()
          .scrollController
          .addListener(context.read<HomeCubit>().loadMoreTasks);
    });

    super.initState();
  }
}
