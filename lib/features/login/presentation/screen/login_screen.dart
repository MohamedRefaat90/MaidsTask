import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maids_task/core/extension/num_extension.dart';

import '../../../../core/widgets/app_connectivity.dart';
import '../widgets/login_button.dart';
import '../widgets/login_fields.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AppConnectivity(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20)
                  .copyWith(top: 150.height),
              child: DefaultTextStyle(
                style: GoogleFonts.kronaOne(),
                child: const Column(children: [
                  Text(
                    "Welcome to Task Manager",
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(height: 20),
                  LoginFields(),
                  Spacer(),
                  LoginButton(),
                  SizedBox(height: 20),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
