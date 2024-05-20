import 'package:flutter/material.dart';

AppBar appBar(BuildContext context, {Widget? deleteTasks}) => AppBar(
      toolbarHeight: 70,
      elevation: 0,
      actions: [
        deleteTasks ?? Container(),
        // const CircleAvatar(backgroundImage: NetworkImage()),
        const SizedBox(width: 20),
      ],
    );
