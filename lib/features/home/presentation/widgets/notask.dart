import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maids_task/core/resources/assets.dart';

class Notask extends StatelessWidget {
  const Notask({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.noTasks,
          alignment: Alignment.bottomRight,
          width: 150,
          height: 150,
        ),
        Container(
          // width: 350,
          margin: const EdgeInsets.only(top: 10),
          child: const Text('No Tasks Are Addedd Yet !',
              textAlign: TextAlign.center),
        )
      ],
    );
  }
}
