import 'package:flutter/material.dart';
import 'package:maids_task/core/themes/app_pallete.dart';
import 'package:maids_task/features/home/data/models/task_model.dart';

class TaskTile extends StatelessWidget {
  final TaskModel task;

  const TaskTile(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppPalette.detailsColor),
              child: DefaultTextStyle(
                style: const TextStyle(color: Colors.white),
                child: Row(children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Task ID : ${task.id!}"),
                          const SizedBox(height: 10),
                          Text(task.task!)
                        ]),
                  ),
                  RotatedBox(
                    quarterTurns: 3,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Container(
                            height: 0.8, width: 60, color: Colors.grey[300]),
                        const SizedBox(height: 10),
                        Text(task.completed! ? 'COMPELETED' : 'TODO')
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  getColor(int? color) {
    switch (color) {
      case 0:
        return AppPalette.greenColor;
      case 1:
        return AppPalette.pink;
      case 2:
        return AppPalette.violet;

      default:
        AppPalette.lightOrange;
    }
  }
}
